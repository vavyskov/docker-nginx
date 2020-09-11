#!/bin/sh
## Exit script if any command fails (non-zero status)
set -e

## https://github.com/docker-library/docs/tree/master/nginx#using-environment-variables-in-nginx-configuration
envsubst '
    ${ACCESS_LOG}
    ${ERROR_LOG}
    ${PROJECT_HOSTNAME}
    ${NGINX_ROOT}
    ${FASTCGI_HOSTNAME}
    ${FASTCGI_PORT}
    ${CERTIFICATE_PATH}
    ${CERTIFICATE_FILENAME}
    ${CERTIFICATE_KEYNAME}
' < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf

## TimeZone (default is Europe/Prague)
if [ "${TIME_ZONE}" = "UTC" ]; then
    rm /etc/localtime
fi

## Make the entrypoint a pass through that then runs the docker command (redirect all input arguments)
exec "$@"