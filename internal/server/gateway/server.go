package gateway

import (
	workhandler "example.com/work-demo/internal/handler/gateway"
	testhandler "example.com/work-demo/internal/handler/test"
	"example.com/work-demo/kitex_gen/test/testservice"
	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
	"example.com/work-demo/pkg/constants"
	"github.com/cloudwego/hertz/pkg/app/server"
	kitexclient "github.com/cloudwego/kitex/client"
)

type Server struct {
	opts        *Options
	testHandler *testhandler.Handler
	workHandler *workhandler.WorkHandler
}

func New(opts *Options, testHandler *testhandler.Handler, workHandler *workhandler.WorkHandler) *Server {
	return &Server{opts: opts, testHandler: testHandler, workHandler: workHandler}
}

func (s *Server) Run() error {
	h := server.Default(server.WithHostPorts(s.opts.Addr))
	h.POST("/test-fields", s.testHandler.TestFields)
	h.GET("/works/:workID", s.workHandler.GetWork)
	h.Spin()
	return nil
}

func provideTestClient(opts *Options) (testservice.Client, error) {
	return testservice.NewClient(constants.TestServiceName, kitexclient.WithHostPorts(opts.TestAddr))
}

func provideUserClient(opts *Options) (userservice.Client, error) {
	return userservice.NewClient(constants.UserServiceName, kitexclient.WithHostPorts(opts.UserAddr))
}

func provideWorkClient(opts *Options) (workservice.Client, error) {
	return workservice.NewClient(constants.WorkServiceName, kitexclient.WithHostPorts(opts.WorkAddr))
}
