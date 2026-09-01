//go:build wireinject
// +build wireinject

package work

import (
	workservice "example.com/work-demo/internal/service/work"
	"example.com/work-demo/internal/service/work/data"
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
