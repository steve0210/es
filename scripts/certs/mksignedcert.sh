#!/bin/sh

name=$1
dir=${2-ca}
wdir=$(pwd)

if [ -z "$name" ]; then
  echo "no name"; exit
fi

cd $dir
$wdir/scripts/certs/signed/mkcsr.sh $name
$wdir/scripts/certs/signed/mkcert.sh $name
$wdir/scripts/certs/signed/mkchain.sh $name
$wdir/scripts/certs/signed/verify.sh $name
$wdir/scripts/certs/signed/cpoutserver.sh $name
