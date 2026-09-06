package user

import (
	userservice "example.com/work-demo/internal/service/user"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.UserServiceName,
		Short: "start user server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return userservice.Run()
		},
	}
}
