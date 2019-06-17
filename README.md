# NWQMC PostgreSQL Database for the Water Quality Portal

This repository contains Liquibase scripts for creating the Water Quality Portal (WQP) database. They are used for both the WQP and the Internal Water Quality Data Delivery systems.

## Docker
Also included are Docker Compose scripts to:
* Create PostgreSQL and Liquibase containers for testing the scripts.
* Create a continuous integration PostgreSQL database container.
* Create a PostgreSQL database container for local development containing a sampling of WQP data.

### Docker Network
A named Docker Network is required for local running of the containers. Creating this network allows you to run all of the WQP locally in individual containers without having to maintain a massive Docker Compose script encompassing all of the required pieces. (It is also possible to run portions of the system locally against remote services.) The name of this network is provided by the __LOCAL_NETWORK_NAME__ environment variable. The following is a sample command for creating your own local network. In this example the name is wqp and the ip addresses will be 172.25.0.x

```
docker network create --subnet=172.25.0.0/16 wqp
```

### Environment variables
In order to use the docker compose scripts, you will need to create a .env file in the project directory containing

the following (shown are example values):

```
POSTGRES_PASSWORD=<changeMe>

WQP_DATABASE_ADDRESS=(wqp_external_database|wqp_internal_database)
WQP_DATABASE_NAME=<wqp_db>
WQP_DB_OWNER_USERNAME=<wqp_core>
WQP_DB_OWNER_PASSWORD=<changeMe>

WQP_SCHEMA_NAME=<wqp>
WQP_SCHEMA_OWNER_USERNAME=<wqp_core>
WQP_SCHEMA_OWNER_PASSWORD=<changeMe>

WQP_READ_ONLY_USERNAME=<wqp_user>
WQP_READ_ONLY_PASSWORD=<changeMe>

LOCAL_NETWORK_NAME=<wqp>

DB_IPV4=<172.25.0.2>
DB_PORT=<5434>
LIQUIBASE_IPV4=<172.25.0.3>

LIQUIBASE_VERSION=<3.6.3>
JDBC_JAR=<postgresql-42.2.5.jar>

DB_CI_PORT=<5435>
DB_CI_IPV4=<172.25.0.4>

DB_DEMO_PORT=<5436>
DB_DEMO_IPV4=<172.25.0.5>

CONTEXTS=(external|internal)[,ci|dev|qa|prod][,schemaload]

DB_ETL_PORT=<5437>
DB_ETL_IPV4=<172.25.0.7>

ARS_REPO_ZIP_URL=<https://github.com/NWQMC/schema-ars-stewards/archive/master.zip>
ARS_SCHEMA_NAME=<ars>
ARS_SCHEMA_OWNER_USERNAME=<ars_owner>
ARS_SCHEMA_OWNER_PASSWORD=<changeMe>

BIODATA_REPO_ZIP_URL=<https://github.com/NWQMC/schema-biodata/archive/master.zip>
BIODATA_SCHEMA_NAME=<biodata>
BIODATA_SCHEMA_OWNER_USERNAME=<biodata_owner>
BIODATA_SCHEMA_OWNER_PASSWORD=<changeMe>

NWIS_REPO_ZIP_URL=<https://github.com/NWQMC/schema-nwis-ws-star/archive/master.zip>
NWIS_SCHEMA_NAME=<nwis>
NWIS_SCHEMA_OWNER_USERNAME=<nwis_ws_star>
NWIS_SCHEMA_OWNER_PASSWORD=<changeMe>

EPA_REPO_ZIP_URL=<https://github.com/NWQMC/schema-epa/archive/master.zip>
EPA_SCHEMA_OWNER_USERNAME=<epa_owner>
EPA_SCHEMA_OWNER_PASSWORD=<changeMe>
WQX_SCHEMA_NAME=<wqx>
STORETW_SCHEMA_NAME=<storetw>

```

#### Environment variable definitions

* **POSTGRES_PASSWORD** - Password for the postgres user.

* **WQP_DATABASE_ADDRESS** - Host name or IP address of the PostgreSQL database.
* **WQP_DATABASE_NAME** - Name of the PostgreSQL database to create for containing the schema.
* **WQP_DB_OWNER_USERNAME** - Role which will own the database.
* **WQP_DB_OWNER_PASSWORD** - Password for the **WQP_DB_OWNER_USERNAME** role.

* **WQP_SCHEMA_NAME** - Name of the schema to create for holding database objects.
* **WQP_SCHEMA_OWNER_USERNAME** - Role which will own the database objects.
* **WQP_SCHEMA_OWNER_PASSWORD** - Password for the **WQP_SCHEMA_OWNER_USERNAME** role.

* **WQP_READ_ONLY_USERNAME** - The limited privilege role used by applications to access this schema.
* **WQP_READ_ONLY_PASSWORD** - Password for the **WQP_READ_ONLY_USERNAME** role.

* **LOCAL_NETWORK_NAME** - The name of the local Docker Network you have created for using these images/containers.
* **DB_IPV4** - The IP address in your Docker Network you would like assigned to the database container used for testing the Liquibase scripts.
* **DB_PORT** - The localhost port on which to expose the script testing database container.
* **LIQUIBASE_IPV4** - The IP address you would like assigned to the Liquibase runner container.

