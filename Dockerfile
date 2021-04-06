FROM php:8.0.3-fpm-alpine3.13

RUN apk add --no-cache shadow
RUN apk add bash mysql-client
RUN docker-php-ext-install pdo pdo_mysql

WORKDIR /var/www

RUN rm -rf /var/www/html
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer 

RUN chown -R www-data:www-data /var/www
RUN ln -s public html
RUN usermod -u 1000 www-data

USER www-data

EXPOSE 9000

ENTRYPOINT ["php-fpm"]