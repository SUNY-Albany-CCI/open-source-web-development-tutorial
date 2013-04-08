#!/bin/bash
#
#   Provide a Port Number as argument
#
EWDTreeDirectory='/INF362-EWD'
EWDAppsNodejs=$EWDTreeDirectory/nodejs

date >> $EWDAppsNodejs/`whoami`/ewdLog.txt
tail -f $EWDAppsNodejs/`whoami`/ewdLog.txt &
nodejs  $EWDAppsNodejs/ewdConfig.js `whoami`  $1
stty sane

