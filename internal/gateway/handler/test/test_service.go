package test

import (
	"context"
	"encoding/json"

	client "example.com/work-demo/internal/gateway/client"
	model "example.com/work-demo/internal/gateway/model/test"
	testpb "example.com/work-demo/kitex_gen/test"
	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/protocol/consts"
)

// TestFields is the handler referenced by the API route registration.
func TestFields(ctx context.Context, c *app.RequestContext) {
	testClient := client.GetTest()

	request := new(model.TestFieldsRequest)
	if err := c.BindAndValidate(request); err != nil {
		c.String(consts.StatusBadRequest, err.Error())
		return
	}

	payload, err := json.Marshal(request)
	if err != nil {
		c.String(consts.StatusInternalServerError, err.Error())
		return
	}

	rpcRequest := new(testpb.TestFieldsRequest)
	if err = json.Unmarshal(payload, rpcRequest); err != nil {
		c.String(consts.StatusBadRequest, err.Error())
		return
	}

	rpcResponse, err := testClient.TestFields(ctx, rpcRequest)
	if err != nil {
		c.String(consts.StatusInternalServerError, err.Error())
		return
	}

	payload, err = json.Marshal(rpcResponse)
	if err != nil {
		c.String(consts.StatusInternalServerError, err.Error())
		return
	}

	response := new(model.TestFieldsResponse)
	if err = json.Unmarshal(payload, response); err != nil {
		c.String(consts.StatusInternalServerError, err.Error())
		return
	}

	c.JSON(consts.StatusOK, response)
}
