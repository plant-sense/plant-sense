export PATH := $(PATH):$(HOME)/.pub-cache/bin:$(HOME)/misc/flutter/bin


gen_openapi:
	cd ./app && make gen_openapi
	cd ./user-data && make gen_openapi
	cd ./species-catalog && make gen_openapi

test:
	cd ./species-catalog && go test -v ./internal/repository
	cd ./user-data && go test -v ./internal/repository
