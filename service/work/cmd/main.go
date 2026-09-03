package main

import "github.com/cloudwego/kitex/pkg/klog"

func main() {
	if err := Run(); err != nil {
		klog.Fatal(err)
	}
}
