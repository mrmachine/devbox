#!/bin/zsh

set -e

# Enable trust authentication for all connections.
cat <<EOF > /etc/postgresql/9.5/main/pg_hba.conf
local all all     trust
host  all all all trust
EOF

/etc/init.d/elasticsearch start
/etc/init.d/postgresql start
/etc/init.d/redis-server start

exec "$@"
