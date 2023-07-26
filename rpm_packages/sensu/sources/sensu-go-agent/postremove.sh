#!/usr/bin/env bash

bin_path="/usr/sbin/sensu-agent"
logdir="/var/log/sensu/sensu-agent"
datadir="/var/lib/sensu/sensu-agent"
cachedir="/var/cache/sensu/sensu-agent"
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
