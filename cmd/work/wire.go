//go:build wireinject
// +build wireinject

package work

import (
	workserver "example.com/work-demo/internal/server/work"
	workservice "example.com/work-demo/internal/service/work"
	"example.com/work-demo/internal/service/work/data"
	"github.com/google/wire"
)

func NewServer() (*workserver.Server, error) {
	panic(wire.Build(
		workserver.DefaultOptions,
		data.OpenDB,
		data.NewWorkRepository,
		workservice.New,
		workserver.New,
	))
}
