package data

import (
	"os"

	"entgo.io/ent/dialect"
	entsql "entgo.io/ent/dialect/sql"
	_ "github.com/go-sql-driver/mysql"

	"example.com/work-demo/kitex/internal/ent"
)

const DefaultDSN = "root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"

func dsn() string {
	if value := os.Getenv("MYSQL_DSN"); value != "" {
		return value
	}
	return DefaultDSN
}

func OpenDB() (*ent.Client, error) {
	driver, err := entsql.Open(dialect.MySQL, dsn())
	if err != nil {
		return nil, err
	}
	return ent.NewClient(ent.Driver(driver)), nil
}
