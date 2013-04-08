#!/bin/bash
#
#   Run this script with sudo.
#

EWDTreeDirectory='/INF362-EWD'
EWDAppsGTM=$EWDTreeDirectory/gtm

mkdir -p  $EWDAppsGTM/database
mkdir -p  $EWDAppsGTM/o
mkdir -p  $EWDAppsGTM/r

export gtm_dist=/opt/gtm
export gtmgbldir="$EWDAppsGTM/database"
export gtmroutines="$EWDAppsGTM/o($EWDAppsGTM/r) $gtm_dist/  /opt/gtm/libgtmutil.so"
alias gtm='$gtm_dist/mumps -dir'

echo "At the GDE>  prompt, type "
echo "GDE> change -s DEFAULT -f=$EWDAppsGTM/database"
echo "GDE> exit"

$gtm_dist/mumps -r GDE

$gtm_dist/mupip  create

$gtm_dist/dse change -f -key_max=1023 -rec=4096

