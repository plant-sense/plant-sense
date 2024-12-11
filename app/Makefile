gen:
	protoc --dart_out=grpc:lib/gen/grpc -I=lib/gen/grpc --proto_path=../proto/internal ../proto/internal/*.proto

gen_openapi:
	flutter run build_runner build --delete-conflicting-outputs