# schema\-wqp\-core

Liquibase scripts for creating the WQ Owner database schema objects. They are used for both the Water Quality Portal (WQP) and the Internal Water Quality Data Delivery systems. The repo also includes Docker Compose scripts to setup a continuous integration PostGIS database.

In order to use the docker compose scripts, you will need to create a .env file in the project directory containing
the following (shown are example values):
```
POSTGRES_PASSWORD=<changeMe>

ARS_STEWARDS_OWNER=ars_stewards_owner
ARS_STEWARDS_OWNER_PASSWORD=<changeMe>
ARS_STEWARDS_DATABASE_NAME=ars_stewards_db
ARS_STEWARDS_SCHEMA_NAME=ars_stewards

WQP_CORE_OWNER=wqp_core
WQP_CORE_OWNER_PASSWORD=<changeMe>

```

To create a postgres database and then run the liquibase scripts:
```
% docker-compose up -d db
% docker-compose up liquibase
```

The PostGIS database will be available on port 5434

Other Helpful commands include:
* __docker-compose up__ to create and start the containers
* __docker-compose ps__ to list the containers
* __docker-compose stop__ or __docker-compose kill__ to stop the containers
* __docker-compose start__ to start the containers
* __docker-compose rm__ to remove all containers
* __docker network inspect pubsdb_default__ to get the ip addresses of the running containers
* __docker-compose ps -q__ to get the Docker Compose container ids
* __docker ps -a__ to list all the Docker containers
* __docker rm <containerId>__ to remove a container
* __docker rmi <imageId>__ to remove an image
* __docker logs <containerID>__ to view the Docker Compose logs in a container


Parameters used for configuration:

* **readOnlyUser** - The limited privilege schema used by applications to access this schema.

* **dataOwner** - The schema in which these scripts are run and objects created.

* **result1** - The name of the first tablespace in the partitioning round robin of very large tables.

* **result2** - The name of the second tablespace in the partitioning round robin of very large tables.

* **result3** - The name of the third tablespace in the partitioning round robin of very large tables.

* **result4** - The name of the fourth tablespace in the partitioning round robin of very large tables.

* **nemi\_data\_pwd** - The password used in creating database links to the nemi repository.

* **wqp_core_dbdw_pwd** - The password used in creating database links to the wqp safe repository.


Context values used for configuration:

* **external** - These changesets are unique to the external WQP.

* **internal** - These changesets are unique to the internal WQP.

* **ci** - These changesets are unique to the continuous integration database layer.

* **dev** - These changesets are unique to the development database layer.

* **qa** - These changesets are unique to the quality assurance database layer.

* **prod** - These changesets are unique to the production database layer.
