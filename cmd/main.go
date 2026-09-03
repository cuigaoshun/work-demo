package main

import (
	goflag "flag"

	"example.com/work-demo/cmd/gateway"
	"github.com/cloudwego/kitex/pkg/klog"
	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "work-demo",
	Short: "work-demo module",
}

func main() {
	rootCmd.PersistentFlags().AddGoFlagSet(goflag.CommandLine)
	rootCmd.AddCommand(
		gateway.NewCommand(),
	)

	if err := rootCmd.Execute(); err != nil {
		klog.Fatal(err)
	}
}
