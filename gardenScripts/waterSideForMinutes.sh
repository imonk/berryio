#!/bin/bash
PATH="$PATH:/usr/share/berryio/gardenScripts"
side=$1
minutes=$2
channel=$3
stop="0";

waitAndCheckUserInput () {
	#sleep "$minutes"m
	local end=$((SECONDS+60*$minutes))
	while [ $SECONDS -lt $end ]; do
      read -t 1 stop;
      if [[ $stop == "s" ]]; then
       break
 	  fi
 	done
}

if [ $side = "east" ]; then
	### Full-Water ###
	if [ $# -eq 2 ]; then
	 echo ">> Full water on east balcony for $minutes minutes"
	 source startFullWaterEast.sh
	 waitAndCheckUserInput
	 echo ">> Stopping full water on east balcony after $((SECONDS/60)) minutes"
	 source stopFullWaterEast.sh
	
	### Sprinkle ###
	elif [ $channel = "sprinkle" ]; then
	 echo ">> Sprinkling east balcony for $minutes minutes"
	 source startSprinklerEast.sh
	 waitAndCheckUserInput
	 echo ">> Stopping sprinkling east balcony after $((SECONDS/60)) minutes"
	 source stopSprinklerEast.sh
	
	### Dripping ###
	elif [ $channel = "drip" ]; then
	 echo ">> Drip-watering east balcony for $minutes minutes"
	 source startDrippingEast.sh
	 waitAndCheckUserInput
	 echo ">> Stopping Drip-watering on east balcony after $((SECONDS/60)) minutes"
	 source stopDrippingEast.sh
	fi
fi

if [ $side = "west" ]; then
	 echo ">> Watering west balcony for $minutes minutes"
	 source startWaterWest.sh
	 waitAndCheckUserInput
	 echo ">> Stopping watering of west balcony after $((SECONDS/60)) minutes"
	 source stopWaterWest.sh
fi

