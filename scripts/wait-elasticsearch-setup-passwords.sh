#!/bin/sh

./wait-for-it.sh localhost:9200 -- ./elasticsearch-setup-passwords.sh
