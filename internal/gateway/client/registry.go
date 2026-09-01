// Package client exposes gateway RPC clients to Hertz-generated handler functions.
package client

import (
	"sync"

	"example.com/work-demo/kitex_gen/test/testservice"
	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
)

// Registry contains all outbound RPC clients used by the gateway.
type Registry struct {
	test testservice.Client
	user userservice.Client
	work workservice.Client
}

func NewClientRegistry(test testservice.Client, user userservice.Client, work workservice.Client) *Registry {
	return &Registry{test: test, user: user, work: work}
}

var (
	defaultRegistry     *Registry
	defaultRegistryOnce sync.Once
)

// SetDefault initializes the registry once during gateway startup.
func SetDefault(registry *Registry) {
	if registry == nil {
		panic("client registry is nil")
	}

	initialized := false
	defaultRegistryOnce.Do(func() {
		defaultRegistry = registry
		initialized = true
	})
	if !initialized {
		panic("client registry is already initialized")
	}
}

// Get returns the client registry published during gateway startup.
func Get() *Registry {
	if defaultRegistry == nil {
		panic("client registry is not initialized")
	}
	return defaultRegistry
}

func (r *Registry) Test() testservice.Client {
	return r.test
}

func (r *Registry) User() userservice.Client {
	return r.user
}

func (r *Registry) Work() workservice.Client {
	return r.work
}

func GetTest() testservice.Client {
	return Get().Test()
}

func GetUser() userservice.Client {
	return Get().User()
}

func GetWork() workservice.Client {
	return Get().Work()
}
