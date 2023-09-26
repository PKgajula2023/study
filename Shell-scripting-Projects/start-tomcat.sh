#!/bin/bash

TOMCAT_HOME="/apps/apache-tomcat-8.5.0"
TOMCAT_START="./startup.sh"
LOG="/home/tomcat/scripts/tomcat-restart.log"

JAVA_PID=`ps -ef|grep '$TOMCAT_HOME/'|grep -v "grep" |awk '{print $2}'`

if [ $JAVA_PID ]; then
        echo "tomcat is running (PID=$JAVA_PID). Quiting..."; exit;
fi

cd $TOMCAT_HOME/webapps
rm -rf novopay novopay-readonlydb service-external-gateway service-ops service-consumer-wallet service-np-wallet-impl service-user service-authentication service-limits-charges service-otp service-user1.1

printf "\n"
cd $TOMCAT_HOME/bin
$TOMCAT_START

JAVA_PID=`ps -ef|grep '$TOMCAT_HOME/'|grep -v grep |awk '{print $2}'`
printf "\n"
echo "Tomcat PID is $JAVA_PID"