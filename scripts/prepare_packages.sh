#!/bin/bash

set -eux

export $(cat /vagrant/.env | grep -v ^#)

# nfpm install
curl -fSL https://github.com/goreleaser/nfpm/releases/download/v${NFPM_VERSION}/nfpm_${NFPM_VERSION}_Linux_x86_64.tar.gz | tar -zx -C /usr/bin nfpm
dnf install -y epel-release
dnf install -y make golang

\cp -rf /vagrant/rpm_packages/ ~/

# build sensu rpm
pushd ~/rpm_packages/sensu
    make rpm
    \cp -f build/sensu-go-agent-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm /vagrant/vendor/
    \cp -f build/sensu-go-backend-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm /vagrant/vendor/
    \cp -f build/sensu-go-cli-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm /vagrant/vendor/
    \cp -f build/sensu-go-loadit-${SENSU_GO_REVISION}-${SENSU_GO_RPM_REVISION}.x86_64.rpm /vagrant/vendor/
popd

pushd /vagrant/vendor
    # download mimir rpm
    if [ ! -e "mimir-${MIMIR_VERSION}/mimir-${MIMIR_VERSION}_amd64.rpm" ]; then
        curl -LO https://github.com/grafana/mimir/releases/download/mimir-${MIMIR_VERSION}/mimir-${MIMIR_VERSION}_amd64.rpm
    fi
    # download grafana rpm
    if [ ! -e "grafana-${GRAFANA_VERSION}-1.x86_64.rpm" ]; then
        curl -LO https://dl.grafana.com/oss/release/grafana-${GRAFANA_VERSION}-1.x86_64.rpm
    fi
    # download minio rpm
    if [ ! -e "minio-${MINIO_VERSION}.x86_64.rpm" ]; then
        curl -LO https://dl.min.io/server/minio/release/linux-amd64/archive/minio-${MINIO_VERSION}.x86_64.rpm
    fi
    # download sensu go web ui package
    if [ ! -e "sensu-go-webui-${SENSU_GO_WEBUI_COMMIT_HASH}.tgz" ]; then
        curl -L -o "sensu-go-webui-${SENSU_GO_WEBUI_COMMIT_HASH}.tgz" https://sensu-ci-web-builds.s3.amazonaws.com/oss/webapp/${SENSU_GO_WEBUI_COMMIT_HASH}/dashboard.tgz
    fi
    # download jsonnet
    if [ ! -e "go-jsonnet_${JSONNET_VERSION}_Linux_x86_64.tar.gz" ]; then
        curl -LO https://github.com/google/go-jsonnet/releases/download/v${JSONNET_VERSION}/go-jsonnet_${JSONNET_VERSION}_Linux_x86_64.tar.gz
    fi
popd
