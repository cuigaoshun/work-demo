.PHONY: gen gen-kitex gen-gorm

KITEX ?= $(shell go env GOPATH)/bin/kitex

gen: gen-kitex gen-gorm

gen-kitex:
	cd common && $(KITEX) -module example.com/work-demo/common -gen-path kitex_gen -I ../proto ../proto/user.proto

gen-gorm:
	cd kitex && go run ./cmd/gormgen
