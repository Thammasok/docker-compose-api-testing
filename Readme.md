# APIs Testing

APIs Testing will use Postman for write test scripts and run via [newman](https://www.npmjs.com/package/newman)

## Table of Contents

- [APIs Testing](#apis-testing)
  - [Table of Contents](#table-of-contents)
  - [Structures](#structures)
  - [Initial Database](#initial-database)
  - [Migration](#migration)
    - [Step to arange data before run test](#step-to-arange-data-before-run-test)
  - [Mountebank](#mountebank)
  - [Postman](#postman)
    - [Naming Rules](#naming-rules)
    - [How does entrypoint work?](#how-does-entrypoint-work)
    - [Newman \& HTML reporter](#newman--html-reporter)
  - [Docker](#docker)
    - [via Docker](#via-docker)
    - [via Makefile](#via-makefile)
  - [Running Test Step](#running-test-step)
      - [via Docker Compose](#via-docker-compose)
      - [via Makefile](#via-makefile-1)

---

## Structures

    ./root
      ├── initial-db                   # Initial Database
      ├── migration                    # Database Migration
      ├── mountebank                   # Mocking 3rd Party
      ├── postman                      # APIs Testing Script
      ├── .env.test
      ├── docker-compose.yml
      ├── Makefile
      └── README.md

---

## Initial Database

Initial database is restore database when start container.

---

## Migration

Migration is the storage of arange data for testing in a database. It uses SQL Script to insert, update, and delete data before testing.

### Step to arange data before run test

1. Create SQL scripts for prepare INSERT/DELETE/UPDATE data in database.
2. Create SQL file and bring SQL script into this file.
3. Save SQL file into folder changelog in migration folder.
4. Go to changelog-root.yml file and write code to run SQL file.

```yaml
databaseChangeLog:
  - changeSet:
      id: 0.1.0 Example change
      author: nutz
      changes:
        - sqlFile:
            path: changelogs/[FILE_NAME].sql
        - rollback:
            - sqlFile:
                path: changelogs/rollbacks/[FILE_NAME].sql
```

---

## Mountebank

Create Mocking Services for 3rd Party

---

## Postman

Store the postman collection and environment

    ./postman
      ├── collections         # Postman Collections (Test Scenarios)
      ├── data                # Postman Data for Iteration
      ├── environments        # Postman Envitonments
      ├── files               # Storage Files for Test (Ex. image, pdf etc.)
      ├── reports             # Reports after run Test
      ├── Dockerfile
      └── entrypoint.sh       # newman command

### Naming Rules

In this postman folder Name Naming rules for Collections, Data, Environments:

**_Collection_**
Collection must contain this word. (.postman_collection.json) is a component after the file name

```Text
NAME.postman_collection.json
```

**_Data_**
Data must contain this word. (.postman_data.json) is a component after the file name

```Text
NAME.postman_data.json
```

**_Environment_**
Environment must contain this word. (.postman_environment.json) is a component after the file name

```Text
NAME.postman_environment.json
```

If you want to use the Postman Data file for recursive testing, name it the same as the Collection file. Docker will automatically call that file for you.

Example.

```Text
  Collection: create_learner.postman_collection.json
  Data: create_learner.postman_data.json

  # if you want to use environment
  Enviroment: create_learner.postman_environment.json
```

If you want to use an Environment file for testing, name it the same as a Collection file. Docker will automatically call that file. If there is no Environment file, it will use the default file (default.postman_environment.json).

### How does entrypoint work?

to run the test, use Newman to command Run the test by writing the command at entrypoint.sh

Step:

```Text
1. Find Test Scenarios in the collections folder.
2. Find Data in the data folder.
    1. If available, data will be retrieved from that data file
3. Find Environment in the environments folder.
    1. If available, data from that Collection file will be used.
    2. If not available, data from the file will be used. default.postman_environment.json instead
```

### Newman & HTML reporter

[Newman](https://www.npmjs.com/package/newman) is a command-line collection runner for Postman. It allows you to effortlessly run and test a Postman collection directly from the command-line. It is built with extensibility in mind so that you can easily integrate it with your continuous integration servers and build systems.

A [Newman HTML reporter](https://www.npmjs.com/package/newman-reporter-htmlextra) that has been extended to include the separation of the iteration runs so these are no longer aggregated together and also some additional handlebars helpers to enable users to create better custom templates.

This reporter comes with a dashboard style summary landing page and a set of different tabs which contain the detailed request information. There are also a few optional configuration flags available, to tailor the final report in a number of different ways.

install [NodeJS](https://nodejs.org/en) before install newman and newman-reporter-htmlextra

Install newman

```bash
npm install -g newman
```

Install newman-reporter-htmlextra

```
npm install -g newman-reporter-htmlextra
```

Basic Run newman

```bash
  newman run ./postman/collections/[Collection File] -e ./postman/environments/[environment File] -r htmlextra
```

Run newman with data

```bash
  newman run ./postman/collections/[Collection File] -e ./postman/environments/[environment File] -d ./postman/data/[data File] -r htmlextra
```

---

## Docker

You can use Docker Compose in two ways:

### via Docker

Go to root project

```bash
 cd your_project
```

Run docker (all container)

```bash
docker compose up -d
```

Run specification container:

```bash
docker compose up [CONTAINER_NAME] -d
```

Example:
Run docker (for api service)

```bash
docker compose up api -d
```

Stop docker

```bash
docker compose down -v
```

---

### via Makefile

```bash
 cd your_project
```

Run Container

```bash
make [TARGET_NAME]
```

example

```bash
make start_db
```

---

## Running Test Step

In testing APIs Test, there are the following steps:

```text
  1. Start Database
  2. Migration Database
  3. Start Other System [If there is]
  4. Start Mocking APIs [If there is]
  5. Start API Service
  6. Run APIs Test
```

#### via Docker Compose

1. Start Database

```bash
  docker compose up db -d
```

2. Migration Database

```bash
  docker compose up db-migration --exit-code-from db-migration --build
```

3. Start Other System [If there is]

```bash
  docker compose up [CONTAINER_NAME] -d
```

4. Start Mocking APIs [If there is]

```bash
  docker compose up mock-api -d
```

5. Start API Service

```bash
  docker compose up api-test --exit-code-from api-test --build
```

6. Run APIs Test

```bash
  docker compose up api-test --exit-code-from api-test --build
```

---

#### via Makefile

1. Start Database

```bash
  make start_db
```

2. Migration Database

```bash
  make db_migration
```

3. Start Other System [If there is]

```bash
  make [NAME]
```

4. Start Mocking APIs [If there is]

```bash
  make run_mock_api
```

5. Start API Service

```bash
  make run_api
```

6. Run APIs Test

```bash
  make run_test
```

---
