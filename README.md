# work-demo

服务从根目录 `cmd` 启动：`gateway` 提供 HTTP 接口，`test`、`user`、`work` 提供 Kitex RPC 接口。生成的 Kitex 代码统一位于根目录 `kitex_gen`。

`POST /test-fields` 保留原有 protobuf 标量、数组、map 和嵌套字段回显行为：

```bash
curl -X POST 'http://127.0.0.1:8080/test-fields' \
  -H 'Content-Type: application/json' \
  -d '{
    "int32_value": -7,
    "string_value": "compatibility",
    "enum_value": 1,
    "repeated_strings": ["first", "second"],
    "repeated_int32": [10, 20],
    "string_map": {"key": "value"},
    "nested_value": {"label": "nested", "values": [42]}
  }'
```

`TestFields` 接口不访问数据库，测试字段会由请求原样复制到响应。

网关的 `TestFields` handler 使用 Kitex Binary Protobuf Generic Client：请求在 handler 内序列化为 protobuf 二进制，调用 `TestService.TestFields`，再将二进制响应反序列化为 API 响应。

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
