## Building and running

- Run `docker-compose up` to build and run the container
- Env variables can be found on the `docker-compose.yml`
- When changing env variables, don't forget to rebuild the image by running `docker-compose build`

## Populating with data

- You can populate the database with data by using the scripts included
- Use `POPULATE_SCHEMA` var to set whether to create schema
- Use `POPULATE_DB` var to set whether db is populated with data or not
- When repopulating the db, delete the docker volume first for things to take effect

```
docker-compose rm # doesn't seem to work

# This works
docker volume ls
docker volume rm <name-of-volume>
```


## References

- [towardsdatascience tricks for postgres and docker that will make your life easier gi](https://towardsdatascience.com/tricks-for-postgres-and-docker-that-will-make-your-life-easier-fc7bfcba5082?gi=c14b4f59d7b7)
- [github MartinHeinz blog backend tree master postgres](https://github.com/MartinHeinz/blog-backend/tree/master/postgres)
