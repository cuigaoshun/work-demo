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
	opts *Options
}

func NewServer(opts *Options) *Server {
	if opts == nil {
		opts = DefaultOptions()
	}

	return &Server{opts: opts}
}

func (s *Server) Run() error {
	testClient, err := testservice.NewClient(constants.TestServiceName, kitexclient.WithHostPorts(s.opts.TestAddr))
	if err != nil {
		return err
	}

	userClient, err := userservice.NewClient(constants.UserServiceName, kitexclient.WithHostPorts(s.opts.UserAddr))
	if err != nil {
		return err
	}

	workClient, err := workservice.NewClient(constants.WorkServiceName, kitexclient.WithHostPorts(s.opts.WorkAddr))
	if err != nil {
		return err
	}

	h := server.Default(server.WithHostPorts(s.opts.Addr))
	h.POST("/test-fields", testhandler.New(testClient).TestFields)
	h.GET("/works/:workID", workhandler.NewWorkHandler(userClient, workClient).GetWork)
	h.Spin()
	return nil
}
