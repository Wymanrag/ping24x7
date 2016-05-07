# ping24x7
CREDIT TO @NUNO_RODRIGUES
ping to a given IP with mailed stats 


How it works???

This will run a ping every hour 


Put this in the crontab:
#############################################################
# Every hour pinging the Internet Gateway and speedtest
0 * * * * /home/pi/ping.sh 46.189.192.1 3605 >> /tmp/teste_ping.txt
0 * * * * /home/pi/ping.sh speedtest-lx.vodafone.pt 3605 >> /tmp/teste_ping_speed_lx.txt

# Once a day at 00:05 look for NOK periods. Send an e-mail - this requires the mail system working properly.
5 0 * * *  /home/pi/ping_cleaner_v2.sh /tmp/teste_ping.txt
5 0 * * *  /home/pi/ping_cleaner_v2.sh /tmp/teste_ping_speed_lx.txt
##############################################################

NOTE: To setup the e-mail check the document related to this - Configure_MTA_raspberry.docx

