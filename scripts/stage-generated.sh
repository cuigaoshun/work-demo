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
  internal/service/user/internal/data/ent \
  internal/service/work/internal/data/ent

# Wire-generated injectors. Add new service injectors here.
git add -f -- \
  internal/gateway/wire_gen.go \
  internal/service/test/wire_gen.go \
  internal/service/user/wire_gen.go \
  internal/service/work/wire_gen.go
