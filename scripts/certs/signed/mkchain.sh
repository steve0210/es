#!/bin/sh

name=$1

if [ -z "$name" ]
then
  echo "no name"; exit
fi

cert=intermediate/certs/$name.cert.pem
icert=intermediate/certs/intermediate.cert.pem
chain=$cert.chain

if [ -f "$chain" ]; then
  echo "chain $chain exists"
else
  echo "making chain $chain"
  cat $cert $icert > $chain
  cp $chain $cert
  chmod 444 $cert
fi
