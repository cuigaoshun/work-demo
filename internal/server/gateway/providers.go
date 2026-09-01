package gateway

import (
	"context"
	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
	"example.com/work-demo/pkg/constants"
	dproto "github.com/cloudwego/dynamicgo/proto"
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

func ProvideTestJSONClient(opts *Options) (genericclient.Client, error) {
	provider, err := generic.NewPbFileProviderWithDynamicGo(
		"idl/test/test.proto", context.Background(), dproto.Options{}, "idl", "api",
	)
	if err != nil {
		return nil, err
	}
	g, err := generic.JSONPbGeneric(provider)
	if err != nil {
		return nil, err
	}
	return genericclient.NewClient(constants.TestServiceName, g,
		kitexclient.WithHostPorts(opts.TestAddr),
		kitexclient.WithTransportProtocol(transport.TTHeader),
	)
}

func ProvideUserClient(opts *Options) (userservice.Client, error) {
	return userservice.NewClient(constants.UserServiceName, kitexclient.WithHostPorts(opts.UserAddr))
}

func ProvideWorkClient(opts *Options) (workservice.Client, error) {
	return workservice.NewClient(constants.WorkServiceName, kitexclient.WithHostPorts(opts.WorkAddr))
}
