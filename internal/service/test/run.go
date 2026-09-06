package test

func Run() error {
	server, err := newServer()
	if err != nil {
		return err
	}

	return server.Run()
}
