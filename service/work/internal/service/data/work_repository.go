package data

import (
	"context"

	"example.com/work-demo/service/work/internal/service/data/ent"
	"example.com/work-demo/service/work/internal/service/data/ent/work"
)

type Work struct {
	ID     int64
	Name   string
	UserID int64
}

type WorkRepository struct {
	client *ent.Client
}

func NewWorkRepository(client *ent.Client) *WorkRepository {
	return &WorkRepository{client: client}
}

func (r *WorkRepository) FindByID(ctx context.Context, workID int64) (*Work, error) {
	entity, err := r.client.Work.Query().Where(work.IDEQ(workID)).Only(ctx)
	if err != nil {
		return nil, err
	}

	return &Work{ID: entity.ID, Name: entity.Name, UserID: entity.UserID}, nil
}
