#!/bin/sh

name=${1-intermediate}

../scripts/certs/mkintermediatekey.sh $name
../scripts/certs/mkintermediatecert.sh $name
../scripts/certs/intermediateverify.sh $name
../scripts/certs/cpoutroot.sh $name
