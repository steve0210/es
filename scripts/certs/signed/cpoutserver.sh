#!/bin/sh

name=$1
ca=$(basename $(pwd))

echo "creating server.crt and server.key"
cp intermediate/certs/$name.cert.pem out/server/server.crt
cp intermediate/private/$name.key.pem out/server/server.key
