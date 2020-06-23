# Docker goose
[![GitHub Workflow Status](https://img.shields.io/github/workflow/status/gomicro/docker-goose/Build/master)](https://github.com/gomicro/docker-goose/actions?query=workflow%3ABuild+branch%3Amaster)
[![License](https://img.shields.io/github/license/gomicro/docker-goose.svg)](https://github.com/gomicro/docker-goose/blob/master/LICENSE.md)
[![Release](https://img.shields.io/github/release/gomicro/docker-goose.svg)](https://github.com/gomicro/docker-goose/releases/latest)

The purposed of this docker image is to create a super tiny image for running migrations. It is predominantly a wrapper for [goose](https://github.com/pressly/goose), the migration cli built in Golang.

It is built on top of Alpine with the latest stable release of goose and bash installed.

## Usage

It is recommended to build your own migration images from this one with an entrypoint to execute everything. This is to ensure the same migrations can be run in your environments.

```
project
|_ ...
|_migrations
| |_001_init.sql
| |_002_add-new-thing.sql
| |_Dockerfile
|_ ...
```

###Dockerfile

```
FROM gomicro/goose

ADD *.sql /migrations/
ADD entrypoint.sh /migrations/

ENTRYPOINT ["/migrations/entrypoint.sh"]
```

###Entrypoint

```
#!/bin/bash

DBSTRING="host=$DBHOST user=$DBUSER password=$DBPASSWORD dbname=$DBNAME sslmode=$DBSSL"

goose postgres "$DBSTRING" up
```

###Migrations

See goose's documentation for [SQL Migrations](https://github.com/pressly/goose#sql-migrations) on how to structure the migration files.

# Versioning
The image will be versioned following the stable releases of [goose](https://github.com/pressly/goose). Only the patch version may change in order to force updates to the docker image. See the [releases](https://github.com/gomicro/forge/releases) section for the latest version.

# License
See [LICENSE.md](./LICENSE.md) for more information.
