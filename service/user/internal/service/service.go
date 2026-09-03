package user

import (
	"context"

	userdata "example.com/work-demo/service/user/internal/service/data"
	userpb "example.com/work-demo/service/user/kitex_gen/user"
)

type Service struct {
	repository *userdata.UserRepository
}

func New(repository *userdata.UserRepository) *Service {
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
