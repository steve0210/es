#!/bin/sh

ca=$(basename $(pwd))
key=private/$ca.key.pem
cert=certs/$ca.cert.pem

if [ -f "$key" ]; then
  echo "$ca key exists"
else
  echo "creating $ca key"
  openssl genrsa -aes256 -out $key 4096
  chmod 400 $key
fi

if [ -f "$cert" ]; then
  echo "$ca csr exists"
else
  echo "creating $ca csr"
  openssl req -config openssl.cnf -key $key \
    -new -x509 -days 7300 -sha256 -extensions v3_ca -out $cert
fi
