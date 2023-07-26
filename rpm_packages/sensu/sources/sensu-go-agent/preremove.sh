#!/usr/bin/env bash

if [ "$(systemctl is-active sensu-agent)" = "active" ]; then
  systemctl stop sensu-agent
fi

if [ "$(systemctl is-enabled sensu-agent)" = "enabled" ]; then
  systemctl disable sensu-agent
fi

systemctl --system daemon-reload
