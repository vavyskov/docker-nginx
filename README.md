# docker-nginx

## Requirements
- `php-fpm` container

## Environment variables
- `NGINX_ROOT /var/www/html/public`
- `FASTCGI_HOSTNAME php-fpm`
- `FASTCGI_PORT 9001`

Notes:
- `nginx -t` - test konfigurace
- `nginx -s reload` - aktivace změn
