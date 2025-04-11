#!/bin/bash

echo "Stopping and removing all ..."
docker compose down -v --rmi all
echo "Project cleaned."