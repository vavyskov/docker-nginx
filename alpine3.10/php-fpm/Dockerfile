ARG TIMEZONE=Europe/Prague

FROM nginx:1.17-alpine

ENV ACCESS_LOG=${UNSET}
ENV ERROR_LOG=${UNSET}
ENV PROJECT_HOSTNAME project.example.com
ENV NGINX_ROOT /var/www/html/public
ENV FASTCGI_HOSTNAME php-fpm
ENV FASTCGI_PORT 9001
ENV CERTIFICATE_PATH /etc/ssl/path
ENV CERTIFICATE_FILENAME project-example-com.crt
ENV CERTIFICATE_KEYNAME project-example-com.key

RUN echo "Setting the timezone..." \
&&  apk add --no-cache --virtual .build-deps \
        tzdata \
&&  cp /usr/share/zoneinfo/${TIMEZONE} /etc/localtime \
&&  apk del --purge .build-deps

COPY config/nginx.conf /etc/nginx/
COPY config/default.template.conf /etc/nginx/conf.d/default.template
#COPY sites-available/ /etc/nginx/sites-available/
COPY config/project-example-com.crt /etc/ssl/path/
COPY config/project-example-com.key /etc/ssl/path/

## Initialize container
COPY config/entrypoint.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

WORKDIR /var/www

EXPOSE 80 443

#CMD ["nginx", "-g", "daemon off;"]
CMD ["nginx"]
