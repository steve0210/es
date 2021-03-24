#!/bin/sh

int=${1-intermediate}
encrypt="-aes256"
len=4096

key=intermediate/private/$int.key.pem
csr=intermediate/csr/$int.csr.pem

if [ -f "$key" ]; then
  echo "$int key exists"
else
  echo "creating $int key ..."
  openssl genrsa $encrypt -out $key $len
  chmod 400 $key
fi

if [ -f "$csr" ]; then
  echo "$int csr exists"
else
  echo "creating $int csr ..."
  openssl req -config intermediate/openssl.cnf -new -sha256 -key $key -out $csr
fi
