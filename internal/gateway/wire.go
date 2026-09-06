//go:build wireinject
// +build wireinject

package gateway

import (
	sumservice "example.com/work-demo/internal/gateway/internal/biz/sum"
	"example.com/work-demo/internal/gateway/internal/registry"
	"github.com/google/wire"
)

func newServer() (*Server, error) {
	panic(wire.Build(
		DefaultOptions,
		ProvideTestClient,
		ProvideTestJSONClient,
		ProvideUserClient,
		ProvideWorkClient,
		sumservice.New,
		registry.NewServiceRegistry,
		registry.NewClientRegistry,
		New,
	))
}
