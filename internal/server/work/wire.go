//go:build wireinject
// +build wireinject

package work

import (
	"example.com/work-demo/internal/data"
	workservice "example.com/work-demo/internal/service/work"
	"github.com/google/wire"
)

func NewServer() (*Server, error) {
	panic(wire.Build(
		DefaultOptions,
		data.OpenDB,
		data.NewWorkRepository,
		workservice.New,
		New,
	))
}
