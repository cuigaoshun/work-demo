//go:build wireinject
// +build wireinject

package gateway

import (
	"example.com/work-demo/internal/gateway/registry"
	server "example.com/work-demo/internal/server/gateway"
	sumservice "example.com/work-demo/internal/service/sum"
	"github.com/google/wire"
)

func NewServer() (*server.Server, error) {
	panic(wire.Build(
		server.DefaultOptions,
		server.ProvideTestClient,
		server.ProvideTestJSONClient,
		server.ProvideUserClient,
		server.ProvideWorkClient,
		sumservice.New,
		registry.NewServiceRegistry,
		registry.NewClientRegistry,
		server.New,
	))
}
