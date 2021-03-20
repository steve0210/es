#!/bin/sh

docker-compose up -d elasticsearch && \
  ./scripts/elasticsearch-setup-passwords.sh | docker-compose run --rm -T users su - rails -c /var/www/es/current/scripts/set_users.sh
