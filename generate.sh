#!/bin/sh
#
# **************************************************************
# Copyright (c) 2020, Cyber-mint (Pty) Ltd
# See LICENSE in the project root for license information.
# **************************************************************
#

# hard coded to postgres
# TODO: make this generic for all db types
java -jar /home/src/schemaspy.jar \
    -t pgsql11 \
    -dp /home/drivers/postgresql-42.3.8.jar \
    -db ${DB_NAME} \
    -host ${DB_HOST:=127.0.0.1} \
    -port ${DB_PORT:=5432} \
    -u ${DB_USER} \
    -p ${DB_PASSWORD} \
    -o /outputs