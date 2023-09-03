screenconfig

xrdb ~merge -I$HOME ~/.Xresources

setterm -blank 0 -powersave off -powerdown 0
xset s off
xset s noblank
xset -dpms

exec dwm
