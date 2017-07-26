#!/bin/zsh

set -e

# Configure PostgreSQL.
echo 'local all all trust' > '/etc/postgresql/9.5/main/pg_hba.conf'
export PGUSER=postgres

/etc/init.d/elasticsearch start
/etc/init.d/postgresql start
/etc/init.d/redis-server start

exec "$@"
