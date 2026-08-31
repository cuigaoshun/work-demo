package main

import (
	"log"
	"net"

	user "example.com/work-demo/common/kitex_gen/test/testservice"
	"github.com/cloudwego/kitex/server"
)

func main() {
	addr, err := net.ResolveTCPAddr("tcp", "127.0.0.1:8888")
	if err != nil {
		log.Fatal(err)
	}

	handler := &TestServiceImpl{}
	svr := user.NewServer(handler, server.WithServiceAddr(addr))

	err = svr.Run()

	if err != nil {
		log.Fatal(err)
	}
}
