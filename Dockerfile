#+++++++++++++++++++++++++++++++++++++++
# Dockerfile for webdevops/php-nginx:alpine-php7
#    -- automatically generated  --
#+++++++++++++++++++++++++++++++++++++++

FROM registry.cmer.fr/le-monde-des-reptiles/bootstrap/php7-alpine

ENV WEB_DOCUMENT_ROOT=/app \
    WEB_DOCUMENT_INDEX=index.php \
    WEB_ALIAS_DOMAIN=*.vm \
    WEB_PHP_TIMEOUT=600 \
    WEB_PHP_SOCKET=""
ENV WEB_PHP_SOCKET=127.0.0.1:9000

COPY conf/ /opt/docker/


RUN set -x \
    # Install nginx
    && apk-install \
        nginx \
    && docker-run-bootstrap \
    && docker-image-cleanup

COPY index.html /app

EXPOSE 80 443