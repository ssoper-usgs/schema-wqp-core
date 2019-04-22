FROM usgswma/wqp_db_base:postgis10-11.0.3

LABEL maintainer=gs-w_eto_eb_federal_employees@usgs.gov

ARG ARS_REPO_ZIP_URL
ARG BIODATA_REPO_ZIP_URL
ARG NWIS_REPO_ZIP_URL

RUN apt-get update && \
  apt-get install --no-install-recommends --no-upgrade curl -y && \
  rm -rf /var/lib/apt/lists/*

############################################
# Grab files for initializing wqp database
############################################

ENV LIQUIBASE_WORKSPACE_WQP $LIQUIBASE_HOME/workspace/wqp
COPY ./liquibase/changeLogs $LIQUIBASE_WORKSPACE_WQP
COPY ./liquibase/scripts/*.sh /docker-entrypoint-initdb.d/
COPY ./liquibase/scripts/dbInit /docker-entrypoint-initdb.d/

ENV LIQUIBASE_WORKSPACE_ARS $LIQUIBASE_WORKSPACE/ars
WORKDIR $LIQUIBASE_WORKSPACE_ARS
RUN curl $ARS_REPO_ZIP_URL -Lo master.zip
RUN unzip master.zip \
    && cp schema-ars-stewards-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z4_1_postgres_liquibase.sh \
    && cp schema-ars-stewards-master/liquibase/scripts/z2_ars_liquibase.sh /docker-entrypoint-initdb.d/z4_2_ars_liquibase.sh \
    && mv schema-ars-stewards-master/liquibase/changeLogs/* . \
    && rm master.zip

ENV LIQUIBASE_WORKSPACE_BIODATA $LIQUIBASE_WORKSPACE/biodata
WORKDIR $LIQUIBASE_WORKSPACE_BIODATA
RUN curl $BIODATA_REPO_ZIP_URL -Lo master.zip
RUN unzip master.zip \
    && cp schema-biodata-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z5_1_postgres_liquibase.sh \
    && cp schema-biodata-master/liquibase/scripts/z2_biodata_liquibase.sh /docker-entrypoint-initdb.d/z5_2_biodata_liquibase.sh \
    && mv schema-biodata-master/liquibase/changeLogs/* . \
    && rm master.zip

ENV LIQUIBASE_WORKSPACE_NWIS $LIQUIBASE_WORKSPACE/nwis
WORKDIR $LIQUIBASE_WORKSPACE_NWIS
RUN curl $NWIS_REPO_ZIP_URL -Lo master.zip
RUN unzip master.zip \
    && cp schema-nwis-ws-star-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z6_1_postgres_liquibase.sh \
    && cp schema-nwis-ws-star-master/liquibase/scripts/z2_nwis_liquibase.sh /docker-entrypoint-initdb.d/z6_2_nwis_liquibase.sh \
    && mv schema-nwis-ws-star-master/liquibase/changeLogs/* . \
    && rm master.zip
