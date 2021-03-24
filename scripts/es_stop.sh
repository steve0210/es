#!/bin/sh

(cd metricbeat/ && docker-compose down) && \
  (cd kibana/ && docker-compose down) && \
  docker-compose down
