package registry

import (
	sumservice "example.com/work-demo/internal/service/sum"
	"sync"
)

type ServiceRegistry struct{ sum *sumservice.Service }

func NewServiceRegistry(sum *sumservice.Service) *ServiceRegistry {
	if sum == nil {
		sum = sumservice.New()
	}
	return &ServiceRegistry{sum: sum}
}
func (r *ServiceRegistry) Sum() *sumservice.Service { return r.sum }

var defaultServices *ServiceRegistry
var defaultServicesOnce sync.Once

func SetDefaultServices(services *ServiceRegistry) {
	if services == nil {
		panic("service registry is nil")
	}
	initialized := false
	defaultServicesOnce.Do(func() { defaultServices = services; initialized = true })
	if !initialized {
		panic("service registry is already initialized")
	}
}
func GetServices() *ServiceRegistry {
	if defaultServices == nil {
		panic("service registry is not initialized")
	}
	return defaultServices
}
