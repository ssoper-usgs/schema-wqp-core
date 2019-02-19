#!/bin/bash

gunzip -c ${LIQUIBASE_HOME}/wqp_core_all.tar.gz | pg_restore --dbname=postgresql://postgres:${POSTGRES_PASSWORD}@WQP_${AUDIENCE}_Database:5432/${DATABASE_NAME} -c -F t

psql -v ON_ERROR_STOP=1 --dbname=postgresql://postgres:${POSTGRES_PASSWORD}@WQP_${AUDIENCE}_Database:5432/${DATABASE_NAME} -c "vacuum full;"