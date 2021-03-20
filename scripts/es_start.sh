#!/bin/sh

docker-compose up -d elasticsearch && ./scripts/elasticsearch-setup-passwords.sh
