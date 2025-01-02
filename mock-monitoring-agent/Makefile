export PATH := $(PATH):$(HOME)/.pub-cache/bin

gen:
	protoc --go_out=internal/gen/pb --go_opt=paths=source_relative \
	--go-grpc_out=internal/gen/pb --go-grpc_opt=paths=source_relative \
	--proto_path=../proto/internal ../proto/internal/*.proto

tidy:
	go mod tidy

run:
	air

build:
	go build ./tmp/main.exe ./cmd/main.go
