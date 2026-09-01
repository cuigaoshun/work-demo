package main

import (
	"log"
	"path/filepath"
	"runtime"

	"entgo.io/ent/entc"
	"entgo.io/ent/entc/gen"
)

func moduleRoot() string {
	_, filename, _, ok := runtime.Caller(0)
	if !ok {
		log.Fatal("resolve entgen source path failed")
	}
	return filepath.Clean(filepath.Join(filepath.Dir(filename), "..", ".."))
}

func main() {
	root := moduleRoot()
	schema := filepath.Join(root, "internal", "ent", "schema")
	if err := entc.Generate(schema, &gen.Config{Target: filepath.Join(root, "internal", "ent")}); err != nil {
		log.Fatal(err)
	}
}
