#!/bin/bash

# This script is used to start the application

# Install envsubst
echo "Installing envsubst"
envsubst '${PROJECT_VERSION} ${ENV} ${APP_CONFIG}' < /etc/nginx/nginx.conf.template > /etc/nginx/nginx.conf

# Start nginx
echo "Starting nginx"
nginx -g 'daemon off'