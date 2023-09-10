DOCKER_COMPOSE_FILE = ./docker-compose.yml

all: start_db db_migration run_mock_api run_api run_newman down_service all_done

down_service:
	docker compose -f $(DOCKER_COMPOSE_FILE) down

start_db:
	docker compose -f $(DOCKER_COMPOSE_FILE) up db -d --build;

db_migration:
	docker compose -f $(DOCKER_COMPOSE_FILE) up db-migration --exit-code-from db-migration --build;

run_mock_api:
	docker compose -f $(DOCKER_COMPOSE_FILE) up mock-api -d --build;

run_api:
	docker compose -f $(DOCKER_COMPOSE_FILE) --env-file ./.env.poc up api -d --build;

run_newman:
	docker compose -f $(DOCKER_COMPOSE_FILE) up api-test --exit-code-from api-test --build; \

all_done:
	echo "All step done"
