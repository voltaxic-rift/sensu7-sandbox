#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

dnf install -y epel-release
dnf install -y nginx

cd ~/
\cp -f /vagrant/vendor/sensu-go-webui-${SENSU_GO_WEBUI_COMMIT_HASH}.tgz ~/
tar zxvf ~/sensu-go-webui-${SENSU_GO_WEBUI_COMMIT_HASH}.tgz

cat << 'EOS' > /etc/nginx/conf.d/sensu.conf
server {
    listen       3000;
    server_name  sensu-web-ui;

    location / {
        root   /usr/share/nginx/html;
        index  index.html index.htm;
        try_files $uri /index.html;
    }

    location ~ ^/(auth|graphql|api) {
        proxy_pass http://localhost:8080;
        proxy_set_header Host               $host;
        proxy_set_header X-Real-IP          $remote_addr;
        proxy_set_header X-Forwarded-Host   $host;
        proxy_set_header X-Forwarded-Server $host;
        proxy_set_header X-Forwarded-For    $proxy_add_x_forwarded_for;
    }
}
EOS

\cp -rf ~/package/build/app/* /usr/share/nginx/html/

setenforce 0
systemctl restart nginx
