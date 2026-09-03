package user

type Options struct {
	Addr string
}

func DefaultOptions() *Options {
	return &Options{Addr: "127.0.0.1:8889"}
}
