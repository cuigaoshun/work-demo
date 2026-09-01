package data

import (
	"context"

	"example.com/work-demo/internal/ent"
	"example.com/work-demo/internal/ent/user"
)

type User struct {
	ID   int64
	Name string
}

type UserRepository struct {
	client *ent.Client
}

func NewUserRepository(client *ent.Client) *UserRepository {
	return &UserRepository{client: client}
}

func (r *UserRepository) FindByID(ctx context.Context, userID int64) (*User, error) {
	entity, err := r.client.User.Query().Where(user.IDEQ(userID)).Only(ctx)
	if err != nil {
		return nil, err
	}

	return &User{ID: entity.ID, Name: entity.Name}, nil
}
