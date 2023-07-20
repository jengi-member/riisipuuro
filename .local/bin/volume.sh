#!/bin/bash

declare -i vol=$(pamixer --get-volume)

if [ $vol -ge 51 ]; then
	icon='󰕾'
elif [ $vol -ge 1 ]; then
	icon='󰖀'
else
	icon='󰕿'
fi

if [ "$(pamixer --get-mute)" = "true" ];then
	icon='󰝟'
fi

echo $icon' '"$vol"'%'
