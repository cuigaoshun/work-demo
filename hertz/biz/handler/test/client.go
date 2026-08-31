package test

import (
	"example.com/work-demo/common/kitex_gen/test/testservice"
	kitexclient "github.com/cloudwego/kitex/client"
)

var rpcClient = testservice.MustNewClient("testservice", kitexclient.WithHostPorts("127.0.0.1:8888"))
