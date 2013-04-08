#!/bin/bash
myUserName=`whoami`
EWDTreeDirectory='/INF362-EWD'
EWDAppsGTM=$EWDTreeDirectory/gtm

$gtm_dist/mumps -dir <<< 'd compileAll^%zewdAPI("'${myUserName}'")'

pushd $EWDAppsGTM/o
$gtm_dist/mumps ../r/ewdWL${myUserName}*.m
popd

