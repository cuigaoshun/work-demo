package test

import (
	"net"

	testserviceimpl "example.com/work-demo/internal/service/test"
	"example.com/work-demo/kitex_gen/test/testservice"
	"github.com/cloudwego/kitex/server"
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
	addr, err := net.ResolveTCPAddr("tcp", s.opts.Addr)
	if err != nil {
		return err
	}

	return testservice.NewServer(&testserviceimpl.Service{}, server.WithServiceAddr(addr)).Run()
}
