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
 cd your_project
```

Run docker
```bash
docker compose up -d
```

Stop docker

```bash
docker compose down -v
```

---

## via Makefile

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
