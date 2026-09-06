package test

import (
	testservice "example.com/work-demo/internal/service/test"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.TestServiceName,
		Short: "start test server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return testservice.Run()
		},
	}
}
