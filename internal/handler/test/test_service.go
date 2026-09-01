package test

import (
	"context"
	"encoding/json"

	model "example.com/work-demo/internal/model/test"
	testpb "example.com/work-demo/kitex_gen/test"
	"example.com/work-demo/kitex_gen/test/testservice"
	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/protocol/consts"
)

type Handler struct {
	client testservice.Client
}

var defaultHandler *Handler

func New(client testservice.Client) *Handler {
	h := &Handler{client: client}
	defaultHandler = h
	return h
}

// TestFields is the handler referenced by the API route registration.
func TestFields(ctx context.Context, c *app.RequestContext) {
	if defaultHandler == nil {
		c.String(consts.StatusInternalServerError, "test handler is not initialized")
		return
	}
	defaultHandler.handleTestFields(ctx, c)
}

func (h *Handler) handleTestFields(ctx context.Context, c *app.RequestContext) {
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

	rpcResponse, err := h.client.TestFields(ctx, rpcRequest)
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
