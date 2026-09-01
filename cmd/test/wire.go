//go:build wireinject
// +build wireinject

package test

import (
	testserver "example.com/work-demo/internal/server/test"
	testservice "example.com/work-demo/internal/service/test"
	"github.com/google/wire"
)

func NewServer() (*testserver.Server, error) {
	panic(wire.Build(
		testserver.DefaultOptions,
		testservice.New,
		testserver.New,
	))
}
