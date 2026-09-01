package test

import (
	"context"
	"strings"

	client "example.com/work-demo/internal/gateway/client"
	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/protocol/consts"
)

// Proxy forwards protobuf requests to TestService using the path suffix as the method name.
// For example, POST /test/TestFields forwards to TestService.TestFields.
func Proxy(ctx context.Context, c *app.RequestContext) {
	method := strings.Trim(strings.TrimPrefix(c.Param("path"), "/"), "/")
	if method == "" || strings.Contains(method, "/") {
		c.String(consts.StatusBadRequest, "invalid test method")
		return
	}

	body := c.GetRawData()
	response, err := client.GetTest().GenericCall(ctx, method, body)
	if err != nil {
		c.String(consts.StatusBadGateway, err.Error())
		return
	}

	c.Data(consts.StatusOK, "application/protobuf", response.([]byte))
}
