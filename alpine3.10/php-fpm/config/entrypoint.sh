#!/bin/sh
## Exit script if any command fails (non-zero status)
set -e

## https://github.com/docker-library/docs/tree/master/nginx#using-environment-variables-in-nginx-configuration
envsubst '
    ${NGINX_ROOT}
    ${NGINX_FASTCGI_HOSTNAME}
    ${NGINX_FASTCGI_PORT}
' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

## Make the entrypoint a pass through that then runs the docker command (redirect all input arguments)
exec "$@"