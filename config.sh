#!/bin/bash

# Set the base directory for config repo
CONFIG_REPO_DIR="pantry-app-config-repo"
mkdir -p $CONFIG_REPO_DIR

# Services list
services=("pantry-api-gateway" "pantry-auth-service" "pantry-recipe-service" "pantry-household-service" "pantry-inventory-service")

# Environments
envs=("dev" "prod")

# Create yml files
for service in "${services[@]}"; do
  for env in "${envs[@]}"; do
    cat <<EOF > "$CONFIG_REPO_DIR/${service}-${env}.yml"
spring:
  datasource:
    url: jdbc:postgresql://localhost:5432/${service//-/_}_${env}
    username: ${service//-/_}_user
    password: ${env}_secret_password
  jpa:
    hibernate:
      ddl-auto: update
    show-sql: true

jwt:
  secret: ${env}_jwt_secret_here

server:
  port: 8080
EOF
  done
done

# Create global yml files
for env in "${envs[@]}"; do
  cat <<EOF > "$CONFIG_REPO_DIR/global-${env}.yml"
management:
  endpoints:
    web:
      exposure:
        include: "*"

feature:
  premium_enabled: false
EOF
done

# Optional README
echo "# Pantry App Config Repo" > "$CONFIG_REPO_DIR/README.md"

echo "✅ Config repo structure created!"
