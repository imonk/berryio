date_=$(date +%s)
DATE=`date '+%Y-%m-%d %H:%M:%S'`
twentyMinutes=12 #1200

#d1=$(date +%s --date "$file_last_modified_date")  # 1478037600
#d2=$(date +%s --date "$variable")                 # 1478099452

# make sure value file exists 
if [ ! -e "/sys/class/gpio/gpio4/value" ]
then
 echo -e "!!- $DATE - !!: Checking west pump failed, gpio4/value not found" 2>&1; 	
 exit 3
fi

onoff=$(< /sys/class/gpio/gpio4/value)

if ["$onoff" -eq "0"]
	then exit 
fi

last_west_date=$(date +%s -r /sys/class/gpio/gpio4/value)

if (( (date_s - last_west_date) > twentyMinutes )); then
    
	echo -e "!!- $DATE - !!: Emergency-Stop West pump, 20 mins active pump exceeded"  2>&1;
	echo '0' > /sys/class/gpio/gpio4/value || { echo -e "!!- $DATE - !!: Emergency Stop West pump failed" 2>&1; }
fi