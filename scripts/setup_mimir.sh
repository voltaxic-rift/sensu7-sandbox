#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

dnf install -y /vagrant/vendor/mimir-${MIMIR_VERSION}_amd64.rpm

mkdir -p /var/log/mimir
mkdir -p /var/lib/mimir
chown mimir:mimir /var/log/mimir
chown mimir:mimir /var/lib/mimir

cat << EOS > /etc/sysconfig/mimir
LOG_LEVEL="info"
CUSTOM_ARGS="-config.file /etc/mimir/config.yaml"
RESTART_ON_UPGRADE="true"
EOS

cat << EOS > /etc/mimir/config.yaml
target: all,alertmanager

multitenancy_enabled: true

server:
  http_listen_port: 9009

distributor:
  ring:
    kvstore:
      store: inmemory

ingester:
  ring:
    kvstore:
      store: inmemory
    replication_factor: 1

blocks_storage:
  backend: filesystem
  filesystem:
    dir: /var/lib/mimir/data/tsdb/
  bucket_store:
    sync_dir: /var/lib/mimir/tsdb-sync/
  tsdb:
    dir: /var/lib/mimir/tsdb/

compactor:
  sharding_ring:
    kvstore:
      store: inmemory
  data_dir: /var/lib/mimir/data-compactor/

store_gateway:
  sharding_ring:
    kvstore:
      store: inmemory
    replication_factor: 1

activity_tracker:
  filepath: /var/log/mimir/metrics-activity.log

ruler:
  ring:
    kvstore:
      store: inmemory
  rule_path: /var/lib/mimir/data-ruler/
  alertmanager_url: http://localhost:9009/alertmanager

ruler_storage:
  backend: filesystem
  filesystem:
    dir: /var/lib/mimir/rules/

alertmanager:
  sharding_ring:
    kvstore:
      store: inmemory
    replication_factor: 1
  data_dir: /var/lib/mimir/data-alertmanager/
  external_url: http://localhost:9009/alertmanager
  fallback_config_file: /etc/mimir/alertmanager-fallback-config.yml

alertmanager_storage:
  backend: filesystem
  filesystem:
    dir: /var/lib/mimir/alertmanager/

limits:
  ruler_max_rules_per_rule_group: 0
  ruler_max_rule_groups_per_tenant: 0
EOS

cat << EOS > /etc/mimir/alertmanager-fallback-config.yml
route:
  group_wait: 0s
  receiver: empty-receiver

receivers:
  # In this example we're not going to send any notification out of Alertmanager.
  - name: 'empty-receiver'
EOS

systemctl restart mimir
