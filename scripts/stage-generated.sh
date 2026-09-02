#!/usr/bin/env bash

set -euo pipefail

# Shared generated artifacts.
git add -f -- \
  generated \
  kitex_gen \
  internal/gateway/model \
  internal/gateway/handler \
  internal/gateway/router

# Ent-generated artifacts. Add new service outputs here.
git add -f -- \
  internal/service/user/data/ent \
  internal/service/work/data/ent

# Wire-generated injectors. Add new service injectors here.
git add -f -- \
  cmd/gateway/wire_gen.go \
  cmd/test/wire_gen.go \
  cmd/user/wire_gen.go \
  cmd/work/wire_gen.go
