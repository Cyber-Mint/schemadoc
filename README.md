# schemadoc
An example of how to generate useful schema documentation 


> Todo: add info about network_mode: host

### Quickstart
```sh
$ cd quickstart/
$ docker-compose up
```

### Using schema only to inspect db
```sh
$ pg_dump -h ${DB_DB_HOST} -p ${DB_PORT} --dbname=${DB_NAME} -U ${DB_USER} --schema-only > schema_dump.sql
$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'DROP DATABASE IF EXISTS <your-database-name>;'"
$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'CREATE DATABASE <your-database-name>;'"
$ PGPASSWORD=${DB_PASSWORD} psql --dbname=${DB_NAME} -p ${DB_PORT} -U ${DB_USER} -h ${DB_HOST} < schema_dump.sql
```
