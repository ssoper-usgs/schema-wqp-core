FROM usgswma/openjdk:debian-stretch-openjdk-11

LABEL maintainer="[gs-w_eto_eb_federal_employees@usgs.gov](mailto:gs-w_eto_eb_federal_employees@usgs.gov)"

############################################
# Install Liquibase
############################################

ENV LIQUIBASE_HOME /opt/liquibase
ENV LIQUIBASE_WORKSPACE $LIQUIBASE_HOME/workspace
ENV LOCALONLY "-c listen_addresses='127.0.0.1, ::1'"
ENV LIQUIBASE_VERSION 3.6.2
ENV JDBC_JAR postgresql-42.2.5.jar

ADD https://github.com/liquibase/liquibase/releases/download/liquibase-parent-$LIQUIBASE_VERSION/liquibase-$LIQUIBASE_VERSION-bin.tar.gz $LIQUIBASE_HOME/

ADD http://search.maven.org/remotecontent?filepath=org/slf4j/slf4j-api/1.7.25/slf4j-api-1.7.25.jar $LIQUIBASE_HOME/lib/slf4j-api.jar

ADD https://jdbc.postgresql.org/download/$JDBC_JAR $LIQUIBASE_HOME/lib/

RUN tar -xzf $LIQUIBASE_HOME/liquibase-$LIQUIBASE_VERSION-bin.tar.gz -C $LIQUIBASE_HOME/

RUN chmod -R 777 $LIQUIBASE_HOME

COPY ./docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh
RUN ln -s /usr/local/bin/docker-entrypoint.sh / # backwards compat
ENTRYPOINT ["docker-entrypoint.sh"]
