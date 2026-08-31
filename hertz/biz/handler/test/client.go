package test

import (
	userservice "example.com/work-demo/common/kitex_gen/user/testservice"
	kitexclient "github.com/cloudwego/kitex/client"
)

var rpcClient = userservice.MustNewClient("userservice", kitexclient.WithHostPorts("127.0.0.1:8888"))
