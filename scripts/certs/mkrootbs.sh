#!/bin/sh

dir=${1-ca}
wdir=$(pwd)

./scripts/certs/root/mkroot.sh $dir
cd $dir
$wdir/scripts/certs/root/mkrootcnf.sh
$wdir/scripts/certs/root/mkrootkey.sh
$wdir/scripts/certs/root/mkrootverify.sh
$wdir/scripts/certs/intermediate/mkintermediate.sh
$wdir/scripts/certs/intermediate/mkintermediatecnf.sh
$wdir/scripts/certs/mkclientcert.sh $wdir
