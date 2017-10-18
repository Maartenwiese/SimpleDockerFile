FROM gliderlabs/alpine
MAINTAINER  maarten Wiese <maarten.wiese@microsoft.com>

# Install nginx, make it work with docker, and get it ready to run
RUN apk-install nginx && echo "daemon off;" >> /etc/nginx/nginx.conf \
 && mkdir -p /tmp/nginx/client-body

# Bring in the html and azure image
COPY html /usr/html
COPY start_nginx.sh /

# Expose port 80
EXPOSE 80

# Run nginx
CMD /start_nginx.sh
