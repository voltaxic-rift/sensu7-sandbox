#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

dnf install -y /vagrant/vendor/sensu-go-agent-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm

cat << EOS > /etc/sensu/agent.yml
backend-url:
  - "ws://192.168.57.200:8081"
log-level: warn # available log levels: panic, fatal, error, warn, info, debug
EOS

systemctl enable --now sensu-agent.service
