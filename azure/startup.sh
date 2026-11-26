#!/bin/bash
cp /home/site/wwwroot/azure/default /etc/nginx/sites-available/default
service nginx reload

if [ -d /usr/local/etc/php/conf.d ]; then
  echo "pdo_sqlsrv.client_buffer_max_kb_size = 24480" > /usr/local/etc/php/conf.d/99-pdo_sqlsrv.ini
  pkill -USR2 -f php-fpm || true
fi
