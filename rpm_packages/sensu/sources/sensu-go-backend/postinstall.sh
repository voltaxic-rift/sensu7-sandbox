#!/usr/bin/env bash

sensu_user="sensu"
user_entry="$(getent passwd ${sensu_user})"
if [ -z "${user_entry}" ]; then
  useradd --system sensu
fi

logdir="/var/log/sensu/sensu-backend"
datadir="/var/lib/sensu/sensu-backend"
cachedir="/var/cache/sensu/sensu-backend"
configdir="/etc/sensu"
if [ ! -e "${logdir}" ]; then
    mkdir -p "${logdir}"
    chown "${sensu_user}:${sensu_user}" "${logdir}"
fi
if [ ! -e "${datadir}" ]; then
    mkdir -p "${datadir}"
    chown "${sensu_user}:${sensu_user}" "${datadir}"
fi
if [ ! -e "${cachedir}" ]; then
    mkdir -p "${cachedir}"
    chown "${sensu_user}:${sensu_user}" "${cachedir}"
fi
if [ ! -e "${configdir}" ]; then
    mkdir -p "${configdir}"
fi

systemctl --system daemon-reload
