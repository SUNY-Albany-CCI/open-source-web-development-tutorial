#!/bin/bash

#
#   Install EWD Itself
#
source ./add_to_bashrc.txt

mkdir -p /opt/ewd
pushd /opt/ewd

git clone git://github.com/robtweed/EWD.git
mkdir -p 960/routines/6.0-000
cp ./EWD/*.m   ./960/routines/
pushd ./960/routines/6.0-000
$gtm_dist/mumps ../*.m
popd

popd


#
#  Ensure that the user add to its gtmroutines environment variable the path
#
#         /opt/ewd/960/routines/6.0-000(/opt/ewd/960/routines)
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


cp  build.sh    $EWDTreeDirectory/Apps
cp  runEWDwithNodeJS.sh   $EWDTreeDirectory/nodejs
cp  ewdConfig.js   $EWDTreeDirectory/nodejs

