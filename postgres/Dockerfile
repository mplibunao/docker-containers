FROM postgres:13.2

# Custom initialization scripts
COPY ./create_db.sh /docker-entrypoint-initdb.d/create_multiple_db.sh
#COPY ./create_db.sh /docker-entrypoint-initdb.d/create_db.sh
#COPY schema.sql /schema.sql
#COPY test_data.sql /test_data.sql

RUN chmod +x /docker-entrypoint-initdb.d/create_multiple_db.sh
#RUN chmod +x /docker-entrypoint-initdb.d/create_db.sh
