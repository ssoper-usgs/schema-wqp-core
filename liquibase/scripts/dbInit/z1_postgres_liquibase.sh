#!/bin/bash

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${DATABASE_ADDRESS}:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DDATABASE_NAME=${DATABASE_NAME} \
	-DdataOwner=${WQP_DB_DATA_OWNER_USERNAME} \
	-DDATA_OWNER_PASSWORD=${WQP_DB_DATA_OWNER_PASSWORD} \
	-DschemaName=${SCHEMA_NAME} \
	-DreadOnlyUser=${WQP_DB_READ_ONLY_USERNAME} \
	-DREAD_ONLY_USER_PASSWORD=${WQP_DB_READ_ONLY_PASSWORD}

# postgres to wqp db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${DATABASE_ADDRESS}:5432/${DATABASE_NAME} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DdataOwner=${WQP_DB_DATA_OWNER_USERNAME} \
	-DschemaName=${SCHEMA_NAME}
