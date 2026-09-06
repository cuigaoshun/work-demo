//go:build wireinject
// +build wireinject

package work

import (
	"example.com/work-demo/internal/service/work/internal/biz"
	"example.com/work-demo/internal/service/work/internal/data"
	"example.com/work-demo/internal/service/work/internal/transport"
	"github.com/google/wire"
)

func newServer() (*transport.Server, error) {
	panic(wire.Build(
		defaultAddress,
		data.OpenDB,
		data.NewWorkRepository,
		biz.New,
		transport.New,
	))
}
