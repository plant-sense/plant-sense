install:
	go install github.com/air-verse/air@latest
	go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest	
# go install github.com/onsi/ginkgo/v2/ginkgo

build-image:
	docker build -t eustachy .

build-image-clean:
	docker build --no-cache --progress=plain -t eustachy .

compose-up:
	docker compose up --force-recreate --remove-orphans

tidy:
	go mod tidy

run:
	air

build:
	go build --tags "fts5"  -o ./tmp/main.exe ./cmd/main.go

test:
	ginkgo -r -v

gen: gen_openapi

gen_openapi: 
	oapi-codegen --config ./.oapi-codegen.yml -o ./internal/api/api.gen.go ./api/openapi.yml