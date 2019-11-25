FROM nginx:stable-alpine
RUN mv /usr/share/nginx/html/index.html /usr/share/nginx/html/old-index.html
COPY ./index.html /usr/share/nginx/html/


# The container will listen on port 80 using the TCP protocol.
EXPOSE 80
