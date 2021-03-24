#!/bin/sh

int=${1-intermediate}
ca=$(basename $(pwd))
clientd=out/client

echo "creating root.crt ..."
cp certs/$ca.cert.pem $clientd/root.crt
