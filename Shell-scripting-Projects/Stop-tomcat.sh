#!/bin/bash

TOMCAT_HOME="/apps/apache-tomcat-8.5.0"
TOMCAT_STOP="./shutdown.sh"
WAIT_FOR=3
LOG="/home/tomcat/scripts/tomcat-restart.log"

JAVA_PID=`ps -ef|grep '/apps/apache-tomcat-8.5.0/'|grep -v grep |awk '{print $2}'`

if [ $? -eq 0 ]; then
        echo "Going to stop tomcat process with PID $JAVA_PID" >> $LOG
fi
printf "\n"
echo "Going to stop $JAVA_PID"
cd $TOMCAT_HOME/bin
$TOMCAT_STOP

i=10
while [ $i ]; do
        sleep $WAIT_FOR
        IF_TOMCAT_STILL_EXISTS=`ps ax | grep $JAVA_PID | grep $TOMCAT_HOME | grep -v grep`

        if [ $? -eq 0 ]; then
                echo "Process not dying!! Die piggy piggy die die" >> $LOG
                kill -15 $JAVA_PID;
                i=$(( $i - 1))
        else
                break;
        fi
done
###Checking tomcat if still running
kill -0 $JAVA_PID
if [ $? -eq 0 ]; then
        kill -9 $JAVA_PID;
fi

#cd "$TOMCAT_HOME/webapps"
pwd
cd /apps/apache-tomcat-8.5.0/webapps ;

rm -rf finocmsproxy retail-consumer billpayment-proxy hystrix-dashboard novopay novopay-readonlydb np-txlog orchestration-airtelmny service-aadhaar service-aadhaar-client-config service-airtelmny service-authentication service-axisaepstxn service-collections service-consumer-wallet service-external-gateway service-limits-charges service-np-wallet-impl service-ops service-otp service-remittance service-requests service-user service-user1.1

ls /apps/apache-tomcat-8.5.0/webapps

cat "$TOMCAT_HOME/logs/catalina.out" | gzip >> "$TOMCAT_HOME/logs/catalina.`date +'%Y-%m-%d'`.out.gz"; > "$TOMCAT_HOME/logs/catalina.out"
echo "Whew. Tomcat Stopped"