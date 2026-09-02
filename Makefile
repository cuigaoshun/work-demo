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
	rm -rf kitex_gen/test kitex_gen/user kitex_gen/work
	$(KITEX) -module example.com/work-demo -gen-path kitex_gen -I idl -I api idl/test/test.proto
	$(KITEX) -module example.com/work-demo -gen-path kitex_gen -I idl idl/user/user.proto
	$(KITEX) -module example.com/work-demo -gen-path kitex_gen -I idl idl/work/work.proto

gen-ent:
	go run ./cmd/entgen

gen-wire:
	go run github.com/google/wire/cmd/wire gen ./cmd/gateway
	go run github.com/google/wire/cmd/wire gen ./cmd/test
	go run github.com/google/wire/cmd/wire gen ./cmd/user
	go run github.com/google/wire/cmd/wire gen ./cmd/work

gen-hz:
	sh ./hz_gen.sh
