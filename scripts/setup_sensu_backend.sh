#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

dnf install -y /vagrant/vendor/sensu-go-backend-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm
dnf install -y /vagrant/vendor/sensu-go-cli-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm

cat << EOS > /etc/sensu/backend.yml
cache-dir: /var/cache/sensu/sensu-backend
log-level: warn #available log levels: panic, fatal, error, warn, info, debug, trace
disable-platform-metrics: true
pg-dsn: "postgresql://postgres@127.0.0.1:5432/postgres?sslmode=disable"
EOS

systemctl enable --now sensu-backend.service

dnf install -y jq

mkdir -p ~/jsonnet
pushd ~/jsonnet
    tar zxvf /vagrant/vendor/go-jsonnet_${JSONNET_VERSION}_Linux_x86_64.tar.gz
    \cp -f ./jsonnet* /usr/bin/
popd
