package user

import (
	"net"

	"example.com/work-demo/internal/data"
	userserviceimpl "example.com/work-demo/internal/service/user"
	"example.com/work-demo/kitex_gen/user/userservice"
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
	db, err := data.OpenDB()
	if err != nil {
		return err
	}
	defer db.Close()

	addr, err := net.ResolveTCPAddr("tcp", s.opts.Addr)
	if err != nil {
		return err
	}

	impl := userserviceimpl.New(data.NewUserRepository(db))
	return userservice.NewServer(impl, server.WithServiceAddr(addr)).Run()
}
