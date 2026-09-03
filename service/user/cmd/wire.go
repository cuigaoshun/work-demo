//go:build wireinject
// +build wireinject

package main

import (
	userserver "example.com/work-demo/service/user/internal/server"
	userservice "example.com/work-demo/service/user/internal/service"
	"example.com/work-demo/service/user/internal/service/data"
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
