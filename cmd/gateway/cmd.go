package gateway

import (
	gatewayservice "example.com/work-demo/internal/gateway"
	"example.com/work-demo/pkg/constants"
	"github.com/spf13/cobra"
)

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   constants.GatewayServiceName,
		Short: "start gateway server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return gatewayservice.Run()
		},
	}
}
