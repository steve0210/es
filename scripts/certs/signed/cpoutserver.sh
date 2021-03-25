#!/bin/sh

name=$1
ca=$(basename $(pwd))

echo "creating server.crt and server.key"
mkdir -p out/server/$name

cp intermediate/certs/$name.cert.pem out/server/$name/server.crt
cp intermediate/private/$name.key.pem out/server/$name/server.key
