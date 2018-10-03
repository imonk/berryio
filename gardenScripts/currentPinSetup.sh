#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
PATH="$PATH:/usr/share/berryio/gardenScripts"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "[$DATE] Setting up pins 4,9,12 and 17 as out"

source setAsOutPin.sh 17 2>&1
source setAsOutPin.sh 12 2>&1
source setAsOutPin.sh 9  2>&1
source setAsOutPin.sh 4  2>&1

sleep 5

while ! ping -q -c 1 -W 1 google.com >/dev/null;  do
	sleep 5
done

GPIOS="$(ls /sys/class/gpio/)"
echo -e "Subject: gardenPi started up \r\n\r\nSet up pins modes at $DATE as $GPIOS  \r\n $(crontab -u pi -l)" | msmtp toerst@gmail.com