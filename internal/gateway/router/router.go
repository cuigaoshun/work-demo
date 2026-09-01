package router

import (
	"context"

	testhandler "example.com/work-demo/internal/gateway/handler/test"
	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/app/server"
	"github.com/cloudwego/hertz/pkg/protocol/consts"
)

// Register installs generated IDL routes and application-owned routes.
func Register(r *server.Hertz) {
	GeneratedRegister(r)
	customizedRegister(r)
}

func customizedRegister(r *server.Hertz) {
	r.Any("/test/*path", testhandler.Proxy)
	r.Any("/testjson/*path", testhandler.ProxyJSON)
	// Keep application-owned routes outside generated files so hz update is safe.
	r.GET("/ping", func(_ context.Context, c *app.RequestContext) {
		c.String(consts.StatusOK, "pong")
	})
}
