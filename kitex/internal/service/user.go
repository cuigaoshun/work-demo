package service

import (
	"context"
	"errors"

	"example.com/work-demo/kitex/internal/ent"
	"example.com/work-demo/kitex/internal/ent/user"
)

var ErrUserNotFound = errors.New("user not found")

type UserService struct {
	db *ent.Client
}

func NewUserService(db *ent.Client) *UserService {
	return &UserService{db: db}
}

func (s *UserService) GetUserName(ctx context.Context, userID int64) (string, error) {
	model, err := s.db.User.Query().Where(user.IDEQ(userID)).Only(ctx)
	if err != nil {
		if ent.IsNotFound(err) {
			return "", ErrUserNotFound
		}
		return "", err
	}

	return model.Name, nil
}
