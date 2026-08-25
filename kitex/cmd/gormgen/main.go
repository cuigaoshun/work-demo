package main

import (
	"log"
	"path/filepath"
	"runtime"

	"gorm.io/gen"

	"example.com/work-demo/kitex/internal/dal/model"
	"example.com/work-demo/kitex/internal/data"
)

func moduleRoot() string {
	_, filename, _, ok := runtime.Caller(0)
	if !ok {
		log.Fatal("resolve gormgen source path failed")
	}

	return filepath.Clean(filepath.Join(filepath.Dir(filename), "..", ".."))
}

func main() {
	db, err := data.OpenDB()
	if err != nil {
		log.Fatal(err)
	}

	root := moduleRoot()
	g := gen.NewGenerator(gen.Config{
		OutPath:      filepath.Join(root, "internal", "dal", "query"),
		ModelPkgPath: "internal/dal/model",
		Mode:         gen.WithDefaultQuery | gen.WithQueryInterface,
	})
	g.UseDB(db)
	g.ApplyBasic(model.User{})
	g.Execute()
}
