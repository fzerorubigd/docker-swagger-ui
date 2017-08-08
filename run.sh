#!/bin/sh

if [ $URL != "**None**" ]; then
  SAFE_URL=${URL//\//\\\/}
  sed -i "s/http:\/\/petstore.swagger.io\/v2\/swagger.json/${SAFE_URL}/g" /usr/share/nginx/html/index.html
fi

exec nginx -g 'daemon off;'
