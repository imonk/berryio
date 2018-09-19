#!/bin/bash
# Start Water West
# set pin high for GPIO4 which is connected to pump and valve

DATE=`date '+%Y-%m-%d %H:%M:%S'`
echo -e "$DATE: Starting West pump & opening valve" 2>&1;
echo '1' > /sys/class/gpio/gpio4/value  || { echo -e "Start West pump and opening valve failed" 2>&1; }
#echo '1' > /sys/class/gpio/gpio94/value  || { echo -e "Fail test failed" 2>&1; exit 1; }