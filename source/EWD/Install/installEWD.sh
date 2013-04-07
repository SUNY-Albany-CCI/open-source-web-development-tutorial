#!/bin/bash

#
#   Install EWD Itself
#
mkdir /opt/ewd
cd /opt/ewd
git clone git://github.com/robtweed/EWD.git
mkdir -p 960/Routines/6.0-000
cp EWD/*.m   960/Routines/6.0-000
cd 960/Routines/6.0-000
$gtm_dist/mumps ../*.m

#
#  Ensure that the user add to its gtmroutines environment variable the path
#
#         /opt/ewd/960/Routines/6.0-000(/opt/ewd/960/Routines)
#

#
#   Install Node.js Modules
#

npm install -g nodem
npm install -g ewdglobals
npm install -g ewdgateway2


#
#   Create Directory for the installation
#
EWDTreeDirectory='/INF362-EWD'
mkdir $EWDTreeDirectory
mkdir $EWDTreeDirectory/Apps
mkdir $EWDTreeDirectory/nodejs
mkdir $EWDTreeDirectory/gtm/o
mkdir $EWDTreeDirectory/gtm/r
mkdir $EWDTreeDirectory/www
mkdir $EWDTreeDirectory/www/resources

#
#  Install Sencha Touch and ExtJS
#
mkdir $EWDTreeDirectory/www/downloads
cd $EWDTreeDirectory/www/downloads
wget http://cdn.sencha.io/touch/sencha-touch-2.1.1-gpl.zip
wget http://cdn.sencha.com/ext/gpl/ext-4.2.0-gpl.zip
unzip  sencha-touch-2.1.1-gpl.zip
unzip  ext-4.2.0-gpl.zip
ln -s  $EWDTreeDirectory/www/downloads/ext-4.2.0.663   $EWDTreeDirectory/www/ext-4
ln -s  $EWDTreeDirectory/www/downloads/touch-2.1.1     $EWDTreeDirectory/www/st-2

#
# Open GTM and create this Global
#
#   ^zewd("config","RootURL","gtm")="/ewd/"
#   ^zewd("config","applicationRootPath")="/INF362-EWD/Apps/"
#   ^zewd("config","backEndTechnology")="m"
#   ^zewd("config","defaultFormat")="pretty"
#   ^zewd("config","defaultTechnology")="gtm"
#   ^zewd("config","frontEndTechnology")="gtm"
#   ^zewd("config","jsScriptPath","gtm","mode")="fixed"
#   ^zewd("config","jsScriptPath","gtm","outputPath")="/INF362-EWD/resources"
#   ^zewd("config","jsScriptPath","gtm","path")="/resources/"
#   ^zewd("config","routinePath","gtm")="/INF362-EWD/gtm/r/"
#   ^zewd("config","sessionDatabase")="gtm"
#
#   GTM>zwrite ^zewd("config",*)
#


#
#  Users must add to their .bashrc the settings of gtm.
#
#  by adding the following line at the end of their ~/.bashrc file
#
#         source /data/gtm/setup/add_to_bashrc.txt
#


cp  build.sh    $EWDTreeDirectory/Apps
cp  runEWDwithNodeJS.sh   $EWDTreeDirectory/nodejs
cp  ewdConfig.js   $EWDTreeDirectory/nodejs
