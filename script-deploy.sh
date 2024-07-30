#! /bin/bash

docker load -i vollmed-api.tar

mv docker-compose-prod.yaml docker-compose.yaml

container_ids=$(docker ps -q)

if [ -z "$container_ids" ]; then
  echo "nao ha containers em execucao"
else
  for container_id int $container_ids; do
    echo "parando container: $container_id"
    docker stio $container_id
  done
  echo "Todos os containers em execucao foram parados"
fi

docker compose up -d
