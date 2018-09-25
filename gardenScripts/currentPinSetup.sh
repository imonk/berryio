#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
PATH="$PATH:/usr/share/berryio/gardenScripts"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo "[$DATE] Setting up pins 4,9,12 and 17 as out" 2>&1

source setAsOutPin.sh 17 2>&1
source setAsOutPin.sh 12 2>&1
source setAsOutPin.sh 9  2>&1
source setAsOutPin.sh 4  2>&1

echo -e 'Subject: GardenPi startup \r\n\r\nSet up pins modes at $DATE' | msmtp toerst@gmail.com

