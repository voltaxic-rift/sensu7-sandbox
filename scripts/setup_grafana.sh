#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

/opt/yugabytedb/bin/ysqlsh -c 'create database grafana;' || true

dnf install -y /vagrant/vendor/grafana-${GRAFANA_VERSION}-1.x86_64.rpm
\cp -f /vagrant/configurations/grafana/grafana.ini /etc/grafana/grafana.ini
\cp -rf /vagrant/configurations/grafana/provisioning /etc/grafana/
systemctl restart grafana-server
