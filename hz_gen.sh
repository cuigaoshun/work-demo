#!/bin/sh

set -eu

HZ=${HZ:-"$(go env GOPATH)/bin/hz"}
MODULE=${MODULE:-example.com/work-demo}

# Keep generated routes in sync with each HTTP service IDL.
"$HZ" update --idl api/test/test_api.proto --module "$MODULE" -I . -I api
"$HZ" update --idl api/work/work.proto --module "$MODULE" -I . -I api