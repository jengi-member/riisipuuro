screenconfig

xrdb ~merge -I$HOME ~/.Xresources

setterm -blank 0 -powersave off -powerdown 0
xset s off
xset s noblank
xset -dpms

while [ $(pgrep -x pipewire) == "" ]
do
	sleep 0.1
done

wireplumber &

exec dwm
