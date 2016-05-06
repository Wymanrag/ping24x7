#!/bin/bash
#Pings for a number of seconds - nr of pings assumed the same as the number of seconds and reports in the end a single line
HOST=$1
PING_COUNT=$2

START_TIME=`date +%d/%m/%y-%H:%M:%S`
LOST_PKTS=`ping $HOST -c $PING_COUNT | tail | grep loss | awk '{print $4 - $1}'`
END_TIME=`date +%d/%m/%y-%H:%M:%S`

if [ $LOST_PKTS = 0 ]
then
 echo "[$HOST]: $START_TIME <-> $END_TIME: OK"
else 
 echo "[$HOST]: $START_TIME <-> $END_TIME: NOK!! Lost pkts... $LOST_PKTS"
fi

