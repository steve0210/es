#!/bin/sh

dir=${1-ca}

./scripts/certs/mkroot.sh $dir
cd $dir
../scripts/certs/mkrootcnf.sh
../scripts/certs/mkrootkey.sh
../scripts/certs/mkrootverify.sh
../scripts/certs/mkintermediate.sh
../scripts/certs/mkintermediatecnf.sh
../scripts/certs/mkclientcert.sh
