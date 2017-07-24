#!/bin/zsh

/etc/init.d/cron start
/etc/init.d/elasticsearch start
/etc/init.d/postgresql start
/etc/init.d/redis-server start

exec "${@:-sleep infinity}"
