//go:build wireinject
// +build wireinject

package user

import (
	userserver "example.com/work-demo/internal/server/user"
	userservice "example.com/work-demo/internal/service/user"
	"example.com/work-demo/internal/service/user/data"
	"github.com/google/wire"
)

func NewServer() (*userserver.Server, error) {
	panic(wire.Build(
		userserver.DefaultOptions,
		data.OpenDB,
		data.NewUserRepository,
		userservice.New,
		userserver.New,
	))
}
