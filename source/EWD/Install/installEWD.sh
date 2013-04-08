#!/bin/bash

#
#  Set up required environment variables
#
source ./add_to_bashrc.txt

#
#   Install EWD Itself
#
EWDInstallationRoot='/opt/ewd'
mkdir -p $EWDInstallationRoot
pushd $EWDInstallationRoot

git clone git://github.com/robtweed/EWD.git

#
#   Prepare directory for specific EWD version
#
EWDBuildVersion='960'
mkdir -p $EWDBuildVersion
cp -r ./EWD/* ./$EWDBuildVersion
mkdir -p $EWDBuildVersion/routines/6.0-000
mv ./$EWDBuildVersion/*.m   ./$EWDBuildVersion/routines/
pushd ./$EWDBuildVersion/routines/6.0-000
$gtm_dist/mumps ../*.m
popd

popd


#
#   Install YUI (The Yahoo User Interface Library)
#
mkdir -p /opt/yui
pushd /tmp
wget wget http://downloads.sourceforge.net/project/yui/YUI%202/2.6.0/yui_2.6.0r2.zip
unzip  yui_2.6.0r2.zip -d /opt/yui/yui-2.6
popd


#
#  Ensure that the user add to its gtmroutines environment variable the path
#
#         $EWDInstallationRoot/$EWDBuildVersion/routines/6.0-000($EWDInstallationRoot/$EWDBuildVersion/routines)
#



#
#   Create Directory for the installation
#
EWDTreeDirectory='/INF362-EWD'
EWDAppsGTM=$EWDTreeDirectory/gtm

mkdir -p $EWDTreeDirectory
mkdir -p $EWDTreeDirectory/Apps
mkdir -p $EWDTreeDirectory/nodejs
mkdir -p $EWDTreeDirectory/www
mkdir -p $EWDTreeDirectory/www/resources
mkdir -p $EWDAppsGTM/o
mkdir -p $EWDAppsGTM/r
chmod -R 777 $EWDTreeDirectory

cp $EWDInstallationRoot/$EWDBuildVersion/ewdMgr/resourceFiles/*  $EWDTreeDirectory/www/resources/


#
#    Set up the zewd("config") global
#
cp configEWD.m  $EWDAppsGTM/r
pushd $EWDAppsGTM/o
$gtm_dist/mumps ../r/configEWD.m
$gtm_dist/mumps -r setup^configEWD
popd



#
#   Install Node.js Modules
#

npm install -g socket.io
npm install -g nodem
npm install -g ewdglobals
npm install -g ewdgateway2


#
#   Post installation of nodem
#
cp /usr/local/lib/node_modules/nodem/src/node.m   $EWDAppsGTM/r
pushd $EWDAppsGTM/o
$gtm_dist/mumps ../r/node.m
popd


#
#  Install Sencha Touch and ExtJS
#
mkdir -p $EWDTreeDirectory/www/downloads
pushd $EWDTreeDirectory/www/downloads
wget http://cdn.sencha.io/touch/sencha-touch-2.1.1-gpl.zip
wget http://cdn.sencha.com/ext/gpl/ext-4.2.0-gpl.zip
unzip  sencha-touch-2.1.1-gpl.zip
unzip  ext-4.2.0-gpl.zip
ln -s  $EWDTreeDirectory/www/downloads/ext-4.2.0.663   $EWDTreeDirectory/www/ext-4
ln -s  $EWDTreeDirectory/www/downloads/touch-2.1.1     $EWDTreeDirectory/www/st-2
popd

#
#  Users must add to their .bashrc the settings of gtm.
#
#  by adding the following line at the end of their ~/.bashrc file
#
#         source $EWDAppsGTM/setup/add_to_bashrc.txt
#
mkdir -p  $EWDAppsGTM/setup
cp  add_to_bashrc.txt  $EWDAppsGTM/setup/



#
#   Additional files to help with the development of EWD+Node.js apps.
#
cp  build.sh    $EWDTreeDirectory/Apps
cp  runEWDwithNodeJS.sh   $EWDTreeDirectory/nodejs
cp  ewdConfig.js   $EWDTreeDirectory/nodejs
ln -s /usr/local/lib/node_modules/ $EWDTreeDirectory/nodejs/
cp  index_for_ewdgateway2.js $EWDTreeDirectory/nodejs/node_modules/ewdgateway2/index.js
#
# This following line really depends on how you installed node.js
# This one is for the case where we built it from source code.
#
ln -s /usr/local/lib/node_modules/ /usr/lib/

