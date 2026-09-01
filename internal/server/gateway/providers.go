package gateway

import (
	"example.com/work-demo/kitex_gen/test/testservice"
	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
	"example.com/work-demo/pkg/constants"
	kitexclient "github.com/cloudwego/kitex/client"
)

func ProvideTestClient(opts *Options) (testservice.Client, error) {
	return testservice.NewClient(constants.TestServiceName, kitexclient.WithHostPorts(opts.TestAddr))
}

func ProvideUserClient(opts *Options) (userservice.Client, error) {
	return userservice.NewClient(constants.UserServiceName, kitexclient.WithHostPorts(opts.UserAddr))
}

func ProvideWorkClient(opts *Options) (workservice.Client, error) {
	return workservice.NewClient(constants.WorkServiceName, kitexclient.WithHostPorts(opts.WorkAddr))
}
