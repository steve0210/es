#!/bin/sh

name=$1
dir=${2-ca}

if [ -z "$name" ]; then
  echo "no name"; exit
fi

cd $dir
../scripts/certs/signed/mkcsr.sh $name
../scripts/certs/signed/mkcert.sh $name
../scripts/certs/signed/mkchain.sh $name
../scripts/certs/signed/verify.sh $name
../scripts/certs/signed/cpoutserver.sh $name
