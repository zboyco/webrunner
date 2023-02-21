#!/bin/sh

# This script is used to start the application

# Install envsubst
echo "Installing envsubst"
envsubst '${PROJECT_VERSION} ${ENV} ${APP_CONFIG}' < /etc/nginx/conf.d/conf.template > /etc/nginx/conf.d/default.conf

# Start nginx
echo "Starting nginx"
nginx -g 'daemon off;'