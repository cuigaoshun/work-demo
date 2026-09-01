//go:build wireinject
// +build wireinject

package user

import (
	userservice "example.com/work-demo/internal/service/user"
	"example.com/work-demo/internal/service/user/data"
	"github.com/google/wire"
)

func NewServer() (*Server, error) {
	panic(wire.Build(
		DefaultOptions,
		data.OpenDB,
		data.NewUserRepository,
		userservice.New,
		New,
	))
}
