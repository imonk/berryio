#!/bin/bash

FLAGFILE=/var/run/sendUpEmail
DATE=`date '+%Y-%m-%d %H:%M:%S'`

case "$IFACE" in
    lo)
        # The loopback interface does not count.
        # only run when some other interface comes up
        exit 0
        ;;
    *)
        ;;
esac

#if [ -e $FLAGFILE ]; then
#    exit 0
#else
#    touch $FLAGFILE
#fi

GPIOS="$(ls /sys/class/gpio/)"
echo -e "Subject: gardenPi connected at $DATE \r\n\r\n GPIOS: $GPIOS  \r\n cron: \r\n$(crontab -u pi -l)" | msmtp toerst@gmail.com