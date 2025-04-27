#!/bin/bash

# Set the base directory for infra repo
INFRA_REPO_DIR="pantry-app-private-infra"
mkdir -p $INFRA_REPO_DIR

# Docker Compose folders
mkdir -p $INFRA_REPO_DIR/docker/{auth-service,inventory-service,recipe-service,household-service,api-gateway,kafka,postgres,redis}

# AWS infra folders
mkdir -p $INFRA_REPO_DIR/terraform
mkdir -p $INFRA_REPO_DIR/ecs-task-definitions

# Create base docker-compose.yml
cat <<EOF > "$INFRA_REPO_DIR/docker-compose.yml"
version: '3.9'

services:
  postgres-authdb:
    image: postgres:13
    environment:
      POSTGRES_USER: auth_user
      POSTGRES_PASSWORD: strongpassword
      POSTGRES_DB: authdb
    ports:
      - "5432:5432"
    networks:
      - backend

  auth-service:
    build: ./docker/auth-service
    ports:
      - "8081:8081"
    environment:
      SPRING_PROFILES_ACTIVE: dev
    depends_on:
      - postgres-authdb
    networks:
      - backend

networks:
  backend:
EOF

# Create a basic README
echo "# Pantry App Private Infra" > "$INFRA_REPO_DIR/README.md"

echo "✅ Private infra repo structure created!"
