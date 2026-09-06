package sum

import (
	"context"

	sumpb "example.com/work-demo/internal/gateway/model/sum"
)

// Service contains the application logic for the local sum endpoint.
type Service struct{}

func New() *Service { return &Service{} }

func (s *Service) Add(_ context.Context, req *sumpb.AddRequest) (*sumpb.AddResponse, error) {
	return &sumpb.AddResponse{Result: req.GetLeft() + req.GetRight()}, nil
}
