FROM usgswma/wqp_db_base:postgis10-11.0.3

LABEL maintainer=gs-w_eto_eb_federal_employees@usgs.gov

############################################
# Grab files for initializing wqp database
############################################

ENV LIQUIBASE_WORKSPACE_WQP $LIQUIBASE_HOME/workspace/wqp
COPY ./liquibase/changeLogs $LIQUIBASE_WORKSPACE_WQP
COPY ./liquibase/scripts/*.sh /docker-entrypoint-initdb.d/
COPY ./liquibase/scripts/dbInit /docker-entrypoint-initdb.d/
COPY ./liquibase/scripts/dbData /docker-entrypoint-initdb.d/

ADD "https://cida.usgs.gov/artifactory/wqp/wqp_core_all.tar.gz" $LIQUIBASE_HOME
RUN chmod +r $LIQUIBASE_HOME/wqp_core_all.tar.gz
