#!/usr/bin/bash

BATTERY_SYM="∂"
CLOCK_SYM="∇"
SOUND_SYM="∫"

# Define the clock
clock() {
        date '+%H:%M'
}

battery() {
    BATC=/sys/class/power_supply/BAT0/capacity
    BATS=/sys/class/power_supply/BAT0/status

    test "`cat $BATS`" = "Charging" && echo -n '+' || echo -n '-'

    echo "$(sed -n p $BATC)%"
}

#Define the sound
sound() {
	if amixer get Master | grep -q '\[off\]' 
	then
  		res="Muted"
	else
		res=$(amixer get Master | egrep -o "[0-9]+%")
	fi
	echo "$res"
}

# Bar loop
while :; do
	buf=""
	buf="${buf} %{c} %{F#c3c3c3} ●●●●● %{F-}"
	buf="${buf} %{r}%{B#c3c3c3}%{F#131313} ${SOUND_SYM} %{F-}%{B-}%{F#c3c3c3} $(sound) %{F-}%{B#c3c3c3}%{F#131313} ${CLOCK_SYM} %{F-}%{B-}%{F#c3c3c3} $(clock) %{F-}%{B#c3c3c3}%{F#131313} ${BATTERY_SYM} %{F-}%{B-}%{F#c3c3c3} $(battery) %{F-}"
        echo "$buf"
	sleep 0.1
done
