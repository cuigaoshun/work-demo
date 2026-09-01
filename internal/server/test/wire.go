//go:build wireinject
// +build wireinject

package test

import (
	testservice "example.com/work-demo/internal/service/test"
	"github.com/google/wire"
)

func NewServer() (*Server, error) {
	panic(wire.Build(
		DefaultOptions,
		testservice.New,
		New,
	))
}
