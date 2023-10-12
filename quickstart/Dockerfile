FROM openjdk:11

RUN mkdir /home/drivers
RUN mkdir /home/src

RUN apt-get update -y
RUN apt-get upgrade -y
RUN apt-get install -y curl graphviz unzip

ENV MYSQL_VERSION=8.0.28
ENV MARIADB_VERSION=1.1.10
ENV POSTGRESQL_VERSION=42.3.8

# JDBC driver for Microsoft sql server
ENV JTDS_VERSION=1.3.1

LABEL MYSQL_VERSION=$MYSQL_VERSION
LABEL MARIADB_VERSION=$MARIADB_VERSION
LABEL POSTGRESQL_VERSION=$POSTGRESQL_VERSION
LABEL JTDS_VERSION=$JTDS_VERSION

RUN set -x && \
    apt-get install curl unzip graphviz fontconfig && \
    fc-cache -fv
RUN cd /home/drivers && \
    curl -JLO https://search.maven.org/remotecontent?filepath=mysql/mysql-connector-java/$MYSQL_VERSION/mysql-connector-java-$MYSQL_VERSION.jar && \
    curl -JLO https://search.maven.org/remotecontent?filepath=org/mariadb/jdbc/mariadb-java-client/$MARIADB_VERSION/mariadb-java-client-$MARIADB_VERSION.jar && \
    curl -JLO https://search.maven.org/remotecontent?filepath=org/postgresql/postgresql/$POSTGRESQL_VERSION/postgresql-$POSTGRESQL_VERSION.jar && \
    curl -JLO https://search.maven.org/remotecontent?filepath=net/sourceforge/jtds/jtds/$JTDS_VERSION/jtds-$JTDS_VERSION.jar && \
    mkdir /output
 
RUN curl -L https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar \
    --output /home/src/schemaspy.jar

EXPOSE 80
ENTRYPOINT [ "generate.sh" ]
