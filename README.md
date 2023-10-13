# schemadoc
An example of how to generate useful schema documentation 

> Todo: add info about network_mode: host

### Quickstart

#### Create a Postgresql DB using docker 
```sh
$ docker run --name <Your-Container-Name> -e POSTGRES_PASSWORD=password --network=host -d postgres:13-alpine
$ docker exec -it <Your-Container-Name> /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'DROP DATABASE IF EXISTS <your-database-name>;'"
$ docker exec -it <Your-Container-Name> /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'CREATE DATABASE <your-database-name>;'"
```
#### Add enviroment variables
```sh
$ export DB_PASSWORD=password
$ export DB_NAME=<your-database-name>
$ export DB_HOST=127.0.0.1
$ export DB_PORT=5432
$ export DB_USER=postgres
```

#### Add tables based on teamfu schema_dump.sql (Obtain schema_dump file from candidates discord channel)
```sh
$ PGPASSWORD=${POSTGRES_PASSWORD} psql --dbname=${DB_NAME} -p ${DB_PORT} -U ${DB_USER} -h ${DB_HOST} < schema_dump.sql
```

#### Use Docker Compose to run Schemadoc using the Docker container you created
```sh
$ cd quickstart/
$ docker-compose up
```
#### Change ownership of the Schemadoc output folder (run from project root dir)
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
$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'DROP DATABASE IF EXISTS <your-database-name>;'"
$ docker exec -it postgresql /bin/sh -c "psql -h 127.0.0.1 -U postgres -p 5432 -d postgres -W -c 'CREATE DATABASE <your-database-name>;'"
$ PGPASSWORD=${POSTGRES_PASSWORD} psql --dbname=${DB_NAME} -p ${DB_PORT} -U ${DB_USER} -h ${DB_HOST} < schema_dump.sql
```
