#!/bin/bash
PATH="$PATH:/usr/share/berryio/gardenScripts"
side=$1
minutes=$2
channel=$3
#

if [ $side = "east" ]; then 
	if [ $# -eq 2 ]; then
	 echo ">> Full water on east balcony for $minutes minutes" 2>&1
	 source startFullWaterEast.sh
	 sleep "$minutes"m
	 echo ">> Stopping full water on east balcony after $minutes minutes" 2>&1
	 source stopFullWaterEast.sh
	elif [ $channel = "sprinkle" ]; then 
	 echo ">> Sprinkling east balcony for $minutes minutes" 2>&1
	 source startSprinklerEast.sh
	 sleep "$minutes"m
	 echo ">> Stopping sprinkling east balcony after $minutes minutes" 2>&1
	 source stopSprinklerEast.sh
	elif [ $channel = "drip" ]; then
	 echo ">> Drip-watering east balcony for $minutes minutes" 2>&1
	 source startDrippingEast.sh
	 sleep "$minutes"m
	 echo ">> Stopping Drip-watering on east balcony after $minutes minutes" 2>&1
	 source stopDrippingEast.sh
	fi
fi 

if [ $side = "west" ]; then 
	 echo ">> Watering west balcony for $minutes minutes" 2>&1
	 source startWaterWest.sh
	 sleep "$minutes"m
	 echo ">> Stopping watering of west balcony after $minutes minutes" 2>&1
	 source stopWaterWest.sh
fi 