#!/bin/sh

name=$1

if [ -z "$name" ]; then
  echo "no name"; exit
fi
../scripts/certs/signed/mkcsr.sh $name
../scripts/certs/signed/mkcert.sh $name
../scripts/certs/signed/mkchain.sh $name
../scripts/certs/signed/verify.sh $name
../scripts/certs/signed/cpoutserver.sh $name
