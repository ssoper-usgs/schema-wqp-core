#!/bin/bash

# postgres to postgres db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/postgres/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://WQP_${AUDIENCE}_Database:5432/postgres \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DDATABASE_NAME=${DATABASE_NAME} \
	-DdataOwner=${DATA_OWNER} \
	-DDATA_OWNER_PASSWORD=${DATA_OWNER_PASSWORD} \
	-DschemaName=${SCHEMA_NAME} \
	-DreadOnlyUser=${READ_ONLY_USER} \
	-DREAD_ONLY_USER_PASSWORD=${READ_ONLY_USER_PASSWORD} \
	 > $LIQUIBASE_HOME/logs/liquibasePostgres.log

# postgres to wqp db scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/postgres/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://WQP_${AUDIENCE}_Database:5432/${DATABASE_NAME} \
	--username=postgres \
	--password=${POSTGRES_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DPOSTGRES_PASSWORD=${POSTGRES_PASSWORD} \
	-DdataOwner=${DATA_OWNER} \
	-DschemaName=${SCHEMA_NAME} \
	 > $LIQUIBASE_HOME/logs/liquibasePostgresWQP.log

# remaining wqp scripts
${LIQUIBASE_HOME}/liquibase \
	--classpath=${LIQUIBASE_HOME}/lib/${JDBC_JAR} \
	--changeLogFile=${LIQUIBASE_WORKSPACE}/wqp/changeLog.yml \
	--driver=org.postgresql.Driver \
	--url=jdbc:postgresql://WQP_${AUDIENCE}_Database:5432/${DATABASE_NAME} \
	--username=${DATA_OWNER} \
	--password=${DATA_OWNER_PASSWORD} \
	--contexts=${CONTEXTS} \
	--logLevel=debug \
	update \
	-DdataOwner=${DATA_OWNER} \
	-DschemaName=${SCHEMA_NAME} \
	-DreadOnlyUser=${READ_ONLY_USER} \
	-Dresult1=${result1} \
	-Dresult2=${result2} \
	-Dresult3=${result3} \
	-Dresult4=${result4} \
	-Dnemi_data_pwd=changeMe \
	-Dwqp_core_dbdw_pwd=changeMe \
	 > $LIQUIBASE_HOME/logs/liquibaseWQP.log