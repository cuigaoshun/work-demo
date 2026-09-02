# work-demo

这是一个以 **Hertz + Kitex + Protobuf + Ent** 为核心的 Go 服务框架示例。它把 HTTP 网关、RPC 服务和数据访问层放在同一个仓库中，先保持开发和联调简单，再为服务拆分、独立部署留下边界。

## 整体思路

请求从网关进入，网关根据接口类型选择不同的处理方式：

```text
HTTP Client
    |
    v
Hertz Gateway (8080)
    |-- 业务编排接口 /works/:workID
    |       |-- RPC -> WorkService (8890) -> works
    |       `-- RPC -> UserService (8889) -> users
    |
    |-- 泛化转发 /test/*、/testjson/*
    |       `-- Generic RPC -> TestService (8888)
    |
    `-- 网关本地业务 /sum
            `-- SumService in gateway process
```

当前所有服务代码都在一个仓库里，便于共享 Protobuf、生成代码、配置和本地调试。服务之间通过 Kitex RPC 通信，网关不直接依赖业务服务的数据库。

当服务数量增加时，可以沿着现有边界拆分：将某个服务的 `cmd`、`internal/service`、`internal/server`、IDL 和生成代码迁移到独立仓库，网关只保留对应的 RPC client 和协议依赖；调用方式不需要改变。

## 三类 API 设计

### 1. `api/work/work.proto`：强类型 RPC + 网关编排

`api/work/work.proto` 定义面向业务的 HTTP 接口和请求/响应模型；对应的 `idl/work/work.proto` 定义后端 Kitex RPC 契约。Hertz 根据 `api.get`、`api.path` 等注解生成路由和模型，网关 handler 再通过强类型 Kitex client 调用后端 RPC。

`GET /works/:workID` 是一个典型的聚合接口：先调用 `WorkService.GetWork` 查询工作，再调用 `UserService.GetUser` 查询用户，最后由网关组装 HTTP 响应。这样可以把跨服务编排、鉴权、聚合和协议适配集中在网关，同时让后端服务保持职责单一。

### 2. `api/test/test_api.proto`：泛化调用与透明转发

`api/test/test_api.proto` 描述网关可暴露的 TestService 消息和方法，`idl/test/test.proto` 是下游 Kitex 服务契约；网关不为每个方法编写专用 handler。`/test/*` 使用 `BinaryPbGeneric`，请求体按 protobuf 二进制原样转发；`/testjson/*` 使用 descriptor-backed `JSONPbGeneric`，在 JSON 和 protobuf 之间完成泛化编解码。

路径中 `/test/` 或 `/testjson/` 后面的部分就是 RPC 方法名，例如 `/test/TestFields`。这种模式适合网关只做鉴权、路由、限流和协议转换，业务逻辑完全由下游服务处理的场景。新增 RPC 方法时，通常只需更新 IDL 和下游服务，不必新增网关业务代码。

### 3. `api/sum/sum.proto`：网关本地业务

并非所有接口都值得单独部署 RPC 服务。`sum.proto` 定义的 `SumService.Add` 直接由网关进程内的 `internal/service/sum` 实现，适合轻量、低依赖或网关专属的业务逻辑。

如果本地业务逐渐变复杂，可以先保持 Protobuf 契约不变，再把实现迁移到独立 Kitex 服务，网关侧改为 RPC client，HTTP API 无需变化。

## 目录职责

```text
api/                         HTTP API Protobuf（Hertz 输入）
idl/                         RPC Protobuf（Kitex 输入）
kitex_gen/                   Kitex 生成的 RPC client/server 代码
internal/gateway/            网关路由、handler、RPC client registry
internal/service/<name>/     服务业务逻辑、repository 和 Ent 数据层
internal/server/<name>/      Kitex/Hertz server 装配与启动
cmd/<name>/                  各进程的 Cobra 命令和 Wire 依赖注入
cmd/entgen/                  扫描各服务 schema 并生成 Ent 代码
sql/init.sql                 示例 MySQL 表结构和种子数据
```

网关的生成路由位于 `internal/gateway/router` 和 `internal/gateway/handler`。手写的透明代理和 `/ping` 放在自定义注册逻辑中，避免运行 Hertz 生成命令时被覆盖。

## ORM 与代码生成

数据访问使用 Ent。每个服务在 `internal/service/<service>/data/ent/schema` 编写 schema，`cmd/entgen` 会扫描所有服务并把生成结果写回同一服务的 `data/ent` 目录。这样数据库模型和 repository 仍归服务自己所有，不会被网关共享。

常用生成命令：

```bash
# 安装 kitex、hz、wire、protoc-gen-go
make install

# 生成 Kitex RPC、Ent、Wire 代码
make gen

# 仅更新 Hertz HTTP 路由和 handler 骨架
make gen-hz

# 生成跨语言客户端（按需安装对应 protoc 插件）
make -C api gen-api-clients
```

生成链路的输入和输出是分开的：`idl/*.proto` 生成 `kitex_gen`，`api/*.proto` 生成 Hertz 网关代码；修改 IDL 后重新执行对应命令即可。提交代码时应同时提交需要运行的生成结果，保证没有生成工具的环境也能编译。

## 启动与配置

默认监听地址如下：

| 进程 | 命令 | 地址 |
| --- | --- | --- |
| Gateway | `go run ./cmd gateway` | `127.0.0.1:8080` |
| TestService | `go run ./cmd test` | `127.0.0.1:8888` |
| UserService | `go run ./cmd user` | `127.0.0.1:8889` |
| WorkService | `go run ./cmd work` | `127.0.0.1:8890` |

`UserService` 和 `WorkService` 默认使用 MySQL DSN：

```text
root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local
```

可通过环境变量 `MYSQL_DSN` 覆盖。启动数据库后执行 `sql/init.sql`，即可使用示例数据（user=1、work=1）。本地联调时分别启动四个进程；网关会按上表地址建立 RPC client。

## curl 测试

### 网关本地业务

```bash
curl 'http://127.0.0.1:8080/sum?left=12&right=30'
# {"result":42}
```

### 强类型 RPC 编排接口

```bash
curl 'http://127.0.0.1:8080/works/1'
# {"id":1,"name":"First work","user":{"id":1,"name":"Alice"}}
```

### protobuf 二进制泛化转发

先按 `test_api.proto` 编码请求，再转发到 TestService：

```bash
cat <<'EOF' | protoc -I api --encode=test.TestFieldsRequest api/test/test_api.proto > request.bin
int32_value: -7
string_value: "compatibility"
enum_value: COMPATIBILITY_ENUM_FIRST
repeated_strings: "first"
repeated_strings: "second"
EOF

curl -X POST 'http://127.0.0.1:8080/test/TestFields' \
  -H 'Content-Type: application/protobuf' \
  --data-binary @request.bin \
  -o response.bin

protoc -I api --decode=test.TestFieldsResponse \
  api/test/test_api.proto < response.bin
```

### JSON 泛化转发

```bash
curl -X POST 'http://127.0.0.1:8080/testjson/TestFields' \
  -H 'Content-Type: application/json' \
  -d '{
    "int32_value": -7,
    "string_value": "compatibility",
    "enum_value": 1,
    "repeated_strings": ["first", "second"]
  }'
```
