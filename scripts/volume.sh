#!/bin/bash
# volume.sh

# Arbitrary but unique message tag
msgTag="myvolume"

# Change the volume using alsa(might differ if you use pulseaudio)
case $1 in 
	up)
		#pactl set-sink-mute @DEFAULT_SINK@  false ; pactl set-sink-volume @DEFAULT_SINK@ +10%
		pamixer -u
		pamixer -i 5
		;;
	down)
		#pactl set-sink-mute @DEFAULT_SINK@ false ; pactl set-sink-volume @DEFAULT_SINK@ -10%
		pamixer -u
		pamixer -d 5
		;;
	mute)
		# toggle
		#pactl set-sink-mute @DEFAULT_SINK@ toggle
		pamixer -t
		;;
esac

# Query amixer for the current volume and whether or not the speaker is muted
#volume="$(amixer -c 0 get Master | tail -1 | awk '{print $4}' | sed 's/[^0-9]*//g')"
volume="$(pamixer --get-volume)"
mute="$(pamixer --get-mute)"
echo "deez nuts"

if [[ $1 -ne "mute" || $mute == "false" ]]; then
	dunstify -a "changeVolume" -u low -i audio-volume-high -h string:x-dunst-stack-tag:$msgTag \
    	-h int:value:"$volume" "Volume: ${volume}%"
else 
	dunstify -a "changeVolume" -u low -i audio-volume-muted -h string:x-dunst-stack-tag:$msgTag "Volume muted" 
fi
