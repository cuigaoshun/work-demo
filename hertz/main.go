package main

import (
	"context"
	"log"
	"strconv"

	user "example.com/work-demo/common/kitex_gen/user"
	userservice "example.com/work-demo/common/kitex_gen/user/userservice"
	"github.com/cloudwego/hertz/pkg/app"
	"github.com/cloudwego/hertz/pkg/app/server"
	kitexclient "github.com/cloudwego/kitex/client"
	"github.com/cloudwego/kitex/client/callopt"
	"github.com/cloudwego/kitex/pkg/kerrors"
)

type userNameClient interface {
	GetUserName(ctx context.Context, req *user.GetUserNameRequest, callOptions ...callopt.Option) (*user.GetUserNameResponse, error)
}

func userNameHandler(cli userNameClient) app.HandlerFunc {
	return func(ctx context.Context, c *app.RequestContext) {
		userID, err := strconv.ParseInt(c.Param("id"), 10, 64)
		if err != nil {
			c.JSON(400, map[string]string{"error": "invalid user id"})
			return
		}

		resp, err := cli.GetUserName(ctx, &user.GetUserNameRequest{UserId: userID})
		if err != nil {
			if bizErr, ok := kerrors.FromBizStatusError(err); ok {
				c.JSON(int(bizErr.BizStatusCode()), map[string]string{"error": bizErr.BizMessage()})
				return
			}
			c.JSON(500, map[string]string{"error": err.Error()})
			return
		}

		c.JSON(200, map[string]string{"name": resp.GetName()})
	}
}

func main() {
	cli, err := userservice.NewClient("userservice", kitexclient.WithHostPorts("127.0.0.1:8888"))
	if err != nil {
		log.Fatal(err)
	}

	h := server.Default(server.WithHostPorts("127.0.0.1:8080"))
	h.GET("/users/:id", userNameHandler(cli))

	h.Spin()
}
