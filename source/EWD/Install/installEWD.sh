#!/bin/bash

#
#   Install EWD Itself
#
source ./add_to_bashrc.txt

mkdir -p /opt/ewd
pushd /opt/ewd

git clone git://github.com/robtweed/EWD.git
mkdir -p 960
cp -r ./EWD/* ./960
mkdir -p 960/routines/6.0-000
mv ./960/*.m   ./960/routines/
pushd ./960/routines/6.0-000
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
#         /opt/ewd/960/routines/6.0-000(/opt/ewd/960/routines)
#

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
cp /usr/local/lib/node_modules/nodem/src/node.m   /data/gtm/r
pushd /data/gtm/o
$gtm_dist/mumps ../r/node.m
popd

#
#   Create Directory for the installation
#
EWDTreeDirectory='/INF362-EWD'
mkdir -p $EWDTreeDirectory
mkdir -p $EWDTreeDirectory/Apps
mkdir -p $EWDTreeDirectory/nodejs
mkdir -p $EWDTreeDirectory/gtm/o
mkdir -p $EWDTreeDirectory/gtm/r
mkdir -p $EWDTreeDirectory/www
mkdir -p $EWDTreeDirectory/www/resources
chmod -R 777 $EWDTreeDirectory

cp configEWD.m  $EWDTreeDirectory/gtm/r
pushd $EWDTreeDirectory/gtm/o
$gtm_dist/mumps ../r/configEWD.m
$gtm_dist/mumps -r setup^configEWD
popd

cp /opt/ewd/960/ewdMgr/resourceFiles/*  $EWDTreeDirectory/www/resources/

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
#         source /data/gtm/setup/add_to_bashrc.txt
#
mkdir -p  /data/gtm/setup
cp  add_to_bashrc.txt  /data/gtm/setup/



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

