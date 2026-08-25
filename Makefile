.PHONY: gen gen-kitex gen-hertz gen-gorm

KITEX ?= $(shell go env GOPATH)/bin/kitex
HZ ?= $(shell go env GOPATH)/bin/hz

gen: gen-kitex gen-hertz gen-gorm

gen-kitex:
	cd common && $(KITEX) -module example.com/work-demo/common -gen-path kitex_gen -I ../proto ../proto/user.proto

gen-hertz:
	$(HZ) update -module example.com/work-demo/hertz -idl api/user_http.proto --out_dir hertz

gen-gorm:
	cd kitex && go run ./cmd/gormgen
