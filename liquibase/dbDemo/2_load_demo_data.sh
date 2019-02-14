#!/bin/bash

gunzip -c ${LIQUIBASE_HOME}/wqp_core_all.tar.gz | pg_restore -h WQP_${AUDIENCE}_Database -p 5432 -U ${DATA_OWNER} -w -c -d wqp_db

psql -v ON_ERROR_STOP=1 -U postgres -h WQP_${AUDIENCE}_Database -p 5432 -w -d wqp_db -c "vacuum full;"