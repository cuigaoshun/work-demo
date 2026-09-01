package user

import (
	userserver "example.com/work-demo/internal/server/user"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func Run() error {
	return userserver.NewServer(nil).Run()
}

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.UserServiceName,
		Short: "start user server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return Run()
		},
	}
}
