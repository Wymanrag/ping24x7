#!/bin/bash
#Check the file written by ping.sh to check if there are NOK's. If there only OK's clean it.
#Supposed to run every day.

FILE_PATH="$1"

ORIGINAL_TEXT=`cat $FILE_PATH`
NR_ENTRIES=`cat $FILE_PATH | grep -v NOK | wc -l`
NR_NOKS=`cat $FILE_PATH | grep -v Clean | grep NOK | wc -l`
CURRENT_DATE=`date +%d/%m/%y-%H:%M:%S`

if [ $NR_NOKS = 0 ]
then
 CLEANED_TEXT=`cat $FILE_PATH | grep Clean`
 echo $CLEANED_TEXT > $FILE_PATH
 echo "Cleaned on: $CURRENT_DATE. NOK/TOTAL: $NR_NOKS/$NR_ENTRIES" >> $FILE_PATH
fi
#Don't touch if there is a NOK in the file

#in the end send an e-mail with report
echo "$ORIGINAL_TEXT" | mail -s "[RPI]: Ping report $CURRENT_DATE - NOK/TOTAL: $NR_NOKS/$NR_ENTRIES" ze.pedro.rodrigues@gmail.com

