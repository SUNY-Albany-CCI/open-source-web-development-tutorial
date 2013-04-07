#!/bin/bash
myUserName=`whoami`
$gtm_dist/mumps -dir <<< 'd compileAll^%zewdAPI("'${myUserName}'")'
pushd /INF362-EWD/gtm/o
$gtm_dist/mumps ../r/ewdWL${myUserName}*.m
popd

