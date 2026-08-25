package model

const TableNameUser = "users"

type User struct {
	ID   int64  `gorm:"column:id;type:BIGINT;primaryKey" json:"id"`
	Name string `gorm:"column:name;type:VARCHAR(255);not null" json:"name"`
}

func (User) TableName() string {
	return TableNameUser
}
