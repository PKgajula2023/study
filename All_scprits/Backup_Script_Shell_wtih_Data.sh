#!/bin/bash -f
#####old build removal######
SER_NAME="vik"
TODAY=`date --date='today' '+%d-%m-%Y-%H-%M'`
bkp_dir="/backup/$SER_NAME"
cd $bkp_dir
pwd
mkdir $TODAY
echo "Moving the old build artifacts /apps/ab3.0/$SER_NAME to $bkp_dir$TODAY"
cd $TODAY
pwd
mv /apps/ab3.0/$SER_NAME/*.jar  .
mv /apps/ab3.0/$SER_NAME/templates  .
mv /apps/ab3.0/$SER_NAME/orchestration  .
#mv /apps/ab3.0/$SER_NAME/application.properties  .
#mv /apps/ab3.0/$SER_NAME/application-prod.properties  .
