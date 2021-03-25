#!/bin/sh

dir=${1-ca}

./scripts/certs/root/mkroot.sh $dir
cd $dir
../scripts/certs/root/mkrootcnf.sh
../scripts/certs/root/mkrootkey.sh
../scripts/certs/root/mkrootverify.sh
../scripts/certs/intermediate/mkintermediate.sh
../scripts/certs/intermediate/mkintermediatecnf.sh
../scripts/certs/mkclientcert.sh
