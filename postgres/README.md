## Building and running

- Run `docker-compose up` to build and run the container
- Env variables can be found on the `docker-compose.yml`
- When changing env variables, don't forget to rebuild the image by running `docker-compose build`

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

