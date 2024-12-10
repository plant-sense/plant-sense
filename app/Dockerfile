FROM ghcr.io/cirruslabs/flutter:3.24.4 AS builder
COPY . ./app
WORKDIR /app
RUN flutter clean
RUN flutter pub get
RUN flutter build web

FROM nginx:1.27.3-alpine
COPY --from=builder /app/build/web /usr/share/nginx/html
EXPOSE 80
