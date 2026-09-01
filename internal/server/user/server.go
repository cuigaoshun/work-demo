package user

import (
	"net"

	"example.com/work-demo/internal/ent"
	userserviceimpl "example.com/work-demo/internal/service/user"
	"example.com/work-demo/kitex_gen/user/userservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	opts    *Options
	client  *ent.Client
	service *userserviceimpl.Service
}

func New(opts *Options, client *ent.Client, service *userserviceimpl.Service) *Server {
	return &Server{opts: opts, client: client, service: service}
}

func (s *Server) Run() error {
	defer s.client.Close()

	addr, err := net.ResolveTCPAddr("tcp", s.opts.Addr)
	if err != nil {
		return err
	}

	return userservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
