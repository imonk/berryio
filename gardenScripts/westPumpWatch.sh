#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
PATH="$PATH:/usr/share/berryio/gardenScripts"
DATE=`date '+%Y-%m-%d %H:%M:%S'`
#d2=$(date +%s --date "$variable")                 # 1478099452
#default
on_period=1200
#default to 20 min if called without arguments

#check for verbosity
if [ $# -eq 2 ]; then
	if [ "$2" = "-v" ]; then 
		verbose=true
	fi
elif [ "$1" = "-v" ]; then	
	verbose=true
	on_period=0
fi

#mark that we've been here
touch /home/pi/cron.log

# make sure value file exists 
if [ ! -e "/sys/class/gpio/gpio4/value" ]; then
 echo -e "!!- $DATE : [WEST]!! [FAIL] Checking pump failed, /sys/class/gpio/gpio4/value not found [FAIL]"  	
 exit 3
fi

#check if pin is high (east pump running)
on=$(</sys/class/gpio/gpio4/value)
if [ "$on" -eq 0 ];	then 
	if [ "$verbose" = true ]; then
	echo -e "$DATE: Pump and valve off/closed" 
	fi
	exit 
fi

#watch
if [ $# -eq 0 ]; then
    echo "No argument supplied. Checking for period of 20 min"
   
elif [ "$on_period" != 0 ]; then
    on_period=$1
fi

#calculate seconds since last modifiaction of value file
date_s=$(date +%s)
last_west_date=$(date +%s -r /sys/class/gpio/gpio4/value)
time_diff=$((date_s - last_west_date))

if [ "$verbose" = true ]; then 
	echo "Diff is $time_diff seconds"  
	if [ "$on_period" = 0 ]; then
		exit
	fi
fi 

# if value file is on and too old, switch off east pump
if [ "$time_diff" -gt "$on_period" ]; then
	echo -e "!!- $DATE [WEST]!!: Emergency-Stop pump & valve: $((on_period / 60)) mins of active pump exceeded ($((time_diff/60))) !!!"  
	source stopWaterWest.sh  
	echo -e "Subject: GardenPi Emergency West water stop: \r\n\r\n After $((on_period / 60)) mins ($((on_period)) seconds) of active pump exceeded limit of $(($time_diff/60)) minutes" | msmtp toerst@gmail.com 2>&1
fi
