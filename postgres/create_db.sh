#!/bin/bash

set -e

echo "Running init scripts"
POSTGRES="psql --username ${POSTGRES_USER}"

function create_user_and_database() {
	local database=$1
	echo "  Creating user and database '$database'"

$POSTGRES <<EOSQL
CREATE DATABASE ${database} OWNER ${POSTGRES_USER};
EOSQL
}

if [ -n "$POSTGRES_MULTIPLE_DATABASES" ]; then
	echo "Multiple database creation requested: $POSTGRES_MULTIPLE_DATABASES"
	for db in $(echo $POSTGRES_MULTIPLE_DATABASES | tr ',' ' '); do
		create_user_and_database $db
	done
	echo "Multiple databases created"
fi
