#!/usr/bin/env bash

bin_path="/usr/sbin/sensu-backend"
logdir="/var/log/sensu/sensu-backend"
datadir="/var/lib/sensu/sensu-backend"
cachedir="/var/cache/sensu/sensu-backend"
if [ -e "${bin_path}" ]; then
    rm -f "${bin_path}"
fi
if [ -e "${logdir}" ]; then
    rm -rf "${logdir}"
fi
if [ -e "${datadir}" ]; then
    rm -rf "${datadir}"
fi
if [ -e "${cachedir}" ]; then
    rm -rf "${cachedir}"
fi
