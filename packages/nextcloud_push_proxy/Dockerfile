FROM dart:stable as builder

WORKDIR /app

ADD pubspec.yaml .
RUN dart pub get


ADD lib ./lib
ADD bin ./bin
RUN dart compile exe bin/unified_push.dart -o bin/nextcloud-push-proxy

FROM debian:bullseye-slim

COPY --from=builder /app/bin/nextcloud-push-proxy /usr/local/bin/

CMD ["nextcloud-push-proxy", "/data/devices.json"]
