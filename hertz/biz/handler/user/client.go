package user

import (
	userservice "example.com/work-demo/common/kitex_gen/user/userservice"
	kitexclient "github.com/cloudwego/kitex/client"
)

var rpcClient = userservice.MustNewClient("userservice", kitexclient.WithHostPorts("127.0.0.1:8888"))
