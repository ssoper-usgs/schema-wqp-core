#!/bin/bash

${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${DATABASE_ADDRESS}:5432/${DATABASE_NAME} \
	--username=${WQP_DB_DATA_OWNER_USERNAME} \
	--password=${WQP_DB_DATA_OWNER_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DdataOwner=${WQP_DB_DATA_OWNER_USERNAME} \
	-DschemaName=${SCHEMA_NAME} \
	-DreadOnlyUser=${WQP_DB_READ_ONLY_USERNAME}
