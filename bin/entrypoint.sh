#!/bin/zsh

set -e

/etc/init.d/elasticsearch start
/etc/init.d/postgresql start
/etc/init.d/redis-server start

exec "${@:-sleep infinity}"
