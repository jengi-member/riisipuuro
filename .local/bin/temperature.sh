#!/bin/bash
temp=$(sensors | awk '/edge:/ {print $2}')

if [ "$temp" = '' ]; then
	temp=$(sensors | awk '/Core-0:/ {print $2}')
fi

if [ "$temp" = '' ]; then
	temp=$(sensors | awk '/Core 0:/ {print $3}')
fi
#temp="${temp:1}"
#temp="${temp/\.}"
#temp="${temp/0}"

value=${temp%????}

declare -i value

if [ $value -ge 101 ]; then
	icon=''
elif [ $value -ge 81 ]; then
	icon=''
elif [ $value -ge 61 ]; then
	icon=''
elif [ $value -ge 41 ]; then
	icon=''
else
	icon=''
fi

echo $icon' '$temp
