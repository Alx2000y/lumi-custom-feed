#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
station=`echo "$QUERY_STRING" | sed -n 's/^.*station=\([^&]*\).*$/\1/p' | sed "s/%3A/:/g" | sed "s/%2F/\//g"`
vol=`echo "$QUERY_STRING" | sed -n 's/^.*vol=\([^&]*\).*$/\1/p'`
ivol=$(($vol+50))
stop=`echo "$QUERY_STRING" | sed -n 's/^.*stop=\([^&]*\).*$/\1/p'`
avol=$(($ivol*2))
echo "<FONT color=979797 size=6>Громкость: $ivol</FONT>"
killall mpg123
`killall radio.cgi & amixer -c 0 sset Master,0 Playback Volume $avol  & mpg123 $station &`


