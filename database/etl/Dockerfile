FROM usgswma/wqp_db_base:postgis10-11.0.3

LABEL maintainer=gs-w_eto_eb_federal_employees@usgs.gov

ARG ARS_REPO_ZIP_URL=https://github.com/NWQMC/schema-ars-stewards/archive/master.zip
ARG BIODATA_REPO_ZIP_URL=https://github.com/NWQMC/schema-biodata/archive/master.zip
ARG NWIS_REPO_ZIP_URL=https://github.com/NWQMC/schema-nwis-ws-star/archive/master.zip
ARG EPA_REPO_ZIP_URL=https://github.com/NWQMC/schema-epa/archive/master.zip

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

ENV LIQUIBASE_WORKSPACE_EPA $LIQUIBASE_WORKSPACE/epa
WORKDIR $LIQUIBASE_WORKSPACE_EPA
RUN curl $EPA_REPO_ZIP_URL -Lo master.zip
RUN unzip master.zip \
    && cp schema-epa-master/liquibase/scripts/z1_postgres_liquibase.sh /docker-entrypoint-initdb.d/z7_1_postgres_liquibase.sh \
    && cp schema-epa-master/liquibase/scripts/z2_epa_liquibase.sh /docker-entrypoint-initdb.d/z7_2_epa_liquibase.sh \
    && mv schema-epa-master/liquibase/changeLogs/* . \
    && rm master.zip
