#!/bin/bash

# Try to create the database with the correct credentials
psql -h localhost -U lc -c "CREATE DATABASE db" -W << EOF
password
EOF

# Generate the configuration file with matching credentials
PG_DATABASE="db" \
PG_HOST="localhost" \
PG_USER="lc" \
PG_PASSWORD="password" \
PG_PORT=5432 \
THEME_STANDALONE="true" \
SECRET_KEY="privateSecretKey" \
MAIL_SERVICE="maildev" \
MAIL_HOST="localhost" \
MAIL_USER="node" \
MAIL_PORT=1025 \
sh ./scripts/create-config.sh
