package transport

import (
	"net"

	workserviceimpl "example.com/work-demo/internal/service/work/internal/biz"
	"example.com/work-demo/internal/service/work/internal/data/ent"
	"example.com/work-demo/kitex_gen/work/workservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	addr    string
	client  *ent.Client
	service *workserviceimpl.Service
}

func New(addr string, client *ent.Client, service *workserviceimpl.Service) *Server {
	return &Server{addr: addr, client: client, service: service}
}

func (s *Server) Run() error {
	defer s.client.Close()

	addr, err := net.ResolveTCPAddr("tcp", s.addr)
	if err != nil {
		return err
	}

	return workservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
