#!/bin/bash

echo "Starting containers..."
docker start mongo server client
echo "Containers running."