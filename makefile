# Makefile for managing PostgreSQL container with environment variables from dev.yaml

# Load values from dev.yaml using yq
DB_NAME=$(shell yq eval '.DB_NAME' dev.yaml)
DB_USER=$(shell yq eval '.DB_USER' dev.yaml)
DB_PASSWORD=$(shell yq eval '.DB_PASSWORD' dev.yaml)
DB_PORT=$(shell yq eval '.DB_PORT' dev.yaml)

# Docker image and container name
IMAGE_NAME=postgres:latest
CONTAINER_NAME=my_postgres

# Command to start the PostgreSQL container
postgres_up:
	docker run -d \
	  --name $(CONTAINER_NAME) \
	  -e POSTGRES_DB=$(DB_NAME) \
	  -e POSTGRES_USER=$(DB_USER) \
	  -e POSTGRES_PASSWORD=$(DB_PASSWORD) \
	  -p $(DB_PORT):5432 \
	  $(IMAGE_NAME)

# Command to stop the PostgreSQL container
postgres_down:
	docker stop $(CONTAINER_NAME) && docker rm $(CONTAINER_NAME)

# Command to check the container status
postgres_status:
	docker ps -f name=$(CONTAINER_NAME)

