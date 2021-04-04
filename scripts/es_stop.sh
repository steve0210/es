#!/bin/sh

(cd ./dotnet/TodoApi && docker-compose down) && \
(cd ./apm-server && docker-compose down) && \
(cd ./metricbeat && docker-compose down) && \
  (cd ./kibana && docker-compose down) && \
  docker-compose down
