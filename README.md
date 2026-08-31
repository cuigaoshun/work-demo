# work-demo

启动 Kitex 和 Hertz 服务后，可以用下面的请求验证 protobuf 标量、数组、map 和嵌套字段是否从入参完整回显到出参：

```bash
curl -X POST 'http://127.0.0.1:8080/users/1' \
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

`name` 仍然从数据库读取；其余兼容性测试字段由请求原样复制到响应。
