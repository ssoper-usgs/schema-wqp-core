# schema\-wqp\-core

Liquibase scripts for creating the WQ Owner database schema objects. They are used for both the Water Quality Portal (WQP) and the Internal Water Quality Data Delivery systems.

The scripts are executed via a Jenkins job.

Parameters used for configuration:

* **readOnlyUser** - The limited privilege schema used by applications to access this schema.

* **dataOwner** - The schema in which these scripts are run and objects created.

* **result1** - The name of the first tablespace in the partitioning round robin of very large tables.

* **result2** - The name of the second tablespace in the partitioning round robin of very large tables.

* **result3** - The name of the third tablespace in the partitioning round robin of very large tables.

* **result4** - The name of the fourth tablespace in the partitioning round robin of very large tables.

* **nemi\_data\_pwd** - The password used in creating database links to the nemi repository.

* **wqp\_core\_pwd** - The password used in creating database links to the wqp safe repository.


Context values used for configuration:

* **external** - These changesets are unique to the WQP.

* **ci** - These changesets are unique to the continuous integration database layer.

* **dev** - These changesets are unique to the development database layer.

* **qa** - These changesets are unique to the quality assurance database layer.

* **prod** - These changesets are unique to the production database layer.
