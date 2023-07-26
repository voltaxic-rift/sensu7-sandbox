#!/usr/bin/env bash

if [ "$(systemctl is-active sensu-backend)" = "active" ]; then
  systemctl stop sensu-backend
fi

if [ "$(systemctl is-enabled sensu-backend)" = "enabled" ]; then
  systemctl disable sensu-backend
fi

systemctl --system daemon-reload
