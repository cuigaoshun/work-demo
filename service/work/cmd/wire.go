//go:build wireinject
// +build wireinject

package main

import (
	workserver "example.com/work-demo/service/work/internal/server"
	workservice "example.com/work-demo/service/work/internal/service"
	"example.com/work-demo/service/work/internal/service/data"
	"github.com/google/wire"
)

func NewServer() (*workserver.Server, error) {
	panic(wire.Build(
		workserver.DefaultOptions,
		data.OpenDB,
		data.NewWorkRepository,
		workservice.New,
		workserver.New,
	))
}
