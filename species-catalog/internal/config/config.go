package config

var DefaultConfig = Config{
	PrettyLog: true,
}

type Config struct {
	PrettyLog bool
}
