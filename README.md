# work-demo

服务从根目录 `cmd` 启动：`gateway` 提供 HTTP 接口，`test`、`user`、`work` 提供 Kitex RPC 接口。生成的 Kitex 代码统一位于根目录 `kitex_gen`。

网关还提供一个不经过 RPC 的本地求和接口：

```bash
curl 'http://127.0.0.1:8080/sum?left=12&right=30'
# {"result":42}
```

`/test/*` 是 TestService 的 protobuf 二进制泛化入口，例如 `/test/TestFields`：

```bash
curl -X POST 'http://127.0.0.1:8080/test/TestFields' \
  -H 'Content-Type: application/protobuf' \
  --data-binary @request.bin \
  -o response.bin
```

请求体从 `request.bin` 读取，响应保存到独立的 `response.bin` 文件。请求方法名由 `/test/` 后的路径决定，响应为 `application/protobuf`。

`request.bin` 可以使用 `protoc --encode` 根据同一个 proto 生成。例如：

```bash
cat <<'EOF' | protoc -I api --encode=test.TestFieldsRequest api/test/test_api.proto > request.bin
int32_value: -7
string_value: "compatibility"
enum_value: COMPATIBILITY_ENUM_FIRST
repeated_strings: "first"
repeated_strings: "second"
EOF
```

生成后即可将该二进制文件作为 `/test/TestFields` 的请求体。

使用同一个 proto 定义查看响应内容：

```bash
protoc -I api \
  --decode=test.TestFieldsResponse \
  api/test/test_api.proto < response.bin
```

`/testjson/*` 使用 descriptor-backed `JSONPbGeneric`，可以直接传 JSON：

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

`/testjson/` 后的路径同样直接作为 Kitex 方法名，响应为 JSON。

`GET /works/:workID` 会先调用 WorkService 查询 `works` 表的 `id`、`name`、`user_id`，再调用 UserService 查询 `users` 表的用户信息，返回：

```json
{
  "id": 1,
  "name": "example work",
  "user": {
    "id": 1,
    "name": "example user"
  }
}
```
