//go:build wireinject
// +build wireinject

package gateway

import (
	workhandler "example.com/work-demo/internal/handler/gateway"
	testhandler "example.com/work-demo/internal/handler/test"
	"github.com/google/wire"
)

func NewServer() (*Server, error) {
	panic(wire.Build(
		DefaultOptions,
		provideTestClient,
		provideUserClient,
		provideWorkClient,
		testhandler.New,
		workhandler.NewWorkHandler,
		New,
	))
}
