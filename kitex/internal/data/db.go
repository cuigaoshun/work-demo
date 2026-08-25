package data

import (
	"os"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

const DefaultDSN = "root:123456@tcp(127.0.0.1:3306)/test?charset=utf8mb4&parseTime=True&loc=Local"

func dsn() string {
	if value := os.Getenv("MYSQL_DSN"); value != "" {
		return value
	}
	return DefaultDSN
}

func OpenDB() (*gorm.DB, error) {
	return gorm.Open(mysql.Open(dsn()), &gorm.Config{})
}
