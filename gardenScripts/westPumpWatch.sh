#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
DATE=`date '+%Y-%m-%d %H:%M:%S'`
on_period=$1
verbose=$2
touch /home/pi/cron.log

#default to 20 min if called without arguments
if [ $# -eq 0 ]
  then
    echo "No argument supplied, setting 20 min"
    on_period=1200
fi


#d1=$(date +%s --date "$file_last_modified_date")  # 1478037600
#d2=$(date +%s --date "$variable")                 # 1478099452

# make sure value file exists 
if [ ! -e "/sys/class/gpio/gpio4/value" ]
then
 echo -e "!!- $DATE : [WEST]!! [FAIL]: Checking pump failed, /sys/class/gpio/gpio4/value not found" 2>&1; 	
 exit 3
fi

#check if pin is high (east pump running)
on=$(</sys/class/gpio/gpio4/value)
if [ "$on" -eq 0 ]
	then exit 
fi

#calculate seconds since last modifiaction of value file
date_s=$(date +%s)
last_west_date=$(date +%s -r /sys/class/gpio/gpio4/value)
time_diff=$((date_s - last_west_date))

if [ $# -eq 2 ]
then
    if [ $verbose = "-v" ] 
	then echo "Diff is $time_diff seconds" #debug
	fi
fi



# if value file is on and too old, switch off east pump
if [ "$time_diff" -gt "$on_period" ]; then
	echo -e "!!- $DATE [WEST]!!: Emergency-Stop pump & valve: $((on_period / 60)) mins of active pump exceeded ($((time_diff/60))) !!!"  2>&1;
	echo '0' > /sys/class/gpio/gpio4/value || { echo -e "!!- $DATE [WEST]!!: [FAIL] Emergency Stop pump failed [FAIL]" 2>&1; }
fi
