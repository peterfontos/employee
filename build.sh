#!/bin/bash

echo "Starting MongoDB..."
docker compose up -d mongo

echo "Populating DB..."
docker compose run --rm populate

echo "Starting Server and Client..."
docker compose up -d --build server client