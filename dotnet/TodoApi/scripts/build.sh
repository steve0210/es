#!/bin/sh

[ ! -d certs ] && \
  echo "Copy certs" && \
  cp -r ../../ca/out certs

build=$1

[ -z "$build" ] && \
  echo "Build..." && \
  docker-compose build dotnet

true
