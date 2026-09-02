package main

import (
	"log"
	"os"
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
	servicesDir := filepath.Join(root, "internal", "service")
	services, err := os.ReadDir(servicesDir)
	if err != nil {
		log.Fatal(err)
	}

	for _, service := range services {
		if !service.IsDir() {
			continue
		}
		target := filepath.Join(servicesDir, service.Name(), "data", "ent")
		schema := filepath.Join(target, "schema")
		if _, err := os.Stat(schema); os.IsNotExist(err) {
			continue
		} else if err != nil {
			log.Fatal(err)
		}
		if err := entc.Generate(schema, &gen.Config{Target: target}); err != nil {
			log.Fatal(err)
		}
	}
}
