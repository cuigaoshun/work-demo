//go:build wireinject
// +build wireinject

package user

import (
	"example.com/work-demo/internal/data"
	userservice "example.com/work-demo/internal/service/user"
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
