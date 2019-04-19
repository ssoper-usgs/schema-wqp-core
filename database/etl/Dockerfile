FROM usgswma/wqp_db_base:postgis10-11.0.3

LABEL maintainer=gs-w_eto_eb_federal_employees@usgs.gov

ARG ARS_REPO_ZIP_URL
ARG BIODATA_REPO_ZIP_URL
ARG NWIS_REPO_ZIP_URL

############################################
# Grab files for initializing wqp database
############################################

ENV LIQUIBASE_WORKSPACE_WQP $LIQUIBASE_HOME/workspace/wqp
COPY ./liquibase/changeLogs $LIQUIBASE_WORKSPACE_WQP
COPY ./liquibase/scripts/*.sh /docker-entrypoint-initdb.d/
COPY ./liquibase/scripts/dbInit /docker-entrypoint-initdb.d/

ENV LIQUIBASE_WORKSPACE_ARS $LIQUIBASE_WORKSPACE/ars
WORKDIR $LIQUIBASE_WORKSPACE_ARS
ADD $ARS_REPO_ZIP_URL $LIQUIBASE_WORKSPACE_ARS/master.zip
RUN pwd
RUN ls -al
RUN unzip master.zip
RUN cp schema-ars-stewards-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z4_1_postgres_liquibase.sh
RUN cp schema-ars-stewards-master/liquibase/scripts/z2_ars_liquibase.sh /docker-entrypoint-initdb.d/z4_2_ars_liquibase.sh
RUN mv schema-ars-stewards-master/liquibase/changeLogs/* .

ENV LIQUIBASE_WORKSPACE_BIODATA $LIQUIBASE_WORKSPACE/biodata
WORKDIR $LIQUIBASE_WORKSPACE_BIODATA
ADD $BIODATA_REPO_ZIP_URL $LIQUIBASE_WORKSPACE_BIODATA/master.zip
RUN pwd
RUN ls -al
RUN unzip master.zip
RUN cp schema-biodata-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z5_1_postgres_liquibase.sh
RUN cp schema-biodata-master/liquibase/scripts/z2_biodata_liquibase.sh /docker-entrypoint-initdb.d/z5_2_biodata_liquibase.sh
RUN mv schema-biodata-master/liquibase/changeLogs/* .

ENV LIQUIBASE_WORKSPACE_NWIS $LIQUIBASE_WORKSPACE/nwis
WORKDIR $LIQUIBASE_WORKSPACE_NWIS
ADD $NWIS_REPO_ZIP_URL $LIQUIBASE_WORKSPACE_NWIS/master.zip
RUN pwd
RUN ls -al
RUN unzip master.zip
RUN cp schema-nwis-ws-star-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z6_1_postgres_liquibase.sh
RUN cp schema-nwis-ws-star-master/liquibase/scripts/z2_nwis_liquibase.sh /docker-entrypoint-initdb.d/z6_2_nwis_liquibase.sh
RUN mv schema-nwis-ws-star-master/liquibase/changeLogs/* .
