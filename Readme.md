# APIs Testing

APIs Testing will use Postman for write test scripts and run via [newman](https://www.npmjs.com/package/newman)

## Table of Contents

- [APIs Testing](#apis-testing)
  - [Table of Contents](#table-of-contents)
  - [Structures](#structures)
  - [via Docker](#via-docker)
  - [via Makefile](#via-makefile)

---

## Structures

    ./
      ├── initial-db                   # Initial Database
      ├── migration                    # Database Migration
      ├── mountebank                   # Mocking 3rd Party
      ├── postman                      # APIs Testing Script
      ├── .env.test                    
      ├── docker-compose.yml
      ├── Makefile
      └── README.md

---

## via Docker

Go to root project

```bash
 cd cryptoplat-service-auth
```

Run docker
```bash
docker compose -f ./api-testing/docker-compose.yml --env-file ./api-testing/.env.test up --build -d
```

Stop docker

```bash
docker compose -f ./api-testing/docker-compose.yml down -v
```

---

## via Makefile

```bash
 cd cryptoplat-service-auth/api-testing
```

Run Container

```bash
make [TARGET_NAME]
```

example

```bash
make start_db
```
