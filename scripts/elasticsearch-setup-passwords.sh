#!/bin/sh

sleep 30
yes | docker-compose exec -T elasticsearch /usr/share/elasticsearch/bin/elasticsearch-setup-passwords auto
