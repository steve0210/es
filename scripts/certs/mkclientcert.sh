#!/bin/sh

name=${1-intermediate}

../scripts/certs/intermediate/mkintermediatekey.sh $name
../scripts/certs/intermediate/mkintermediatecert.sh $name
../scripts/certs/intermediate/intermediateverify.sh $name
../scripts/certs/root/cpoutroot.sh $name
