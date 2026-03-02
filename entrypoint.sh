#!/bin/sh
set -e

if [ -z "$API_HOST" ]; then
    echo "ERROR: API_HOST environment variable is not set." >&2
    exit 1
fi

# Strip any trailing slash to avoid double slashes in proxy_pass
API_HOST="${API_HOST%/}"

envsubst '$API_HOST' < /etc/nginx/templates/default.conf.template > /etc/nginx/conf.d/default.conf

exec nginx -g "daemon off;"
