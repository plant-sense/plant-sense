FROM ghcr.io/cirruslabs/flutter:3.27.3 AS builder

ARG USER_DATA_API_BASE_PATH
ARG PLANTS_DB_API_BASE_PATH
ARG DEVICE_GRPC_HOST
ARG DEVICE_GRPC_PORT

COPY . ./app
WORKDIR /app

RUN flutter clean
RUN flutter pub get
RUN flutter build web --dart-define=USER_DATA_API_BASE_PATH=$USER_DATA_API_BASE_PATH \
--dart-define=PLANTS_DB_API_BASE_PATH=$PLANTS_DB_API_BASE_PATH \
--dart-define=DEVICE_GRPC_HOST=$DEVICE_GRPC_HOST \
--dart-define=DEVICE_GRPC_PORT=$DEVICE_GRPC_PORT

FROM nginx:1.27.3-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
