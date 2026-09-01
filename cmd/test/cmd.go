package test

import (
	testserver "example.com/work-demo/internal/server/test"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func Run() error {
	return testserver.NewServer(nil).Run()
}

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.TestServiceName,
		Short: "start test server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return Run()
		},
	}
}
