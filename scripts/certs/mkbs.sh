#!/bin/sh

./scripts/certs/mkrootbs.sh && \
  ./scripts/certs/mksignedcert.sh abc
