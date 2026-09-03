.PHONY: install install-go-tools gen gen-kitex gen-ent gen-wire gen-hz

KITEX ?= $(shell go env GOPATH)/bin/kitex
HZ ?= $(shell go env GOPATH)/bin/hz

install: install-go-tools

install-go-tools:
	go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
	go install github.com/cloudwego/hertz/cmd/hz@latest
	go install github.com/google/wire/cmd/wire@latest
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

gen: gen-kitex gen-ent gen-wire

gen-kitex:
	rm -rf service/test/kitex_gen/test service/user/kitex_gen/user service/work/kitex_gen/work
	cd service/test && $(KITEX) -module example.com/work-demo/service/test -gen-path kitex_gen -I ../../idl -I ../../api ../../idl/test/test.proto
	cd service/user && $(KITEX) -module example.com/work-demo/service/user -gen-path kitex_gen -I ../../idl ../../idl/user/user.proto
	cd service/work && $(KITEX) -module example.com/work-demo/service/work -gen-path kitex_gen -I ../../idl ../../idl/work/work.proto

gen-ent:
	go run ./cmd/entgen

gen-wire:
	go run github.com/google/wire/cmd/wire gen ./cmd/gateway
	go run github.com/google/wire/cmd/wire gen ./service/test/cmd
	go run github.com/google/wire/cmd/wire gen ./service/user/cmd
	go run github.com/google/wire/cmd/wire gen ./service/work/cmd

gen-hz:
	sh ./scripts/hz_gen.sh
