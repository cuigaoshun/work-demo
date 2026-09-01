package gateway

import (
	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
	"example.com/work-demo/pkg/constants"
	kitexclient "github.com/cloudwego/kitex/client"
	"github.com/cloudwego/kitex/client/genericclient"
	"github.com/cloudwego/kitex/pkg/generic"
	"github.com/cloudwego/kitex/transport"
)

func ProvideTestClient(opts *Options) (genericclient.Client, error) {
	g := generic.BinaryPbGeneric("TestService", "test")
	return genericclient.NewClient(constants.TestServiceName, g,
		kitexclient.WithHostPorts(opts.TestAddr),
		kitexclient.WithTransportProtocol(transport.TTHeaderFramed),
	)
}

func ProvideUserClient(opts *Options) (userservice.Client, error) {
	return userservice.NewClient(constants.UserServiceName, kitexclient.WithHostPorts(opts.UserAddr))
}

func ProvideWorkClient(opts *Options) (workservice.Client, error) {
	return workservice.NewClient(constants.WorkServiceName, kitexclient.WithHostPorts(opts.WorkAddr))
}
