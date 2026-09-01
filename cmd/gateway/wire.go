//go:build wireinject
// +build wireinject

package gateway

import (
	testhandler "example.com/work-demo/internal/handler/test"
	workhandler "example.com/work-demo/internal/handler/work"
	server "example.com/work-demo/internal/server/gateway"
	"github.com/google/wire"
)

func NewServer() (*server.Server, error) {
	panic(wire.Build(
		server.DefaultOptions,
		server.ProvideTestClient,
		server.ProvideUserClient,
		server.ProvideWorkClient,
		testhandler.New,
		workhandler.New,
		server.New,
	))
}
