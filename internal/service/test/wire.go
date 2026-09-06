//go:build wireinject
// +build wireinject

package test

import (
	"example.com/work-demo/internal/service/test/internal/biz"
	"example.com/work-demo/internal/service/test/internal/transport"
	"github.com/google/wire"
)

func newServer() (*transport.Server, error) {
	panic(wire.Build(
		defaultAddress,
		biz.New,
		transport.New,
	))
}
