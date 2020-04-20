FROM nginx:1.17-alpine

ENV PROJECT_HOSTNAME project.example.com
ENV NGINX_ROOT /var/www/html/public
ENV NGINX_FASTCGI_HOSTNAME php-fpm
ENV NGINX_FASTCGI_PORT 9000
ENV CERTIFICATE_PATH /etc/ssl/path
ENV CERTIFICATE_FILENAME project-example-com.crt
ENV CERTIFICATE_KEYNAME project-example-com.key

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
