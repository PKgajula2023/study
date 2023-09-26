#!/bin/bash
sourceLocaion='/ProdRelease'
destLocation='/apps/content/release/'
sourceHost='202.143.97.68'
Id='smohapatro'
Cert='~/.id_rsa'
Port=1024

buildName=`ssh -p $Port -i $Cert $Id@$sourceHost "ls -rt $sourceLocaion"|tail -1`

isBuildnameCorrect=Y
read -p "Please conform the build name is $buildName (Y for yes, any other key for no[Y]:" isBuildnameCorrect

if [ "$isBuildnameCorrect" == "Y" ] || [ "$isBuildnameCorrect" == "y" ] ; then
    sourceLocaion=$sourceLocaion/$buildName;
else
    read -p "Enter the build name" buildName;
    sourceLocaion=$sourceLocaion/$buildName;
fi


scp -r -P $Port -i $Cert $Id@$sourceHost:$sourceLocaion $destLocation

md5sum  $destLocation$buildName/server/*/*.war $destLocation$buildName/node/*/*.gz
md5sum $destLocation$buildName/config/orchestration/ServiceOrchestrationXML.xml