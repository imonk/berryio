#!/bin/bash
# prevents pump from running too long
# if the pump pin is high since more than 20 minutes switch off pump and valves
PIN=$1;

echo "$PIN" > "/sys/class/gpio/export" 2>&1
sleep 1
echo "out" > "/sys/class/gpio/gpio$PIN/direction" 2>&1