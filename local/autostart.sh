#!/bin/bash

# Set tildes and ñ
setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl

# fix JAVA ISSUES
export _JAVA_AWT_WM_NONREPARENTING=1

# automount
udisksctl mount -b /dev/sdb1

# Gnome utilities
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &

# Set wallpaper
feh --bg-fill ~/Imágenes/Wallpapers/btc02.jpg &

# Start compositor
#picom --daemon &

# MPD
sleep 3 &
mpd ~/.config/mpd/mpd.conf &
