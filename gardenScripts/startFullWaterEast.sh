#!/bin/bash
# Start Full Water East
# set pin high for pump and both valves

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Opening East dripping valve" 2>&1;
echo '1' > /sys/class/gpio/gpio17/value || { echo -e "Opening East dripping valve failed" 2>&1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Opening East sprinkle valve" 2>&1;
echo '1' > /sys/class/gpio/gpio12/value || { echo -e "Opening East sprinkle valve failed" 2>&1; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Starting East pump" 2>&1;
echo '1' > /sys/class/gpio/gpio9/value || { echo -e "Starting East pump failed" 2>&1; }



