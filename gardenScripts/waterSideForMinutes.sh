#!/bin/bash
PATH="$PATH:/usr/share/berryio/gardenScripts"
side=$1
minutes=$2
channel=$3
stop="0";

if [ $side = "east" ]; then
	if [ $# -eq 2 ]; then
	 echo ">> Full water on east balcony for $((SECONDS/60)) minutes" 2>&1
	 source startFullWaterEast.sh
	 
	 end=$((SECONDS+60*$minutes))
	 while [ $SECONDS -lt $end ]; do
      read -t 1 stop;
      if [[ $stop == "s" ]]; then
       break
 	  fi
 	 done
	 #sleep "$minutes"m
	 echo ">> Stopping full water on east balcony after $((SECONDS/60)) minutes" 2>&1
	 source stopFullWaterEast.sh
	
	elif [ $channel = "sprinkle" ]; then
	 echo ">> Sprinkling east balcony for $minutes minutes" 2>&1
	 source startSprinklerEast.sh
	
	 end=$((SECONDS+60*$minutes))
	 while [ $SECONDS -lt $end ]; do
      read -t 1 stop;
      if [[ $stop == "s" ]]; then
       break
 	  fi
 	 done
	 echo ">> Stopping sprinkling east balcony after $((SECONDS/60)) minutes" 2>&1
	 source stopSprinklerEast.sh
	
	elif [ $channel = "drip" ]; then
	 echo ">> Drip-watering east balcony for $minutes minutes" 2>&1
	 source startDrippingEast.sh
	 
	 end=$((SECONDS+60*$minutes))
	 while [ $SECONDS -lt $end ]; do
     	read -t 1 stop;
       	if [[ $stop == "s" ]]; then
	      break;
 	    fi
 	 done
	 echo ">> Stopping Drip-watering on east balcony after $((SECONDS/60)) minutes" 2>&1
	 source stopDrippingEast.sh
	fi
fi

if [ $side = "west" ]; then
	 echo ">> Watering west balcony for $minutes minutes" 2>&1
	 source startWaterWest.sh 2>&1
	 
	 end=$((SECONDS+60*$minutes))
	 while [ $SECONDS -lt $end ]; do
      read -t 1 stop;
      if [[ $stop == "s" ]]; then
       break
 	  fi
 	 done
	 echo ">> Stopping watering of west balcony after $((SECONDS/60)) minutes" 2>&1
	 source stopWaterWest.sh 2>&1
fi
