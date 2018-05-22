#!/bin/bash
if [ "$(pwd)" != '/srv/salt' ]; then
  echo "You must run this command from /srv/salt. Please move this directory to /srv/salt: mv $(pwd) /srv/salt && cd /srv/salt"
  exit 1;
fi
curl --silent --location https://bootstrap.saltstack.com | sudo bash -
cp -f files/etc/salt/minion /etc/salt/minion
