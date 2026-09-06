//go:build wireinject
// +build wireinject

package user

import (
	"example.com/work-demo/internal/service/user/internal/biz"
	"example.com/work-demo/internal/service/user/internal/data"
	"example.com/work-demo/internal/service/user/internal/transport"
	"github.com/google/wire"
)

func newServer() (*transport.Server, error) {
	panic(wire.Build(
		defaultAddress,
		data.OpenDB,
		data.NewUserRepository,
		biz.New,
		transport.New,
	))
}
