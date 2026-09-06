package work

import (
	workservice "example.com/work-demo/internal/service/work"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.WorkServiceName,
		Short: "start work server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return workservice.Run()
		},
	}
}
