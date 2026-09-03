package data

import (
	"os"

	"entgo.io/ent/dialect"
	entsql "entgo.io/ent/dialect/sql"
	"example.com/work-demo/service/work/internal/service/data/ent"
	_ "github.com/go-sql-driver/mysql"
)

const defaultDSN = "root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"

func OpenDB() (*ent.Client, error) {
	dsn := os.Getenv("MYSQL_DSN")
	if dsn == "" {
		dsn = defaultDSN
	}

	driver, err := entsql.Open(dialect.MySQL, dsn)
	if err != nil {
		return nil, err
	}

	return ent.NewClient(ent.Driver(driver)), nil
}
