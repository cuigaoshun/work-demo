package work

import (
	workserver "example.com/work-demo/internal/server/work"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func Run() error {
	return workserver.NewServer(nil).Run()
}

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.WorkServiceName,
		Short: "start work server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return Run()
		},
	}
}
