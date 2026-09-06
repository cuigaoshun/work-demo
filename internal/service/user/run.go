package user

func Run() error {
	server, err := newServer()
	if err != nil {
		return err
	}

	return server.Run()
}