* **LIQUIBASE_VERSION** - The version of Liquibase to install.
* **JDBC_JAR** - The jdbc driver to install.

* **DB_CI_PORT** - The localhost port on which to expose the CI database.
* **DB_CI_IPV4** - The IP address for the CI database container.

* **DB_DEMO_PORT** - The localhost port on which to expose the Demo database.
* **DB_DEMO_IPV4** - The IP address for the Demo database container.

* **CONTEXTS** - Which Liquibase contexts to apply. See list below for valid values.

* **DB_ETL_PORT** - The localhost port on which to expose the CI database.
* **DB_ETL_IPV4** - The IP address for the CI database container.

* **ARS_REPO_ZIP_URL** - The URL for the Download ZIP file of the https://github.com/NWQMC/schema-ars-stewards project.
* **ARS_SCHEMA_NAME** - Name of the schema to create for holding STEWARDS database objects.
* **ARS_SCHEMA_OWNER_USERNAME** - Role which will own the **ARS_SCHEMA_NAME** database objects.
* **ARS_SCHEMA_OWNER_PASSWORD** - Password for the **ARS_SCHEMA_OWNER_PASSWORD** role.

* **BIODATA_REPO_ZIP_URL** - The URL for the Download ZIP file of the https://github.com/NWQMC/schema-biodata project.
* **BIODATA_SCHEMA_NAME** - Name of the schema to create for holding BIODATA database objects.
* **BIODATA_SCHEMA_OWNER_USERNAME** - Role which will own the **BIODATA_SCHEMA_NAME** database objects.
* **BIODATA_SCHEMA_OWNER_PASSWORD** - Password for the **BIODATA_SCHEMA_OWNER_USERNAME** role.

* **NWIS_REPO_ZIP_URL** - The URL for the Download ZIP file of the https://github.com/NWQMC/schema-nwis-ws-star project.
* **NWIS_SCHEMA_NAME** - Name of the schema to create for holding NWIS database objects.
* **NWIS_SCHEMA_OWNER_USERNAME** - Role which will own the **NWIS_SCHEMA_NAME** database objects.
* **NWIS_SCHEMA_OWNER_PASSWORD** - Password for the **NWIS_SCHEMA_OWNER_USERNAME** role.

##### Context values used for configuration

* **external** - These changesets are unique to the external WQP.
* **internal** - These changesets are unique to the internal WQP.

* **ci** - These changesets are unique to the continuous integration database layer.
* **dev** - These changesets are unique to the development database layer.
* **qa** - These changesets are unique to the quality assurance database layer.
* **prod** - These changesets are unique to the production database layer.

* **schemaLoad** - Build the entire schema.

### Testing Liquibase scripts
The Liquibase scripts can be tested locally by spinning up the generic database (db) and the liquibase container.

```
% docker-compose up -d db
% docker-compose up liquibase
```
The local file system is mounted into the liquibase container. This allows you to change the liquibase and shell scripts and run the changes by just re-launching the liquibase container. Note that all standard Liquibase caveats apply.

The PostGIS database will be available on your localhost's port $DB_PORT, allowing for visual inspection of the results.

### CI Database
```
docker-compose up ciDB
```
It will be available on you localhost's port $DB_CI_PORT

You can also pull the image from Docker Hub and run it with

```
docker run -it --env-file ./.env -p 127.0.0.1:5434:5432 usgswma/wqp_db:ci
```
where __./.env__ is the environment variable file you have locally and __5434__ can be changed to the port you wish to access it via.

### Demo Database

```
docker-compose up demoDB
```

It will be available on your localhost's port $DB_DEMO_PORT


You can also pull the image from Docker Hub and run it with

```
docker run -it --env-file ./.env -p 127.0.0.1:5434:5432 usgswma/wqp_db:demo
```

where __./.env__ is the environment variable file you have locally and __5434__ can be changed to the port you wish to access it via.

### Etl Database

```
docker-compose up etlDB
```

It will be available on your localhost's port $DB_ETL_PORT


You can also pull the image from Docker Hub and run it with

```
docker run -it --env-file ./.env -p 127.0.0.1:5434:5432 usgswma/wqp_db:etl
```

where __./.env__ is the environment variable file you have locally and __5434__ can be changed to the port you wish to access it via.

### Other Helpful commands include:
* __docker-compose up__ to create and start the containers
* __docker-compose ps__ to list the containers
* __docker-compose stop__ or __docker-compose kill__ to stop the containers
* __docker-compose start__ to start the containers
* __docker-compose rm__ to remove all containers
* __docker network ls__ to get a list of local docker network names
* __docker network inspect XXX__ to get the ip addresses of the running containers
* __docker-compose ps -q__ to get the Docker Compose container ids
* __docker ps -a__ to list all the Docker containers
* __docker rm <containerId>__ to remove a container
* __docker rmi <imageId>__ to remove an image
* __docker logs <containerID>__ to view the Docker Compose logs in a container
