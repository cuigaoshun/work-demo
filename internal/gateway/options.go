package gateway

type Options struct {
	Addr     string
	TestAddr string
	UserAddr string
	WorkAddr string
}

func DefaultOptions() *Options {
	return &Options{
		Addr:     "127.0.0.1:8080",
		TestAddr: "127.0.0.1:8888",
		UserAddr: "127.0.0.1:8889",
		WorkAddr: "127.0.0.1:8890",
	}
}
