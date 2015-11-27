#!/bin/sh

sxhkd -c .sxhkdrc >/dev/null 2>&1 &

xrdb -merge .Xresources

xsetroot -cursor_name left_ptr
xsetroot -solid "#202020"

exec swm
