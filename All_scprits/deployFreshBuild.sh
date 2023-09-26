#!/bin/bash
sourceParentPath='/apps/content/release'
destinationPath="/apps/apache-tomcat-8.5.0/webapps"
cd $sourceParentPath
latestDir=`ls -t1 |  head -n 1`
sourcePath="$sourceParentPath/$latestDir/server/services"
md5sum $sourcePath/*
isBuildnameCorrect="Y"
read -p "Please verify the above md5 checksums are correct(Y/N)[Y]:" isBuildnameCorrect
onlyNovopay="N"

read -p "Deploy only novopay.war (Y/N):" onlyNovopay

if [ "$isBuildnameCorrect" == "Y" ] || [ "$isBuildnameCorrect" == "y" ] ; then
        if [ "$onlyNovopay" == "N" ]; then
                cp -v $sourcePath/* $destinationPath/
        else
                cp -v $sourcePath/novopay.war $destinationPath/
        #ls $sourcePath/* $destinationPath/
        fi
else
    echo "Did not get the proper build. Please verify and re-run";
    echo "sourcePath=$sourcePath destinationPath=$destinationPath ";
fi