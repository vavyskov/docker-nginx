# docker-nginx

## Requirements
- `php-fpm` container

## Environment variables
- `NGINX_ROOT /var/www/html/public`
- `NGINX_FASTCGI_HOSTNAME php-fpm`
- `NGINX_FASTCGI_PORT 9000`