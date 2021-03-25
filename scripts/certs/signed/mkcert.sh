#!/bin/sh

name=$1
days=${2-375}

csr=intermediate/csr/$name.csr.pem
cert=intermediate/certs/$name.cert.pem

if [ -z "$name" ]; then
  echo "no name"; exit
elif [ ! -f "$csr" ]; then
  echo "no csr $csr"; exit
fi

if [ -f $cert ]; then
  echo "cert $cert exists"
else
  echo "creating cert $cert"
  openssl ca -config intermediate/openssl.cnf \
    -extensions es_cert -days $days -notext -md sha256 \
    -in $csr -out $cert
  chmod 444 $cert
fi

cat intermediate/index.txt
