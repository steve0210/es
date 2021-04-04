#!/bin/sh

docker-compose up -d elasticsearch && \
  sleep 30 && \
  yes | \
  docker-compose exec -T elasticsearch /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto | \
  docker-compose run --rm -T users su - rails -c /var/www/es/current/scripts/set_users.sh | tee ./kibana/.env && \
  (cd ./kibana && docker-compose up -d kibana) && \
  sleep 30 && \
  (cd ./metricbeat && docker-compose run --rm metricbeat setup && docker-compose up -d metricbeat) && \
  (cd ./apm-server && docker-compose up -d apm_server) && \
  sleep 30 && \
  (cd ./dotnet/TodoApi && ./scripts/build.sh nobuild && docker-compose up -d dotnet)
# (cd ./metricbeat && docker-compose up metricbeat)
