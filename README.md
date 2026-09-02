# work-demo

这是一个以 **Protobuf + Ent** 为核心的 Go 服务框架示例。它把 HTTP 网关、RPC 服务和数据访问层放在同一个仓库中，先保持开发和联调简单，再为服务拆分、独立部署留下边界。

## 整体思路

请求从网关进入，网关根据接口类型选择不同的处理方式：

```text
HTTP Client
    |
    v
HTTP Gateway (8080)
    |-- 业务编排接口 /works/:workID
    |       |-- RPC -> 作品服务 (8890) -> works
    |       `-- RPC -> 用户服务 (8889) -> users
    |
    |-- 泛化转发 /test/*、/testjson/*
    |       `-- Generic RPC -> TestService (8888)
    |
    `-- 网关本地业务 /sum
            `-- SumService in gateway process
```

当前所有服务代码都在一个仓库里，便于共享 Protobuf、生成代码、配置和本地调试。服务之间通过 RPC 通信，网关不直接依赖业务服务的数据库。

当服务数量增加时，可以沿着现有边界拆分：将某个服务的 `cmd`、`internal/service`、`internal/server`、IDL 和生成代码迁移到独立仓库，网关只保留对应的 RPC client 和协议依赖；调用方式不需要改变。

## 三类 API 设计

| API 定义 | 定位 | 请求链路 | 适用场景 |
| --- | --- | --- | --- |
| `api/work/work.proto` | 作品服务的强类型业务接口 | 网关调用作品服务，再调用用户服务，组装聚合响应 | 需要跨服务编排、聚合和协议适配的业务接口 |
| `api/test/test_api.proto` | 泛化调用、透明转发 | 网关按路径取得方法名，将 protobuf 或 JSON 请求转发到 TestService | 网关只负责鉴权、路由、限流和协议转换，下游负责业务逻辑 |
| `api/sum/sum.proto` | 网关本地业务 | 网关进程内直接执行 `SumService.Add` | 轻量、低依赖或网关专属的业务逻辑 |

`api/work/work.proto` 与 `idl/work/work.proto` 分别描述网关 HTTP 契约和作品服务 RPC 契约。`GET /works/:workID` 会先调用 `WorkService.GetWork` 查询作品，再调用 `UserService.GetUser` 查询用户，最后由网关组装响应。

`api/test/test_api.proto` 与 `idl/test/test.proto` 配合使用。`/test/*` 进行 protobuf 二进制透明转发，`/testjson/*` 使用 descriptor 完成 JSON 泛化编解码；新增方法通常不需要新增网关业务 handler。

如果网关本地业务逐渐变复杂，可以保持 Protobuf 契约不变，再迁移到独立 RPC 服务，HTTP API 无需变化。

## 目录职责

```text
api/                         HTTP API Protobuf（网关输入）
idl/                         RPC Protobuf（服务输入）
generated-rpc/                RPC 生成的 client/server 代码
internal/gateway/            网关路由、handler、RPC client registry
internal/service/<name>/     服务业务逻辑、repository 和 Ent 数据层
internal/server/<name>/      RPC/HTTP server 装配与启动
cmd/<name>/                  各进程的 Cobra 命令和 Wire 依赖注入
cmd/entgen/                  扫描各服务 schema 并生成 Ent 代码
sql/init.sql                 示例 MySQL 表结构和种子数据
```

网关的生成路由位于 `internal/gateway/router` 和 `internal/gateway/handler`。手写的透明代理和 `/ping` 放在自定义注册逻辑中，避免重新生成路由时被覆盖。

## ORM 与代码生成

数据访问使用 Ent。每个服务在 `internal/service/<service>/data/ent/schema` 编写 schema，`cmd/entgen` 会扫描所有服务并把生成结果写回同一服务的 `data/ent` 目录。这样数据库模型和 repository 仍归服务自己所有，不会被网关共享。

常用生成命令：

```bash
# 安装代码生成工具
make install

# 生成 RPC、Ent、Wire 代码
make gen

# 生成跨语言客户端（按需安装对应 protoc 插件）
make -C api gen-api-clients
```

HTTP 路由和 handler 骨架使用仓库 Makefile 中的专用生成目标更新。

生成链路的输入和输出是分开的：`idl/*.proto` 生成 RPC 代码，`api/*.proto` 生成网关代码；修改 IDL 后重新执行对应命令即可。提交代码时应同时提交需要运行的生成结果，保证没有生成工具的环境也能编译。

## 启动与配置

服务从根目录 `cmd` 启动：`gateway` 提供 HTTP 接口，`test`、`user`、`work` 提供 RPC 接口。默认地址分别为 `127.0.0.1:8080`、`127.0.0.1:8888`、`127.0.0.1:8889` 和 `127.0.0.1:8890`，本地联调时分别启动四个进程。

用户服务和作品服务默认使用 MySQL DSN：

```text
root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local
```

可通过环境变量 `MYSQL_DSN` 覆盖。启动数据库后执行 `sql/init.sql`，即可使用 user=1、work=1 示例数据。

## CI 与发布分支

`.github/workflows/generate-api-clients-tag.yml` 监听 tag 推送。每次发布 tag 时，CI 会安装代码生成工具，重新生成各语言 API 客户端、RPC 代码、网关代码、Ent 代码和依赖注入代码，然后把这些生成产物同步到发布分支。

发布分支名称为 `realese-<tag>`，例如推送 `v1.2.0` 后生成 `realese-v1.2.0`。如果分支不存在，CI 会从本次 tag 创建；如果已经存在，则在原分支上更新。只有生成内容发生变化时才提交，提交信息为 `generate API clients for <tag>`。

该分支专门保存与某个发布版本对应的生成结果，便于下游客户端按 tag 获取稳定代码；业务源码仍以主开发分支为准。

## curl 测试

| 场景 | 命令 | 说明 |
| --- | --- | --- |
| 网关本地业务 | `curl 'http://127.0.0.1:8080/sum?left=12&right=30'` | 返回 `{"result":42}` |
| 作品服务聚合接口 | `curl 'http://127.0.0.1:8080/works/1'` | 网关调用作品服务和用户服务后返回聚合结果 |
| protobuf 泛化转发 | `curl -X POST 'http://127.0.0.1:8080/test/TestFields' -H 'Content-Type: application/protobuf' --data-binary @request.bin -o response.bin` | 将二进制请求透明转发到测试服务 |
| JSON 泛化转发 | `curl -X POST 'http://127.0.0.1:8080/testjson/TestFields' -H 'Content-Type: application/json' -d '{"int32_value":-7,"string_value":"compatibility","enum_value":1}'` | 将 JSON 请求泛化转发到测试服务 |

生成 protobuf 请求文件：

```bash
cat <<'EOF' | protoc -I api \
  --encode=test.TestFieldsRequest \
  api/test/test_api.proto > request.bin
int32_value: -7
string_value: "compatibility"
enum_value: COMPATIBILITY_ENUM_FIRST
repeated_strings: "first"
repeated_strings: "second"
EOF
```

解码 protobuf 响应文件：

```bash
protoc -I api \
  --decode=test.TestFieldsResponse \
  api/test/test_api.proto < response.bin
```
