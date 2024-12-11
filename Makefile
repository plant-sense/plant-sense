gen_openapi:
	cd ./app && make gen_openapi
	cd ./user-data && make gen_openapi
	cd ./plants-db && make gen_openapi