package transport

import (
	"net"

	testserviceimpl "example.com/work-demo/internal/service/test/internal/biz"
	"example.com/work-demo/kitex_gen/test/testservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	addr    string
	service *testserviceimpl.Service
}

func New(addr string, service *testserviceimpl.Service) *Server {
	return &Server{addr: addr, service: service}
}

func (s *Server) Run() error {
	addr, err := net.ResolveTCPAddr("tcp", s.addr)
	if err != nil {
		return err
	}

	return testservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
