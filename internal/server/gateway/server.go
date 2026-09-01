package gateway

import (
	"example.com/work-demo/internal/client"
	"example.com/work-demo/internal/router"
	"github.com/cloudwego/hertz/pkg/app/server"
)

type Server struct {
	opts    *Options
	clients *client.ClientRegistry
}

func New(opts *Options, clients *client.ClientRegistry) *Server {
	client.SetDefault(clients)
	return &Server{opts: opts, clients: clients}
}

func (s *Server) Run() error {
	h := server.Default(server.WithHostPorts(s.opts.Addr))
	router.Register(h)
	h.Spin()
	return nil
}
