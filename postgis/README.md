## About this image

This is a postgis image that builds on top of the [postgis/postgis](https://registry.hub.docker.com/r/postgis/postgis) image.

The only difference with the official image is the addition of an initialization script that allows you to create multiple databases by passing an additional environment variable.

By default, we normally use the `POSTGRES_DB` env variable to set the name of the database.

Using this image you can provide an additional environment variable `POSTGRES_MULTIPLE_DATABASES` to create additional databases. `POSTGRES_MULTIPLE_DATABASES` accepts a comma-separated value of the name of the database

Example:

```yaml
services:
  db:
    image: mplibunao/postgres:13.2
    ports:
      - "5432:5432"
    environment:
      - POSTGRES_USER: postgres
      - POSTGRES_PASSWORD: postgres
      - POSTGRES_DB: api
      - POSTGRES_MULTIPLE_DATABASES: api_dev,api_test
```

Running `docker-compose up` using the `docker-compose.yml` above will create an `api`, `api_dev` and `api_test` database. However `api_dev` and `api_test` will use different users. See [#postgres_multiple_databases](#postgres_multiple_databases)


> **Note:** Similar to the original postgres image, the initialization script only runs when you start the container with an empty data directory

Please see the original image's documentation for more info [registry hub docker r postgis postgis](https://registry.hub.docker.com/r/postgis/postgis)

## Environmental Variables 

### `POSTGRES_MULTIPLE_DATABASES`

To create multiple databases, pass a comma-separated string with the name of the databases to the env variable `POSTGRES_MULTIPLE_DATABASES`

```yaml
environment:
	POSTGRES_PASSWORD: postgres
	POSTGRES_USER: postgres
	POSTGRES_MULTIPLE_DATABASES: dev,test
```

Aside from creating the databases, a user with the same name as the database name will be created for each database. This follows the principle of least privilege to improve security and isolation between databases or environments by not using the `postgres` user for for all databases


In the example above, a user `dev` will be created along with the `dev` database

```bash
psql -h localhost -p 5432 -U dev
```

### `POSTGRES_USER`

This is the same env variable from the official postgres image for creating the specified user with superuser power. Used in conjunction with `POSTGRES_PASSWORD`

### `POSTGRES_PASSWORD`

This is the same env variable from the official postgres image for setting the password for the superuser.

This is also used as the password for users created using `POSTGRES_MULTIPLE_DATABASES`

```bash
export PGPASSWORD=postgres
psql -h localhost -p 5432 -U dev
```

## Building the image yourself

You can see the repo at [github mplibunao docker containers tree master postgres](https://github.com/mplibunao/docker-containers/tree/master/postgres) and build the image yourself 

- Run `docker-compose up` to build and run the container
- Env variables can be found on the `docker-compose.yml`
- When changing env variables, don't forget to rebuild the image by running `docker-compose build`

