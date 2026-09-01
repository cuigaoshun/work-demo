.PHONY: install install-go-tools gen gen-kitex gen-ent gen-wire gen-hz gen-api-clients clean-api-clients \
	gen-api-client-dart gen-api-client-swift gen-api-client-java \
	gen-api-client-typescript gen-api-client-cpp gen-api-client-objc \
	clean-api-client-dart clean-api-client-swift clean-api-client-java \
	clean-api-client-typescript clean-api-client-cpp clean-api-client-objc

KITEX ?= $(shell go env GOPATH)/bin/kitex
HZ ?= $(shell go env GOPATH)/bin/hz
PROTOC ?= protoc
PROTO_API_DIR ?= api
API_PROTO_FILES ?= api.proto test/test_api.proto work/work.proto
API_OUT_BASE ?= generated
PROTOC_GEN_DART ?= $(shell command -v protoc-gen-dart 2>/dev/null)
PROTOC_GEN_SWIFT ?= $(shell command -v protoc-gen-swift 2>/dev/null)
PROTOC_GEN_TS_PROTO ?= $(shell command -v protoc-gen-ts_proto 2>/dev/null)

install: install-go-tools

install-go-tools:
	go install github.com/cloudwego/kitex/tool/cmd/kitex@latest
	go install github.com/cloudwego/hertz/cmd/hz@latest
	go install github.com/google/wire/cmd/wire@latest
	go install google.golang.org/protobuf/cmd/protoc-gen-go@latest

gen: gen-kitex gen-ent gen-wire

gen-kitex:
	rm -rf kitex_gen/test kitex_gen/user kitex_gen/work
	$(KITEX) -module example.com/work-demo -gen-path kitex_gen -I idl idl/test/test.proto
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
	$(HZ) update --idl api/test/test_api.proto --idl api/work/work.proto --module example.com/work-demo -I api

clean-api-clients: clean-api-client-dart clean-api-client-objc clean-api-client-swift clean-api-client-java clean-api-client-typescript clean-api-client-cpp

clean-api-client-dart:
	rm -rf $(API_OUT_BASE)/flutter

clean-api-client-objc:
	rm -rf $(API_OUT_BASE)/objc

clean-api-client-swift:
	rm -rf $(API_OUT_BASE)/swift

clean-api-client-java:
	rm -rf $(API_OUT_BASE)/java

clean-api-client-typescript:
	rm -rf $(API_OUT_BASE)/typescript

clean-api-client-cpp:
	rm -rf $(API_OUT_BASE)/cpp

gen-api-clients: gen-api-client-dart gen-api-client-objc gen-api-client-swift gen-api-client-java gen-api-client-typescript gen-api-client-cpp

gen-api-client-dart: clean-api-client-dart
	mkdir -p $(API_OUT_BASE)/flutter
	@test -n "$(PROTOC_GEN_DART)" || (printf 'missing protoc-gen-dart\n' >&2; exit 1)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --dart_out=../$(API_OUT_BASE)/flutter $(API_PROTO_FILES)

gen-api-client-objc: clean-api-client-objc
	mkdir -p $(API_OUT_BASE)/objc
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --objc_out=../$(API_OUT_BASE)/objc $(API_PROTO_FILES)

gen-api-client-swift: clean-api-client-swift
	mkdir -p $(API_OUT_BASE)/swift
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --swift_out=../$(API_OUT_BASE)/swift $(API_PROTO_FILES)

gen-api-client-java: clean-api-client-java
	mkdir -p $(API_OUT_BASE)/java
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --java_out=../$(API_OUT_BASE)/java $(API_PROTO_FILES)

gen-api-client-typescript: clean-api-client-typescript
	mkdir -p $(API_OUT_BASE)/typescript
	@test -n "$(PROTOC_GEN_TS_PROTO)" || (printf 'missing protoc-gen-ts_proto\n' >&2; exit 1)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --plugin=protoc-gen-ts_proto=$(PROTOC_GEN_TS_PROTO) --ts_proto_out=../$(API_OUT_BASE)/typescript $(API_PROTO_FILES)

gen-api-client-cpp: clean-api-client-cpp
	mkdir -p $(API_OUT_BASE)/cpp
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --cpp_out=../$(API_OUT_BASE)/cpp $(API_PROTO_FILES)
