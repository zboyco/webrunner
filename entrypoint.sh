#!/bin/sh

# This script is used to start the application

# Install envsubst
echo "Installing envsubst"
envsubst '${PROJECT_VERSION} ${ENV} ${APP_CONFIG}' < /etc/nginx/conf.d/web.conf.template > /etc/nginx/conf.d/web.conf

# Start nginx
echo "Starting nginx"
echo "daemon off;" >> /etc/nginx/nginx.conf
nginx