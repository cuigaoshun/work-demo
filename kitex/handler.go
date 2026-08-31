package main

import (
	"context"
	"errors"

	user "example.com/work-demo/common/kitex_gen/user"
	"example.com/work-demo/kitex/internal/service"
	"github.com/cloudwego/kitex/pkg/kerrors"
)

// UserServiceImpl implements the last service interface defined in the IDL.
type UserServiceImpl struct {
	userService *service.UserService
}

// GetUserName implements the UserServiceImpl interface.
func (s *UserServiceImpl) GetUserName(ctx context.Context, req *user.GetUserNameRequest) (resp *user.GetUserNameResponse, err error) {
	name, err := s.userService.GetUserName(ctx, req.GetUserId())
	if err != nil {
		if errors.Is(err, service.ErrUserNotFound) {
			return nil, kerrors.NewBizStatusError(404, err.Error())
		}
		return nil, err
	}

	return &user.GetUserNameResponse{
		Name:            name,
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
