package main

import (
	"context"

	user "example.com/work-demo/common/kitex_gen/test"
)

// TestServiceImpl implements the TestService interface defined in the IDL.
type TestServiceImpl struct{}

var _ user.TestService = (*TestServiceImpl)(nil)

// TestFields implements the TestService interface.
func (s *TestServiceImpl) TestFields(ctx context.Context, req *user.TestFieldsRequest) (resp *user.TestFieldsResponse, err error) {
	return &user.TestFieldsResponse{
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
