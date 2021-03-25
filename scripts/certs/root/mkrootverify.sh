#!/bin/sh

ca=$(basename $(pwd))
cert=certs/$ca.cert.pem

openssl x509 -noout -text -in $cert

