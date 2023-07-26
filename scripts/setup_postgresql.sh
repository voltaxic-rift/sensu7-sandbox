#!/bin/bash

set -eux
export $(cat /vagrant/.env | grep -v ^#)

cat << EOS > /etc/yum.repos.d/postgresql.repo
[postgres]
name=postgres
baseurl=https://download.postgresql.org/pub/repos/yum/${POSTGRES_VERSION}/redhat/rhel-8-x86_64
enabled=1
gpgcheck=0
EOS

dnf makecache
