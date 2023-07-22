#!/bin/bash

if ! [[ -d "/sys/class/power_supply/BAT0" ]]
then
	echo ''
	exit 0
fi

charging=$(cat /sys/class/power_supply/BAT0/status)

bat=$(echo "scale=3 ; $(cat /sys/class/power_supply/BAT0/charge_now) / $(cat /sys/class/power_supply/BAT0/charge_full)" | bc)

bat=${bat:1:2}.${bat:3}

value=${bat%??}

declare -i value

if [ "$charging" = "Charging" ];then
   icon='󰂄'
elif [ $value -ge 91 ];then
	icon='󰁹'
elif [ $value -ge 82 ];then
	icon='󰂂'
elif [ $value -ge 73 ];then
	icon='󰂁'
elif [ $value -ge 64 ];then
	icon='󰂀'
elif [ $value -ge 55 ];then
	icon='󰁿'
elif [ $value -ge 45 ];then
	icon='󰁾'
elif [ $value -ge 36 ];then
	icon='󰁽'
elif [ $value -ge 27 ];then
	icon='󰁼'
elif [ $value -ge 18 ];then
	icon='󰁻'
elif [ $value -ge 9 ];then
	icon='󰁺'
else
	icon='󰂎'
fi

echo $icon' '$bat'%'

# alternative icons
#󰂎󰁺󰁻󰁼󰁽󰁾󰁿󰂀󰂁󰂂󰁹󰂃󰂄󱟦󰂑
