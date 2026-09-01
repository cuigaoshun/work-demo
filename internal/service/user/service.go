package user

import (
	"context"

	"example.com/work-demo/internal/data"
	userpb "example.com/work-demo/kitex_gen/user"
)

type Service struct {
	repository *data.UserRepository
}

func New(repository *data.UserRepository) *Service {
	return &Service{repository: repository}
}

func (s *Service) GetUser(ctx context.Context, req *userpb.GetUserRequest) (*userpb.GetUserResponse, error) {
	user, err := s.repository.FindByID(ctx, req.GetUserId())
	if err != nil {
		return nil, err
	}

	return &userpb.GetUserResponse{
		User: &userpb.User{
			Id:   user.ID,
			Name: user.Name,
		},
	}, nil
}
