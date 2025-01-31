FROM ghcr.io/cirruslabs/flutter:3.27.3 AS builder

ARG USER_DATA_API_BASE_PATH
ARG PLANTS_DB_API_BASE_PATH
ARG DEVICE_GRPC_HOST
ARG DEVICE_GRPC_PORT

WORKDIR /app

COPY pubspec.* ./

RUN flutter pub get

COPY . .

RUN flutter clean && \
    flutter build web --profile --source-maps --dart-define=USER_DATA_API_BASE_PATH=$USER_DATA_API_BASE_PATH \
--dart-define=PLANTS_DB_API_BASE_PATH=$PLANTS_DB_API_BASE_PATH \
--dart-define=DEVICE_GRPC_HOST=$DEVICE_GRPC_HOST \
--dart-define=DEVICE_GRPC_PORT=$DEVICE_GRPC_PORT

FROM nginx:1.27.3-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
