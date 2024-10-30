install:
	go install github.com/oapi-codegen/oapi-codegen/v2/cmd/oapi-codegen@latest
	go install github.com/onsi/ginkgo/v2/ginkgo

build-image:
	docker build -t eustachy .

build-image-clean:
	docker build --no-cache --progress=plain -t eustachy .

compose-up:
	docker compose up --force-recreate --remove-orphans

tidy:
	go mod tidy

run:
	go run ./cmd/

test:
	ginkgo -r -v

gen:
	oapi-codegen --config ./.oapi-codegen.yml -o ./internal/api/api.gen.go ./api/openapi.yml