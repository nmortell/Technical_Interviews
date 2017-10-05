FROM sourceallies/php-node-docker

RUN mkdir -p /var/log/supervisor /var/run/php

RUN useradd -u 1001 -G www-data -m sai-interview

COPY src /var/www/laravel-interview
WORKDIR /var/www/laravel-interview

RUN touch /var/www/laravel-interview/storage/logs/laravel.log
RUN chmod 664 /var/www/laravel-interview/storage/logs/laravel.log
RUN chown -R sai-interview:www-data /var/www/laravel-interview

COPY conf/nginx/laravel-interview.conf /etc/nginx/conf.d/laravel-interview.conf

COPY conf/supervisord/supervisord.conf /etc/supervisor/supervisord.conf

EXPOSE 80
EXPOSE 443

USER root

# FIXME: Move this line to the base php-node-docker image.
# This setting allows server env (from docker-compose or cloudformation)
# to be available via dotEnv (and $_SERVER) in php-fpm.
RUN sed -e 's/;clear_env = no/clear_env = no/' -i /etc/php/7.1/fpm/pool.d/www.conf

ENTRYPOINT "/usr/bin/supervisord"
