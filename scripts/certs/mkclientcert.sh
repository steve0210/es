#!/bin/sh

wdir=$1
name=${2-intermediate}

$wdir/scripts/certs/intermediate/mkintermediatekey.sh $name
$wdir/scripts/certs/intermediate/mkintermediatecert.sh $name
$wdir/scripts/certs/intermediate/intermediateverify.sh $name
$wdir/scripts/certs/root/cpoutroot.sh $name
