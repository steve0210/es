#!/bin/sh

int=${1-intermediate}
csr=intermediate/csr/$int.csr.pem
cert=intermediate/certs/$int.cert.pem

ext=v3_intermediate_ca

if [ -f "$cert" ]; then
  echo "$int cert exists"
else
  echo "creating cert $cert"
  openssl ca -config openssl.cnf -extensions $ext \
    -days 3650 -notext -md sha256 -in $csr -out $cert
fi

chmod 444 $cert
