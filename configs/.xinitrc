#!/bin/sh
#setxkbmap -option terminate:ctrl_alt_bksp

setxkbmap gb & 
xset r rate 250 25 & xrandr --dpi 96 &
#feh -g 2048x1152 -F files/wallpapers/anime-squares.jpg &

ARG=$1

# specify the default argument here:
DEFAULTWM="openbox-settings"

if [ ! $ARG ]; then
	ARG=$DEFAULTWM
fi

if [ $ARG = "wmii" ]; then
	WM=wmii
elif [ $ARG = "dwm" ]; then
	WM=dwm
elif [ $ARG = "xmonad" ]; then
    WM=xmonad
else
	WM=$DEFAULTWM
fi

exec ck-launch-session $WM &> ~/files/console

