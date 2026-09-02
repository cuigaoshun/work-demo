.PHONY: gen-api-clients clean-api-clients \
	gen-api-client-dart gen-api-client-swift gen-api-client-java \
	gen-api-client-typescript gen-api-client-cpp gen-api-client-objc \
	clean-api-client-dart clean-api-client-swift clean-api-client-java \
	clean-api-client-typescript clean-api-client-cpp clean-api-client-objc

ROOT ?= $(abspath $(dir $(lastword $(MAKEFILE_LIST)))/..)
PROTOC ?= protoc
API_PROTO_FILES ?= api.proto test/test_api.proto work/work.proto sum/sum.proto
API_OUT_BASE ?= $(ROOT)/generated
PROTOC_GEN_DART ?= $(shell command -v protoc-gen-dart 2>/dev/null)
PROTOC_GEN_TS_PROTO ?= $(shell command -v protoc-gen-ts_proto 2>/dev/null)

clean-api-clients: clean-api-client-dart clean-api-client-objc clean-api-client-swift clean-api-client-java clean-api-client-typescript clean-api-client-cpp
clean-api-client-dart:
	rm -rf $(API_OUT_BASE)/flutter
clean-api-client-objc clean-api-client-swift clean-api-client-java clean-api-client-typescript clean-api-client-cpp:
	rm -rf $(API_OUT_BASE)/$(@:clean-api-client-%=%)

gen-api-clients: gen-api-client-dart gen-api-client-objc gen-api-client-swift gen-api-client-java gen-api-client-typescript gen-api-client-cpp
gen-api-client-dart: clean-api-client-dart
	mkdir -p $(API_OUT_BASE)/flutter
	@test -n "$(PROTOC_GEN_DART)" || (printf 'missing protoc-gen-dart\n' >&2; exit 1)
	cd $(ROOT)/api && $(PROTOC) -I . --dart_out=$(API_OUT_BASE)/flutter $(API_PROTO_FILES)
gen-api-client-objc: clean-api-client-objc
	mkdir -p $(API_OUT_BASE)/objc && cd $(ROOT)/api && $(PROTOC) -I . --objc_out=$(API_OUT_BASE)/objc $(API_PROTO_FILES)
gen-api-client-swift: clean-api-client-swift
	mkdir -p $(API_OUT_BASE)/swift && cd $(ROOT)/api && $(PROTOC) -I . --swift_out=$(API_OUT_BASE)/swift $(API_PROTO_FILES)
gen-api-client-java: clean-api-client-java
	mkdir -p $(API_OUT_BASE)/java && cd $(ROOT)/api && $(PROTOC) -I . --java_out=$(API_OUT_BASE)/java $(API_PROTO_FILES)
gen-api-client-typescript: clean-api-client-typescript
	mkdir -p $(API_OUT_BASE)/typescript
	@test -n "$(PROTOC_GEN_TS_PROTO)" || (printf 'missing protoc-gen-ts_proto\n' >&2; exit 1)
	cd $(ROOT)/api && $(PROTOC) -I . --plugin=protoc-gen-ts_proto=$(PROTOC_GEN_TS_PROTO) --ts_proto_out=$(API_OUT_BASE)/typescript $(API_PROTO_FILES)
gen-api-client-cpp: clean-api-client-cpp
	mkdir -p $(API_OUT_BASE)/cpp && cd $(ROOT)/api && $(PROTOC) -I . --cpp_out=$(API_OUT_BASE)/cpp $(API_PROTO_FILES)
