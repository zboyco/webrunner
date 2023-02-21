FROM nginx:alpine-slim

# Import environment variables
ENV PROJECT_VERSION=v0.0.0
ENV ENV=prod
ENV APP_CONFIG=""

# Copy nginx config
COPY conf.template /etc/nginx/conf.d/conf.template
# Copy entrypoint
COPY entrypoint.sh /entrypoint.sh
# execute entrypoint
CMD ["/entrypoint.sh"]