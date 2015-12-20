#!/bin/sh

#starts sxhkd for input listening
sxhkd -c ~/.sxhkdrc >/dev/null 2>&1 &

#load fonts
xset fp+ ~/.fonts
xset fp rehash

#merge all the resources
xrdb -merge ~/.Xresources

#set cursor
xsetroot -cursor_name left_ptr

#set wallpaper
feh --bg-fill ~/dotfiles/wallpapers/cartoonmoonbwnoise.png
#xsetroot -solid "#202020"

#start compton in the backgroung for alpha channel managing
compton -b

#start lemonbar
exec ~/dotfiles/lemonbar/bar.sh | lemonbar -p -d -B#00000000 -f-*-tewi-medium-*-*-*-11-*-*-*-*-*-*-* -u4 &

#start wm
exec swm
#exec sh -c 'while true; do sleep 10; done'
