#!/bin/sh
#docker-compose down -v
sudo rm -rf app
mkdir app
cp .env.dist app/.env
#docker-compose up -d
