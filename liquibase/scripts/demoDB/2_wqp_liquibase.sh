#!/bin/bash

${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/wqp/schemaGrants/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://${DATABASE_ADDRESS}:5432/${DATABASE_NAME} \
	--username=${DATA_OWNER} \
	--password=${DATA_OWNER_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DdataOwner=${DATA_OWNER} \
	-DschemaName=${SCHEMA_NAME} \
	-DreadOnlyUser=${READ_ONLY_USER}
