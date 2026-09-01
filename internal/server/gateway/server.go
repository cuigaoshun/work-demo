package gateway

import (
	testhandler "example.com/work-demo/internal/handler/test"
	workhandler "example.com/work-demo/internal/handler/work"
	"example.com/work-demo/internal/router"
	"github.com/cloudwego/hertz/pkg/app/server"
)

type Server struct {
	opts        *Options
	testHandler *testhandler.Handler
	workHandler *workhandler.Handler
}

func New(opts *Options, testHandler *testhandler.Handler, workHandler *workhandler.Handler) *Server {
	return &Server{opts: opts, testHandler: testHandler, workHandler: workHandler}
}

func (s *Server) Run() error {
	h := server.Default(server.WithHostPorts(s.opts.Addr))
	router.GeneratedRegister(h)
	h.Spin()
	return nil
}
