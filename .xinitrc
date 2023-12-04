#!/bin/sh
#
#

# awesomewm fix
export PATH="${PATH}:/home/ben/bin"

# Alacritty fix
if [ "$(hostname)" = "zen" ]; then
  export WINIT_X11_SCALE_FACTOR=1.25
fi

# Java fix
wmname Sawfish

# Wallpaper
(feh --bg-scale ~/.config/awesome/themes/solbn/wallpapers/wallpaper.jpg) &

# Transparency
picom -b -f --xrender-sync-fence

# Change X shaped default cursor
xsetroot -cursor_name left_ptr
# Hide mouse cursor
(sleep 5 && unclutter --timeout 20 --root) &
# Move mouse
(sleep 0.2 && xdotool mousemove 256 256) &

# Screensaver 30m
(sleep 5 && xset s 1800 1800 ) &
# DPMS 30m
(sleep 5 && xset dpms 1800 1800 1800) &

# Terminal
(sleep 1 && alacritty) &
(sleep 1 && alacritty) &

exec dbus-launch awesome
