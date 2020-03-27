FROM nginx:1.17-alpine

COPY config/nginx.conf /etc/nginx/nginx.conf
COPY config/default.conf /etc/nginx/conf.d/default.conf
#COPY sites-available/ /etc/nginx/sites-available/

WORKDIR /var/www

EXPOSE 80 443

CMD ["nginx"]
