#!/bin/sh

ca=$(basename $(pwd))
int=${1-intermediate}
cert=intermediate/certs/$int.cert.pem
root=certs/$ca.cert.pem

openssl x509 -noout -text -in $cert
openssl verify -CAfile $root $cert
cat index.txt
