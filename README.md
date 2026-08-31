# work-demo

启动 Kitex 和 Hertz 服务后，可以用下面的请求验证 protobuf 标量、数组、map 和嵌套字段是否从入参完整回显到出参：

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
