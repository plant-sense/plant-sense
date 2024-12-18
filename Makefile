gen_openapi:
	cd ./app && make gen_openapi
	cd ./user-data && make gen_openapi
	cd ./plants-db && make gen_openapi

test:
	cd ./plants-db && go test -v ./internal/repository
	cd ./user-data && go test -v ./internal/repository