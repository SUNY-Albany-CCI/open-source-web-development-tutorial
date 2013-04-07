#!/bin/bash
#
#   Run this script with sudo.
#

mkdir -p  /data/gtm/database
mkdir -p  /data/gtm/o
mkdir -p  /data/gtm/r

export gtm_dist=/opt/gtm
export gtmgbldir="/data/gtm/database"
export gtmroutines="/data/gtm/o(/data/gtm/r) $gtm_dist/  /opt/gtm/libgtmutil.so"
alias gtm='$gtm_dist/mumps -dir'

$gtm_dist/mumps -r GDE

$gtm_dist/mupip  create

$gtm_dist/dse change -f -key_max=1023 -rec=4096

