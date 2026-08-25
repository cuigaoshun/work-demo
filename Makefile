.PHONY: gen gen-kitex gen-gorm gen-api-clients clean-api-clients

KITEX ?= $(shell go env GOPATH)/bin/kitex
PROTOC ?= protoc
PROTO_API_DIR ?= api
API_PROTO_FILES ?= api.proto user_http.proto
API_OUT_BASE ?= $(PROTO_API_DIR)
PROTOC_GEN_DART ?= $(shell command -v protoc-gen-dart 2>/dev/null)
PROTOC_GEN_SWIFT ?= $(shell command -v protoc-gen-swift 2>/dev/null)
PROTOC_GEN_ARKTS ?= $(shell command -v protoc-gen-ets 2>/dev/null)

gen: gen-kitex gen-gorm

gen-kitex:
	cd common && $(KITEX) -module example.com/work-demo/common -gen-path kitex_gen -I ../proto ../proto/user.proto

gen-gorm:
	cd kitex && go run ./cmd/gormgen

clean-api-clients:
	rm -rf $(API_OUT_BASE)/flutter $(API_OUT_BASE)/objc $(API_OUT_BASE)/swift $(API_OUT_BASE)/java $(API_OUT_BASE)/arkts $(API_OUT_BASE)/cpp

gen-api-clients: clean-api-clients
	mkdir -p $(API_OUT_BASE)/flutter $(API_OUT_BASE)/objc $(API_OUT_BASE)/swift $(API_OUT_BASE)/java $(API_OUT_BASE)/arkts $(API_OUT_BASE)/cpp
	@test -n "$(PROTOC_GEN_DART)" || (printf 'missing protoc-gen-dart\n' >&2; exit 1)
	@test -n "$(PROTOC_GEN_SWIFT)" || (printf 'missing protoc-gen-swift\n' >&2; exit 1)
	@test -n "$(PROTOC_GEN_ARKTS)" || (printf 'missing protoc-gen-ets\n' >&2; exit 1)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --dart_out=../$(API_OUT_BASE)/flutter $(API_PROTO_FILES)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --objc_out=../$(API_OUT_BASE)/objc $(API_PROTO_FILES)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --swift_out=../$(API_OUT_BASE)/swift $(API_PROTO_FILES)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --java_out=../$(API_OUT_BASE)/java $(API_PROTO_FILES)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --plugin=protoc-gen-ets=$(PROTOC_GEN_ARKTS) --ets_out=../$(API_OUT_BASE)/arkts $(API_PROTO_FILES)
	cd $(PROTO_API_DIR) && $(PROTOC) -I . --cpp_out=../$(API_OUT_BASE)/cpp $(API_PROTO_FILES)
