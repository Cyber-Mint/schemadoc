FROM openjdk:11

RUN mkdir /home/drivers
RUN mkdir /home/src

RUN apt update -y
RUN apt update -y
RUN apt install curl -y
RUN curl -L https://jdbc.postgresql.org/download/postgresql-42.5.4.jar \
    --output /home/drivers/jdbc-driver.jar
RUN curl -L https://github.com/schemaspy/schemaspy/releases/download/v6.1.0/schemaspy-6.1.0.jar \
    --output /home/src/schemaspy.jar
