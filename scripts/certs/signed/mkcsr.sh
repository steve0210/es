#!/bin/sh

name=$1

if [ -z "$name" ]; then
  echo "no name"; exit
fi

key=intermediate/private/$name.key.pem
csr=intermediate/csr/$name.csr.pem

if [ -f $key ]; then
  echo "key $key exists"
else
  echo "making key $key ..."
  openssl genrsa -out $key 2048
  chmod 400 $key
fi

if [ -f $key ]; then
  echo "csr $csr exists"
else
  echo "making csr $csr ..."
  openssl req -config intermediate/openssl.cnf \
    -extensions req_ext -key $key -new -sha256 -out $csr
fi
