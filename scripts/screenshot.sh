#!/bin/bash
FILENAME="Screenshot_$(date +%Y%m%d-%s).png"
echo $FILENAME

if [[ "$#" -ne 0 && $1 == "-s" ]]; then
	/usr/bin/maim -s ~/Pictures/$FILENAME
else
	/usr/bin/maim ~/Pictures/$FILENAME
fi
/usr/bin/notify-send "Screenshot Saved as $FILENAME" &

