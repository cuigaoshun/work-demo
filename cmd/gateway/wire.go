//go:build wireinject
// +build wireinject

package gateway

import (
	"example.com/work-demo/internal/gateway/client"
	server "example.com/work-demo/internal/server/gateway"
	"github.com/google/wire"
)

func NewServer() (*server.Server, error) {
	panic(wire.Build(
		server.DefaultOptions,
		server.ProvideTestClient,
		server.ProvideUserClient,
		server.ProvideWorkClient,
		client.NewClientRegistry,
		server.New,
	))
}
