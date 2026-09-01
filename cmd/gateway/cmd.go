package gateway

import (
	gatewayserver "example.com/work-demo/internal/server/gateway"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func Run() error {
	return gatewayserver.NewServer(nil).Run()
}

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.GatewayServiceName,
		Short: "start gateway server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return Run()
		},
	}
}
