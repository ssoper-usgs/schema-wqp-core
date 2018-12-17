# schema\-wqp\-core

Liquibase scripts for creating the WQ Owner database schema objects. They are used for both the Water Quality Portal (WQP) and the Internal Water Quality Data Delivery systems. The repo also includes Docker Compose scripts to setup a continuous integration PostGIS database.

In order to use the docker compose scripts, you will need to create a .env file in the project directory containing
the following (shown are example values):
```

POSTGRES_PASSWORD=<changeMe>
AUDIENCE=(external|internal)
CONTEXTS=(external|internal)[,ci]
DATABASE_NAME=<wqp_db>
SCHEMA_NAME=<wqp>
DATA_OWNER=<wqp_core>
DATA_OWNER_PASSWORD=<changeMe>
READ_ONLY_USER=<wqp_user>
READ_ONLY_USER_PASSWORD=<changeMe>

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


Environment variables:

* **POSTGRES_PASSWORD** - Password for the postgres user.

* **AUDIENCE** - Which flavor of the database to create - **external** or **internal**.

* **CONTEXTS** - Which Liquibase contexts to apply. See list below for valid values.

* **DATABASE_NAME** - Name of the PostgreSQL database to create for containing the schema.

* **SCHEMA_NAME** - Name of the schema to create for holding database objects.

* **DATA_OWNER** - Role which will own the database objects.

* **DATA_OWNER_PASSWORD** - Password for the **DATA_OWNER** role.

* **READ_ONLY_USER** - The limited privilege role used by applications to access this database.

* **READ\_ONLY\_USER_PASSWORD** - Password for the **READ\_ONLY\_USER** role.



Context values used for configuration:

* **external** - These changesets are unique to the external WQP.

* **internal** - These changesets are unique to the internal WQP.

* **ci** - These changesets are unique to the continuous integration database layer.

* **dev** - These changesets are unique to the development database layer.

* **qa** - These changesets are unique to the quality assurance database layer.

* **prod** - These changesets are unique to the production database layer.
