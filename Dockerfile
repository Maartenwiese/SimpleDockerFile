FROM ubuntu:latest
MAINTAINER  maarten Wiese <maarten.wiese@microsoft.com>

# Install nginx, make it work with docker, and get it ready to run
RUN apt-get update && apt-get upgrade && apt-get install nginx -y && echo "daemon off;" >> /etc/nginx/nginx.conf

# Bring in the html and cloud image
COPY html /var/www/html
COPY start_nginx.sh /

# Expose port 80
EXPOSE 80

# Run nginx
CMD /start_nginx.sh
