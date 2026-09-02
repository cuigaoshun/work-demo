package gateway

import (
	"example.com/work-demo/internal/gateway/registry"
	"example.com/work-demo/internal/gateway/router"
	"github.com/cloudwego/hertz/pkg/app/server"
)

type Server struct {
	opts    *Options
	clients *registry.Registry
}

func New(opts *Options, clients *registry.Registry, services ...*registry.ServiceRegistry) *Server {
	registry.SetDefault(clients)
	if len(services) > 0 {
		registry.SetDefaultServices(services[0])
	}
	return &Server{opts: opts, clients: clients}
}

func (s *Server) Run() error {
	h := server.Default(server.WithHostPorts(s.opts.Addr))
	router.Register(h)
	h.Spin()
	return nil
}
