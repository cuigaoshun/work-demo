package test

import (
	"net"

	testserviceimpl "example.com/work-demo/internal/service/test"
	"example.com/work-demo/kitex_gen/test/testservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	opts    *Options
	service *testserviceimpl.Service
}

func New(opts *Options, service *testserviceimpl.Service) *Server {
	return &Server{opts: opts, service: service}
}

func (s *Server) Run() error {
	addr, err := net.ResolveTCPAddr("tcp", s.opts.Addr)
	if err != nil {
		return err
	}

	return testservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
