package main

import (
	"log"
	"net"

	user "example.com/work-demo/common/kitex_gen/user/userservice"
	"example.com/work-demo/kitex/internal/data"
	"example.com/work-demo/kitex/internal/service"
	"github.com/cloudwego/kitex/server"
)

func main() {
	db, err := data.OpenDB()
	if err != nil {
		log.Fatal(err)
	}

	addr, err := net.ResolveTCPAddr("tcp", "127.0.0.1:8888")
	if err != nil {
		log.Fatal(err)
	}

	handler := &UserServiceImpl{userService: service.NewUserService(db)}
	svr := user.NewServer(handler, server.WithServiceAddr(addr))

	err = svr.Run()

	if err != nil {
		log.Fatal(err)
	}
}
