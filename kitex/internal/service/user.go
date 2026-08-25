package service

import (
	"context"
	"errors"

	"gorm.io/gorm"

	"example.com/work-demo/kitex/internal/dal/query"
)

var ErrUserNotFound = errors.New("user not found")

type UserService struct {
	db *gorm.DB
}

func NewUserService(db *gorm.DB) *UserService {
	return &UserService{db: db}
}

func (s *UserService) GetUserName(ctx context.Context, userID int64) (string, error) {
	u := query.Use(s.db).User
	model, err := u.WithContext(ctx).Where(u.ID.Eq(userID)).First()
	if err != nil {
		if errors.Is(err, gorm.ErrRecordNotFound) {
			return "", ErrUserNotFound
		}
		return "", err
	}

	return model.Name, nil
}
