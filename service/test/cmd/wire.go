//go:build wireinject
// +build wireinject

package main

import (
	testserver "example.com/work-demo/service/test/internal/server"
	testservice "example.com/work-demo/service/test/internal/service"
	"github.com/google/wire"
)

func NewServer() (*testserver.Server, error) {
	panic(wire.Build(
		testserver.DefaultOptions,
		testservice.New,
		testserver.New,
	))
}
