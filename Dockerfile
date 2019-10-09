#
#--------------------------------------------------------------------------
# Official PHP Image
#--------------------------------------------------------------------------
#
FROM php:7.3-cli-alpine3.10

#
# Author
#
LABEL maintainer="Gilberto Junior <olamundo@gmail.com>"

#
#--------------------------------------------------------------------------
# CUSTOMIZATION
#--------------------------------------------------------------------------
#
ENV COMPOSER_ALLOW_SUPERUSER=1

RUN set -ex \
    && apk --no-cache add --virtual .build-deps $PHPIZE_DEPS \
    && pecl install \
        xdebug \
    && docker-php-ext-enable \
        xdebug \
    && { find /usr/local/lib -type f -print0 | xargs -0r strip --strip-all -p 2>/dev/null || true; } \
    && apk del .build-deps \
    && curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/bin --filename=composer  \
    && composer global require hirak/prestissimo \
    && composer global require psy/psysh:@stable \
    && rm -rf /var/cache/apk/* /tmp/* /usr/share/man /usr/local/lib/php/doc/*

CMD [ "/root/.composer/vendor/bin/psysh" ]
