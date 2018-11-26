#!/bin/bash

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://ARS_STEWARDS_Database:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DARS_STEWARDS_DATABASE_NAME=${ARS_STEWARDS_DATABASE_NAME} \
	-DARS_STEWARDS_OWNER=${ARS_STEWARDS_OWNER} \
	-DARS_STEWARDS_OWNER_PASSWORD=${ARS_STEWARDS_OWNER_PASSWORD} \
	-DARS_STEWARDS_SCHEMA_NAME=${ARS_STEWARDS_SCHEMA_NAME} \
	-DWQP_CORE_OWNER=${WQP_CORE_OWNER} \
	-DWQP_CORE_OWNER_PASSWORD=${WQP_CORE_OWNER_PASSWORD} \
	 > $LIQUIBASE_HOME/logs/liquibasePostgres.log

# postgres to wqp db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://ARS_STEWARDS_Database:5432/${ARS_STEWARDS_DATABASE_NAME} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DARS_STEWARDS_OWNER=${ARS_STEWARDS_OWNER} \
	-DARS_STEWARDS_SCHEMA_NAME=${ARS_STEWARDS_SCHEMA_NAME} \
	 > $LIQUIBASE_HOME/logs/liquibasePostgresWQP.log

# remaining wqp scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://ARS_STEWARDS_Database:5432/${ARS_STEWARDS_DATABASE_NAME} \
	--username=${ARS_STEWARDS_OWNER} \
	--password=${ARS_STEWARDS_OWNER_PASSWORD} \
	--logLevel=debug \
	update \
	-DARS_STEWARDS_OWNER=${ARS_STEWARDS_OWNER} \
	-DARS_STEWARDS_SCHEMA_NAME=${ARS_STEWARDS_SCHEMA_NAME} \
	-DWQP_CORE_OWNER=${WQP_CORE_OWNER} \
	 > $LIQUIBASE_HOME/logs/liquibaseWQP.log