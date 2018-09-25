#!/bin/bash
# Start Dripping East
# set pin high for pump and drip valve

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Opening East dripping valve"
echo '1' > /sys/class/gpio/gpio17/value || { echo -e "Opening East dripping valve failed" ; exit 1; }

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Starting East pump"
echo '1' > /sys/class/gpio/gpio9/value || { echo -e "Starting East pump failed";}