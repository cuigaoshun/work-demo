package work

import (
	"net"

	"example.com/work-demo/internal/data"
	workserviceimpl "example.com/work-demo/internal/service/work"
	"example.com/work-demo/kitex_gen/work/workservice"
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

	impl := workserviceimpl.New(data.NewWorkRepository(db))
	return workservice.NewServer(impl, server.WithServiceAddr(addr)).Run()
}
