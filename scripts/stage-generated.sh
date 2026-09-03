#!/usr/bin/env bash

set -euo pipefail

# Shared generated artifacts.
git add -f -- \
  generated \
  internal/gateway/model \
  internal/gateway/handler \
  internal/gateway/router

# Ent-generated artifacts. Add new service outputs here.
git add -f -- \
  service/user/kitex_gen \
  service/work/kitex_gen \
  service/test/kitex_gen \
  service/user/internal/service/data/ent \
  service/work/internal/service/data/ent

# Wire-generated injectors. Add new service injectors here.
git add -f -- \
  cmd/gateway/wire_gen.go \
  service/test/cmd/wire_gen.go \
  service/user/cmd/wire_gen.go \
  service/work/cmd/wire_gen.go
