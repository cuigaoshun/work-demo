package gateway

import (
	"context"
	"net/http"
	"strconv"

	userpb "example.com/work-demo/kitex_gen/user"
	"example.com/work-demo/kitex_gen/user/userservice"
	workpb "example.com/work-demo/kitex_gen/work"
	"example.com/work-demo/kitex_gen/work/workservice"
	"github.com/cloudwego/hertz/pkg/app"
)

type WorkHandler struct {
	userClient userservice.Client
	workClient workservice.Client
}

type workResponse struct {
	ID   int64        `json:"id"`
	Name string       `json:"name"`
	User userResponse `json:"user"`
}

type userResponse struct {
	ID   int64  `json:"id"`
	Name string `json:"name"`
}

func NewWorkHandler(userClient userservice.Client, workClient workservice.Client) *WorkHandler {
	return &WorkHandler{userClient: userClient, workClient: workClient}
}

func (h *WorkHandler) GetWork(ctx context.Context, c *app.RequestContext) {
	workID, err := strconv.ParseInt(c.Param("workID"), 10, 64)
	if err != nil || workID <= 0 {
		c.JSON(http.StatusBadRequest, map[string]string{"message": "invalid workID"})
		return
	}

	workResult, err := h.workClient.GetWork(ctx, &workpb.GetWorkRequest{WorkId: workID})
	if err != nil {
		c.JSON(http.StatusInternalServerError, map[string]string{"message": "get work failed"})
		return
	}

	work := workResult.GetWork()
	userResult, err := h.userClient.GetUser(ctx, &userpb.GetUserRequest{UserId: work.GetUserId()})
	if err != nil {
		c.JSON(http.StatusInternalServerError, map[string]string{"message": "get user failed"})
		return
	}

	user := userResult.GetUser()
	c.JSON(http.StatusOK, &workResponse{
		ID:   work.GetId(),
		Name: work.GetName(),
		User: userResponse{
			ID:   user.GetId(),
			Name: user.GetName(),
		},
	})
}
