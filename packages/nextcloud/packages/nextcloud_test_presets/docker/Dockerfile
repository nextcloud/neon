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

FROM alpine:latest@sha256:56fa17d2a7e7f168a043a2712e63aed1f8543aeafdcee47c58dcffe38ed51099 AS apps

FROM apps AS cookbook
ARG COOKBOOK_URL
ARG COOKBOOK_CHECKSUM
ADD --checksum=$COOKBOOK_CHECKSUM $COOKBOOK_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS news
ARG NEWS_URL
ARG NEWS_CHECKSUM
ADD --checksum=$NEWS_CHECKSUM $NEWS_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS notes
ARG NOTES_URL
ARG NOTES_CHECKSUM
ADD --checksum=$NOTES_CHECKSUM $NOTES_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS uppush
ARG UPPUSH_URL
ARG UPPUSH_CHECKSUM
ADD --checksum=$UPPUSH_CHECKSUM $UPPUSH_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS spreed
ARG SPREED_URL
ARG SPREED_CHECKSUM
ADD --checksum=$SPREED_CHECKSUM $SPREED_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS tables
ARG TABLES_URL
ARG TABLES_CHECKSUM
ADD --checksum=$TABLES_CHECKSUM $TABLES_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

FROM apps AS drop_account
ARG DROP_ACCOUNT_URL
ARG DROP_ACCOUNT_CHECKSUM
ADD --checksum=$DROP_ACCOUNT_CHECKSUM $DROP_ACCOUNT_URL /tmp/app.tar.gz
RUN tar -xzf /tmp/app.tar.gz -C /

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
