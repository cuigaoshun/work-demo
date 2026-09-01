package work

import (
	"net"

	"example.com/work-demo/internal/ent"
	workserviceimpl "example.com/work-demo/internal/service/work"
	"example.com/work-demo/kitex_gen/work/workservice"
	"github.com/cloudwego/kitex/server"
)

type Server struct {
	opts    *Options
	client  *ent.Client
	service *workserviceimpl.Service
}

func New(opts *Options, client *ent.Client, service *workserviceimpl.Service) *Server {
	return &Server{opts: opts, client: client, service: service}
}

func (s *Server) Run() error {
	defer s.client.Close()

	addr, err := net.ResolveTCPAddr("tcp", s.opts.Addr)
	if err != nil {
		return err
	}

	return workservice.NewServer(s.service, server.WithServiceAddr(addr)).Run()
}
