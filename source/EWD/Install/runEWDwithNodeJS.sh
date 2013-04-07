#!/bin/bash
#
#   Provide a Port Number as argument
#
date >> /INF362-EWD/nodejs/`whoami`/ewdLog.txt
tail -f /INF362-EWD/nodejs/`whoami`/ewdLog.txt &
nodejs  /INF362-EWD/nodejs/ewdConfig.js `whoami`  $1
stty sane

