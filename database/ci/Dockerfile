FROM usgswma/wqp_db_base:postgis10-11.0.2

LABEL maintainer=gs-w_eto_eb_federal_employees@usgs.gov

############################################
# Grab files for initializing wqp database
############################################

COPY ./liquibase/changeLogs $LIQUIBASE_WORKSPACE
COPY ./liquibase/scripts/*.sh /docker-entrypoint-initdb.d/
COPY ./liquibase/scripts/dbInit /docker-entrypoint-initdb.d/
