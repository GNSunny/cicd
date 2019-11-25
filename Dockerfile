FROM alpine:latest

RUN apk update \
     && apk add nginx \
     && adduser -D -g 'web' web \
     && mkdir -p /var/www \
     && chown -R web:web /var/lib/nginx \
     && chown -R web:web /var/www 

RUN rm -rf /etc/nginx/nginx.conf \
    && rm -rf /var/www/index.html

COPY nginx.conf /etc/nginx/nginx.conf 
COPY index.html /var/www/index.html


EXPOSE 80

#STOPSIGNAL SIGTERM

CMD ["nginx", "-g", "daemon off;"]
