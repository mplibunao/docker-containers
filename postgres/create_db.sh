#!/bin/bash
set -e

POSTGRES="psql --username ${POSTGRES_USER}"

echo "Creating database: ${POSTGRES_DB}"

$POSTGRES <<EOSQL
CREATE DATABASE ${POSTGRES_DB} OWNER ${POSTGRES_USER};
EOSQL

if [ ${POPULATE_SCHEMA} -eq 1 ]; then
    echo "Creating schema..."
    psql -d ${POSTGRES_DB} -a -U${POSTGRES_USER} -f /schema.sql
fi

if [ ${POPULATE_DB} -eq 1 ]; then
    echo "Populating database..."
    psql -d ${POSTGRES_DB} -a  -U${POSTGRES_USER} -f /test_data.sql
fi
