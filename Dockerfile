FROM nginx:stable-alpine
COPY ./index.html /usr/share/nginx/html/old-index.html


# The container will listen on port 80 using the TCP protocol.
EXPOSE 80
