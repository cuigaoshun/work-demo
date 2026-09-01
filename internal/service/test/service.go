package test

import (
	"context"

	testpb "example.com/work-demo/kitex_gen/test"
)

type Service struct{}

func New() *Service {
	return &Service{}
}

func (s *Service) TestFields(ctx context.Context, req *testpb.TestFieldsRequest) (*testpb.TestFieldsResponse, error) {
	return &testpb.TestFieldsResponse{
		Int32Value:      req.GetInt32Value(),
		Uint32Value:     req.GetUint32Value(),
		Int64Value:      req.GetInt64Value(),
		Uint64Value:     req.GetUint64Value(),
		BoolValue:       req.GetBoolValue(),
		StringValue:     req.GetStringValue(),
		EnumValue:       req.GetEnumValue(),
		NestedValue:     req.GetNestedValue(),
		RepeatedStrings: req.GetRepeatedStrings(),
		RepeatedInt32:   req.GetRepeatedInt32(),
		RepeatedEnums:   req.GetRepeatedEnums(),
		RepeatedNested:  req.GetRepeatedNested(),
		StringMap:       req.GetStringMap(),
		NumericMap:      req.GetNumericMap(),
		NestedMap:       req.GetNestedMap(),
	}, nil
}
