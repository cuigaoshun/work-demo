# work-demo

`work-demo` 是一个单仓库的 Go 微服务示例，使用 Hertz 提供 HTTP 网关、Kitex 提供 RPC 服务、Ent 访问 MySQL，并通过 Protobuf 管理 HTTP 与 RPC 协议。

## 架构

仓库包含 4 个独立进程。服务发现尚未接入，网关通过固定的本地地址直连下游 Kitex 服务。

```text
                              +----------------------+
HTTP client                   | gateway :8080        |
    |                          | Hertz                |
    +------------------------> |                      |
                               | GET /sum             |---> gateway-local SumService
                               | GET /works/:workID   |---> WorkService :8890 --> MySQL.works
                               |                      |         |
                               |                      |         +--> UserService :8889 --> MySQL.users
                               | /test/*              |---> TestService :8888 (binary protobuf)
                               | /testjson/*          |---> TestService :8888 (generic JSON)
                               +----------------------+
```

- `gateway`：Hertz HTTP 网关。初始化下游 RPC client 和网关本地 `SumService`，再注册生成路由与自定义路由。
- `test`：Kitex 测试服务，实现 `TestFields` 字段兼容性回显。
- `user`：Kitex 用户服务，使用本服务的 Ent repository 查询 `users` 表。
- `work`：Kitex 作品服务，使用本服务的 Ent repository 查询 `works` 表。

网关不直接访问数据库。`GET /works/:workID` 由网关先调用 `WorkService.GetWork`，再按返回的 `user_id` 调用 `UserService.GetUser`，最后将结果适配为 HTTP 响应。

## 协议与路由

| 协议文件 | 用途 | 当前接口 |
| --- | --- | --- |
| `api/` | Hertz HTTP 契约、路由注解，以及测试泛化调用共享的消息定义 | `GET /sum`、`GET /works/:workID`、`POST /testBind` |
| `idl/` | Kitex RPC 服务契约 | `TestService.TestFields`、`UserService.GetUser`、`WorkService.GetWork` |

`api/test/test_api.proto` 同时被测试 RPC IDL 引用，因此它定义的 `TestFieldsRequest` 和 `TestFieldsResponse` 是测试服务的共享消息类型。

除 Hertz 从 `api/` 生成的路由外，网关还注册以下应用自有路由：

| 路由 | 处理方式 |
| --- | --- |
| `GET /ping` | 直接返回 `pong` |
| `/{method} /test/*path` | 将原始 protobuf 二进制请求泛化转发到 `TestService` |
| `/{method} /testjson/*path` | 根据 `api/test/test_api.proto` descriptor 将 JSON 泛化转发到 `TestService` |

`/test/*path` 与 `/testjson/*path` 的路径末段必须是 RPC 方法名，例如 `/test/TestFields`。`POST /testBind` 是网关本地的 protobuf 绑定测试：它使用 `BindAndValidate` 解码请求体，并以 protobuf 回显 `TestBindResponse`；请求头必须是 `Content-Type: application/x-protobuf`。

## 目录

```text
api/                              HTTP Protobuf 定义和 Hertz 注解
idl/                              Kitex RPC Protobuf 定义
kitex_gen/                        Kitex 从 idl/ 生成的 Go 代码
cmd/                              Cobra 命令入口（gateway、test、user、work）
internal/gateway/                 网关、RPC client registry、Hertz handler 与路由
internal/service/<service>/       服务实现
  internal/biz/                   RPC 业务逻辑
  internal/data/                  Ent client、repository、schema 和生成代码
  internal/transport/             Kitex server 装配
sql/init.sql                      MySQL 表结构和示例数据
scripts/hz_gen.sh                 Hertz 路由和 handler 生成脚本
```

各服务使用 Wire 生成依赖装配代码：`internal/gateway/wire_gen.go` 与 `internal/service/*/wire_gen.go`。`wire.go` 仅在 `wireinject` 构建标签下参与编译。

## 本地运行

### 前置条件

- Go `1.27.0`（以 `go.mod` 为准）
- MySQL
- 仅在重新生成代码时需要：`protoc`、Kitex、Hertz 和 Wire

初始化数据库并导入示例数据：

```bash
mysql -uroot -p123456 -e 'CREATE DATABASE IF NOT EXISTS test'
mysql -uroot -p123456 test < sql/init.sql
```

`user` 与 `work` 默认使用以下 DSN；可用同一个 `MYSQL_DSN` 环境变量覆盖两个服务的连接配置：

