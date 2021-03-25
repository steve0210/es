#!/bin/sh

echo "making intermediate ..."
mkdir -p intermediate
cd intermediate
mkdir -p certs crl csr newcerts private
chmod 700 private
touch index.txt

file=serial
if [ -f "$file" ]; then
  echo "$file exists"
else
  echo 1000 > $file
fi

file=crlnumber
if [ -f "$file" ]; then
  echo "$file exists"
else
  echo 1000 > $file
fi
