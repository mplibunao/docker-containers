ARG POSTGRES_VERSION=13.2
FROM "postgis/postgis:${POSTGRES_VERSION}"

# Custom initialization scripts
COPY ./create_db.sh /docker-entrypoint-initdb.d/create_db.sh

RUN chmod +x /docker-entrypoint-initdb.d/create_db.sh
