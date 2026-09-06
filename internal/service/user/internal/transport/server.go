package transport

import (
	"net"

	userserviceimpl "example.com/work-demo/internal/service/user/internal/biz"
	"example.com/work-demo/internal/service/user/internal/data/ent"
	"example.com/work-demo/kitex_gen/user/userservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	addr    string
	client  *ent.Client
	service *userserviceimpl.Service
}

func New(addr string, client *ent.Client, service *userserviceimpl.Service) *Server {
	return &Server{addr: addr, client: client, service: service}
}

func (s *Server) Run() error {
	defer s.client.Close()

	addr, err := net.ResolveTCPAddr("tcp", s.addr)
	if err != nil {
		return err
	}

	return userservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
