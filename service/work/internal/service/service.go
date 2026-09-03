package work

import (
	"context"

	workdata "example.com/work-demo/service/work/internal/service/data"
	workpb "example.com/work-demo/service/work/kitex_gen/work"
)

type Service struct {
	repository *workdata.WorkRepository
}

func New(repository *workdata.WorkRepository) *Service {
	return &Service{repository: repository}
}

func (s *Service) GetWork(ctx context.Context, req *workpb.GetWorkRequest) (*workpb.GetWorkResponse, error) {
	work, err := s.repository.FindByID(ctx, req.GetWorkId())
	if err != nil {
		return nil, err
	}

	return &workpb.GetWorkResponse{
		Work: &workpb.Work{
			Id:     work.ID,
			Name:   work.Name,
			UserId: work.UserID,
		},
	}, nil
}
