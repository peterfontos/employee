#!/bin/bash

echo "Stopping running containers..."
docker stop client server mongo
echo "Containers stopped."