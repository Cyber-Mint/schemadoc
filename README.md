# schemadoc
An example of how to generate useful schema documentation 

### Quickstart

#### Create a Postgresql DB using docker 
```sh
$ docker run --name db -e POSTGRES_DB=teamfu -e POSTGRES_PASSWORD=password -e POSTGRES_USER:postgres -e POSTGRES_PORT=5432 --network=host -d postgres:13-alpine
```

The following may also be useful in preparing your database.
```sh
$ docker exec -it <container-name> /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'DROP DATABASE IF EXISTS <database-name>;'"
$ docker exec -it <container-name> /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'CREATE DATABASE <database-name>;'"
```
#### Add enviroment variables if needed
```sh
$ export DB_PASSWORD=password
$ export DB_NAME=<database-name>
$ export DB_HOST=127.0.0.1
$ export DB_PORT=5432
$ export DB_USER=postgres
```

#### Add tables based on teamfu schema_dump.sql
You can obtain the schema you want to create documentation for by using the following command on your actual working database -->
```sh
$ pg_dump -h ${DB_DB_HOST} -p ${DB_PORT} --dbname=${DB_NAME} -U ${DB_USER} --schema-only > schema_dump.sql
```

#### Import your schemadoc from schema_dump.sql
```sh
$ PGPASSWORD=${POSTGRES_PASSWORD} psql --dbname=${DB_NAME} -p ${DB_PORT} -U ${DB_USER} -h ${DB_HOST} < schema_dump.sql
```

#### Use Docker Compose to run Schemadoc using the Docker container you created
```sh
$ cd quickstart/
$ docker-compose up
```
#### Change ownership of the Schemadoc outputs folder (run from project root dir)
```sh
$ sudo chown -R $USER:$USER  outputs
```

#### Access the Schemadoc
```
Open the Index.html file in the newly generated 'outputs' folder
```

### Using schema only to inspect db (unnecessary to Schemadoc Generatation)
```sh
$ pg_dump -h ${DB_DB_HOST} -p ${DB_PORT} --dbname=${DB_NAME} -U ${DB_USER} --schema-only > schema_dump.sql

$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'DROP DATABASE IF EXISTS <database-name>;'"

$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'CREATE DATABASE <database-name>;'"

$ PGPASSWORD=${POSTGRES_PASSWORD} psql --dbname=${DB_NAME} -p ${DB_PORT} -U ${DB_USER} -h ${DB_HOST} < schema_dump.sql
```
