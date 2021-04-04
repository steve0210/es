#!/bin/sh

[ ! -d certs ] && \
  echo "Copy certs" && \
  cp -r /var/www/es/shared/ca/out certs

echo "Build..."
docker-compose build dotnet
