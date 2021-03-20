#!/bin/sh

docker-compose up -d elasticsearch && \
  sleep 30 && \
  yes | \
  docker-compose exec -T elasticsearch /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto | \
  docker-compose run --rm -T users su - rails -c /var/www/es/current/scripts/set_users.sh > tee ./.env
