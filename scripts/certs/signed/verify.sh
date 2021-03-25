#!/bin/sh

name=$1
ca=$(basename $(pwd))
cert=intermediate/certs/$name.cert.pem
icert=intermediate/certs/intermediate.cert.pem
root=certs/$ca.cert.pem

if [ -z "$name" ]; then
  echo "no name"; exit
elif [ ! -f "$cert" ]; then
  echo "no cert $cert"; exit
fi

openssl x509 -noout -text -in $cert

echo "\nsubject and issuers of $cert ..."
openssl crl2pkcs7 -nocrl -certfile $cert | openssl pkcs7 -print_certs -noout | awk 'NF > 0'

echo "\ncert $cert verification ..."
openssl verify -CAfile $root -untrusted $icert $cert
