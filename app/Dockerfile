FROM ghcr.io/cirruslabs/flutter:3.27.3 AS builder

WORKDIR /app

COPY pubspec.* ./

RUN flutter pub get

COPY . .

ARG USER_DATA_STORE_BASE_PATH
ARG SPECIES_CATALOG_BASE_PATH
ARG MONITORING_AGENT_GRPC_HOST
ARG MONITORING_AGENT_GRPC_PORT

RUN flutter clean && \
    flutter build web --profile --source-maps --dart-define=USER_DATA_STORE_BASE_PATH=$USER_DATA_STORE_BASE_PATH \
--dart-define=SPECIES_CATALOG_BASE_PATH=$SPECIES_CATALOG_BASE_PATH \
--dart-define=MONITORING_AGENT_GRPC_HOST=$MONITORING_AGENT_GRPC_HOST \
--dart-define=MONITORING_AGENT_GRPC_PORT=$MONITORING_AGENT_GRPC_PORT

FROM nginx:1.27.3-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
