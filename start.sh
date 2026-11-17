#!/bin/sh
set -e
chown openbot:openbot /data
exec setpriv --reuid=1000 --regid=1000 --init-groups env HOME=/data /opt/OpenBot/app/resources/hosting/openbot-container "$@"
