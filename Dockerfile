FROM nginx:alpine-slim

# Import environment variables
ARG PROJECT_VERSION
ARG ENV
ARG APP_CONFIG

# Copy nginx config
COPY nginx.conf.template /etc/nginx/nginx.conf.template

# execute entrypoint
ENTRYPOINT ["./entrypoin.sh"]