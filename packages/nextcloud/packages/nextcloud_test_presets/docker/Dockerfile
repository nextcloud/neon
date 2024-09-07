ARG SERVER_VERSION
FROM nextcloud:${SERVER_VERSION} AS nextcloud

WORKDIR /usr/src/nextcloud

ADD pre.sh /tmp
RUN /tmp/pre.sh

RUN (sh /entrypoint.sh php -S 0.0.0.0:80 &) && \
    until curl -s -o /dev/null http://localhost/status.php; do true; done && \
    for user in admin user1 user2; do curl -u "$user:$user" -H "ocs-apirequest: true" -s -o /dev/null http://localhost/ocs/v2.php/cloud/user; done

COPY static /usr/src/nextcloud/static
COPY assets/Recipes /usr/src/nextcloud/data/admin/files/Recipes
COPY assets/Recipes /usr/src/nextcloud/data/user1/files/Recipes
COPY assets/Recipes /usr/src/nextcloud/data/user2/files/Recipes

RUN ./occ files:scan --all

ENV PHP_CLI_SERVER_WORKERS=10
CMD ["php", "-S", "0.0.0.0:80"]

FROM alpine:latest@sha256:beefdbd8a1da6d2915566fde36db9db0b524eb737fc57cd1367effd16dc0d06d AS apps
RUN apk add curl


FROM apps AS cookbook
ARG COOKBOOK_URL
RUN curl -L "$COOKBOOK_URL" | tar -xz -C /

FROM apps AS news
ARG NEWS_URL
RUN curl -L "$NEWS_URL" | tar -xz -C /

FROM apps AS notes
ARG NOTES_URL
RUN curl -L "$NOTES_URL" | tar -xz -C /

FROM apps AS uppush
ARG UPPUSH_URL
RUN curl -L "$UPPUSH_URL" | tar -xz -C /

FROM apps AS spreed
ARG SPREED_URL
RUN curl -L "$SPREED_URL" | tar -xz -C /

FROM apps AS tables
ARG TABLES_URL
RUN curl -L "$TABLES_URL" | tar -xz -C /

FROM apps AS drop_account
ARG DROP_ACCOUNT_URL
RUN curl -L "$DROP_ACCOUNT_URL" | tar -xz -C /

FROM nextcloud

COPY --from=cookbook /cookbook /usr/src/nextcloud/apps/cookbook
COPY --from=news /news /usr/src/nextcloud/apps/news
COPY --from=notes /notes /usr/src/nextcloud/apps/notes
COPY --from=uppush /uppush /usr/src/nextcloud/apps/uppush
COPY --from=spreed /spreed /usr/src/nextcloud/apps/spreed
COPY --from=tables /tables /usr/src/nextcloud/apps/tables
COPY --from=drop_account /drop_account /usr/src/nextcloud/apps/drop_account

ADD post.sh /tmp
RUN /tmp/post.sh
