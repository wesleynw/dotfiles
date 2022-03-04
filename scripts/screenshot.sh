#!/bin/bash
FILENAME="Screenshot_$(date +%Y%m%d-%s).png"

if [[ "$#" -ne 0 && $1 == "-s" ]]; then
	/usr/bin/maim -s --bordersize=5 ~/Pictures/$FILENAME
else
	/usr/bin/maim --bordersize=5 ~/Pictures/$FILENAME
fi

if [[ $? == 0 ]]
then
	/usr/bin/notify-send "Screenshot Saved as $FILENAME" &
fi
