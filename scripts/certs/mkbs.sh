#!/bin/sh

[ ! -d ./ca/out ] && \
  ./scripts/certs/mkrootbs.sh && \
  ./scripts/certs/mksignedcert.sh abc

true
