package main

import (
	"github.com/spf13/cobra"
)

func Run() error {
	service, err := NewServer()
	if err != nil {
		return err
	}

	return service.Run()
}

func NewCommand() *cobra.Command {
	return &cobra.Command{
		Use:   "user",
		Short: "start user server",
		RunE: func(cmd *cobra.Command, args []string) error {
			return Run()
		},
	}
}
