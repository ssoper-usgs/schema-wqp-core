#!/bin/bash

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${WQP_DATABASE_ADDRESS}:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	--liquibaseCatalogName=public \
	--liquibaseSchemaName=public \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DWQP_DATABASE_NAME=${WQP_DATABASE_NAME} \
	-DWQP_DB_OWNER_USERNAME=${WQP_DB_OWNER_USERNAME} \
	-DWQP_DB_OWNER_PASSWORD=${WQP_DB_OWNER_PASSWORD} \
	-DWQP_SCHEMA_NAME=${WQP_SCHEMA_NAME} \
	-DWQP_SCHEMA_OWNER_USERNAME=${WQP_SCHEMA_OWNER_USERNAME} \
	-DWQP_SCHEMA_OWNER_PASSWORD=${WQP_SCHEMA_OWNER_PASSWORD} \
	-DWQP_READ_ONLY_USERNAME=${WQP_READ_ONLY_USERNAME} \
	-DWQP_READ_ONLY_PASSWORD=${WQP_READ_ONLY_PASSWORD}

# postgres to wqp db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${WQP_DATABASE_ADDRESS}:5432/${WQP_DATABASE_NAME} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	--liquibaseCatalogName=public \
	--liquibaseSchemaName=public \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DWQP_SCHEMA_OWNER_USERNAME=${WQP_SCHEMA_OWNER_USERNAME} \
	-DWQP_SCHEMA_NAME=${WQP_SCHEMA_NAME}
