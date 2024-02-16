#!makefile

COMPOSE_FILE_SERVICES="./etc/docker-compose/local-env.yaml"

docker-infra-up:
	docker compose \
	    -f ${COMPOSE_FILE_SERVICES} \
	    up -d

docker-infra-down:
	docker compose \
	    -f ${COMPOSE_FILE_SERVICES} \
	    down

docker-infra-status:
	docker ps -a \
		--filter "name=${COMPOSE_PROJECT_NAME}*" \
		--format "table {{.ID}}\t{{.Names}}\t{{.Status}}"

docker-service-restart:
	docker compose \
	    -f ${COMPOSE_FILE_SERVICES} \
	    restart \
		$(service)

.PHONY:
	docker-infra-status \
	docker-service-up \
	docker-service-down \
	docker-service-restart