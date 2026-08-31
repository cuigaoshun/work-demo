package service

import (
	"context"
	"errors"

	"example.com/work-demo/kitex/internal/ent"
	"example.com/work-demo/kitex/internal/ent/user"
)

var ErrUserNotFound = errors.New("test not found")

type TestService struct {
	db *ent.Client
}

func NewTestService(db *ent.Client) *TestService {
	return &TestService{db: db}
}

func (s *TestService) GetUserName(ctx context.Context, userID int64) (string, error) {
	model, err := s.db.User.Query().Where(user.IDEQ(userID)).Only(ctx)
	if err != nil {
		if ent.IsNotFound(err) {
			return "", ErrUserNotFound
		}
		return "", err
	}

	return model.Name, nil
}
