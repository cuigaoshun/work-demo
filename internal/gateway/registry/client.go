// Package registry exposes gateway dependencies to Hertz-generated handlers.
package registry

import (
	"sync"

	"example.com/work-demo/kitex_gen/user/userservice"
	"example.com/work-demo/kitex_gen/work/workservice"
	"github.com/cloudwego/kitex/client/genericclient"
)

// Registry contains all outbound RPC clients used by the gateway.
type Registry struct {
	test     genericclient.Client
	testJSON genericclient.Client
	user     userservice.Client
	work     workservice.Client
}

func NewClientRegistry(test genericclient.Client, testJSON genericclient.Client, user userservice.Client, work workservice.Client) *Registry {
	return &Registry{test: test, testJSON: testJSON, user: user, work: work}
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

func (r *Registry) Test() genericclient.Client {
	return r.test
}

func (r *Registry) TestJSON() genericclient.Client {
	return r.testJSON
}

func (r *Registry) User() userservice.Client {
	return r.user
}

func (r *Registry) Work() workservice.Client {
	return r.work
}

func GetTest() genericclient.Client {
	return Get().Test()
}

func GetTestJSON() genericclient.Client {
	return Get().TestJSON()
}

func GetUser() userservice.Client {
	return Get().User()
}

func GetWork() workservice.Client {
	return Get().Work()
}
