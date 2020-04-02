FROM nginx:1.17-alpine

ENV NGINX_ROOT /var/www/html/public
## Hostname: php-fpm (docker service name)
ENV NGINX_FASTCGI_HOSTNAME php-fpm
ENV NGINX_FASTCGI_PORT 9000

COPY config/nginx.conf /etc/nginx/
COPY config/default.template.conf /etc/nginx/conf.d/default.template
#COPY sites-available/ /etc/nginx/sites-available/

## Initialize container
COPY config/entrypoint.sh /usr/local/bin/
RUN chmod u+x /usr/local/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]

WORKDIR /var/www

EXPOSE 80 443

#CMD ["nginx", "-g", "daemon off;"]
CMD ["nginx"]
