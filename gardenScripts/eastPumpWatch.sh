#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
DATE=`date '+%Y-%m-%d %H:%M:%S'`
on_period=$1
touch /home/pi/cron.log
#d1=$(date +%s --date "$file_last_modified_date")  # 1478037600
#d2=$(date +%s --date "$variable")                 # 1478099452

# make sure value file exists 
if [ ! -e "/sys/class/gpio/gpio9/value" ]
then
 echo -e "!!- $DATE : [EAST]!! [FAIL] Checking East pump failed, /sys/class/gpio/gpio9/value not found [FAIL]" 2>&1; 	
 exit 3
fi

#check if pin is high (east pump running)
on=$(</sys/class/gpio/gpio9/value)
if [ "$on" -eq 0 ]
	then exit
fi

#calculate seconds since last modifiaction of value file
date_s=$(date +%s)
last_east_date=$(date +%s -r /sys/class/gpio/gpio9/value)
time_diff=$((date_s - last_east_date))

# echo "Diff is $time_diff" #debug

# if value file is on and too old, switch off east pump
if [ "$time_diff" -gt "$on_period" ]; then
	echo -e "!!- $DATE [EAST]!!: Emergency-Stop pump: $((on_period / 60)) mins of active pump exceeded ($((time_diff/60))) !!!"  2>&1;
	echo -e "!!- $DATE [EAST]!!: 			Closing sprinkle valve" 2>&1;
	echo '0' > /sys/class/gpio/gpio12/value || { echo -e "!!- $DATE [EAST]!!: 			Closing sprinkle valve failed [FAIL]" 2>&1;} 
	echo -e "!!- $DATE [EAST]!!: 			Closing dripping valve" 2>&1;
	echo '0' > /sys/class/gpio/gpio17/value || { echo -e "!!- $DATE [EAST]!!: 			Closing dripping valve failed [FAIL]" 2>&1; }
	echo '0' > /sys/class/gpio/gpio9/value || { echo -e "!!- $DATE [EAST]!!: [FAIL] Emergency Stop pump failed [FAIL]" 2>&1; }
fi
