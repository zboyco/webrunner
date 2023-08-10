#!/bin/sh

# This script is used to start the application

# 初始化一个字符串，用于存储拼接后的值
app_config="${APP_CONFIG}"

# 遍历所有环境变量
for var in $(env | cut -d= -f1); do
    # 检查变量是否以 "APP_CONFIG__" 开头
    if [ "$(echo "$var" | grep '^APP_CONFIG__')" ]; then
        # 去除变量名前缀 "APP_CONFIG__"
        trimmed_var=$(echo "$var" | sed 's/^APP_CONFIG__//')
        # 使用 eval 来获取变量值并拼接到字符串中
        value=$(eval echo "\$$var")
        app_config="${app_config},${trimmed_var}=${value}"
    fi
done

# 去掉起始的逗号
export app_config=$(echo "$app_config" | sed 's/^,//')


# Install envsubst
echo "Installing envsubst"
envsubst '${PROJECT_VERSION} ${ENV} ${app_config}' < /etc/nginx/conf.d/conf.template > /etc/nginx/conf.d/default.conf

# Start nginx
echo "Starting nginx"
nginx -g 'daemon off;'