```text
root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local
```

在四个终端中分别启动：

```bash
go run ./cmd test
go run ./cmd user
go run ./cmd work
go run ./cmd gateway
```

默认监听地址如下：

| 进程 | 地址 |
| --- | --- |
| gateway | `127.0.0.1:8080` |
| test | `127.0.0.1:8888` |
| user | `127.0.0.1:8889` |
| work | `127.0.0.1:8890` |

可以通过 `go run ./cmd --help` 查看可用子命令。当前地址由代码中的默认选项提供，尚未暴露为命令行参数或环境变量。

## 验证接口

```bash
# 健康检查
curl http://127.0.0.1:8080/ping

# 网关本地业务
curl 'http://127.0.0.1:8080/sum?left=12&right=30'

# 网关编排 work 和 user 服务
curl http://127.0.0.1:8080/works/1

# JSON 泛化转发到 TestService
curl -X POST http://127.0.0.1:8080/testjson/TestFields \
  -H 'Content-Type: application/json' \
  -d '{"int32_value":-7,"string_value":"compatibility","enum_value":1}'
```

`/testBind` 的二进制请求和响应可使用 `protoc` 验证，生成文件统一放在 `scripts/`：

```bash
protoc -I api --encode=test.TestBindRequest api/test/test_api.proto > scripts/test_bind_request.bin <<'EOF'
id: 42
name: "protobuf body"
EOF

curl -X POST http://127.0.0.1:8080/testBind \
  -H 'Content-Type: application/x-protobuf' \
  --data-binary @scripts/test_bind_request.bin -o scripts/test_bind_response.bin

protoc -I api --decode=test.TestBindResponse \
  api/test/test_api.proto < scripts/test_bind_response.bin
```

`name` 最长为 20 个字符。以下 21 字符请求应返回 `400`：

```bash
protoc -I api --encode=test.TestBindRequest api/test/test_api.proto > scripts/test_bind_invalid_request.bin <<'EOF'
id: 42
name: "123456789012345678901"
EOF

curl -i -X POST http://127.0.0.1:8080/testBind \
  -H 'Content-Type: application/x-protobuf' \
  --data-binary @scripts/test_bind_invalid_request.bin
```

protobuf 二进制泛化调用可按下面方式构造和查看数据：

```bash
protoc -I api --encode=test.TestFieldsRequest api/test/test_api.proto > scripts/request.bin <<'EOF'
int32_value: -7
string_value: "compatibility"
enum_value: COMPATIBILITY_ENUM_FIRST
repeated_strings: "first"
repeated_strings: "second"
EOF

curl -X POST http://127.0.0.1:8080/test/TestFields \
  -H 'Content-Type: application/protobuf' \
  --data-binary @scripts/request.bin -o scripts/response.bin

protoc -I api --decode=test.TestFieldsResponse api/test/test_api.proto < scripts/response.bin
```

## 代码生成

安装 Go 代码生成工具：

```bash
make install
```

| 变更内容 | 命令 | 主要输出 |
| --- | --- | --- |
| `idl/` RPC 定义 | `make gen-kitex` | `kitex_gen/` |
| Ent schema | `make gen-ent` | `internal/service/*/internal/data/ent/` |
| Wire 依赖定义 | `make gen-wire` | `internal/**/wire_gen.go` |
| `api/` HTTP 定义 | `make gen-hz` | `internal/gateway/model/`、`handler/`、`router/` |
| 全部 Go 生成步骤（不含 Hertz） | `make gen` | Kitex、Ent、Wire 输出 |
| 多语言 HTTP 客户端 | `make -C api gen-api-clients` | `generated/` |

`make gen-hz` 会调用 `hz update`，生成文件中的逻辑可能被覆盖。应用自有的 `/ping`、`/test/*` 和 `/testjson/*` 注册在 `internal/gateway/router/router.go`，不应放入生成文件。修改协议后应提交对应的生成结果。

## CI 与发布

手动触发 `generate api clients` 工作流时，CI 会从指定源分支创建 `release-vX.Y.Z` 分支，执行 `make gen`、`make gen-hz` 和多语言客户端生成，再在该分支创建 tag。

推送 `v*` tag 后，发布工作流会执行 lint、构建 Linux amd64 的 `work-demo` 二进制，并上传 `work-demo-<tag>-linux-amd64.tar.gz` 到 GitHub Release。
