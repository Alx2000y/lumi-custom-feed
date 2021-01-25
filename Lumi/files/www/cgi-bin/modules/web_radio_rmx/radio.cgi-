#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
station=`echo "$QUERY_STRING" | sed -n 's/^.*station=\([^&]*\).*$/\1/p' | sed "s/%3A/:/g" | sed "s/%2F/\//g"`
vol=`echo "$QUERY_STRING" | sed -n 's/^.*vol=\([^&]*\).*$/\1/p'`
ivol=$(($vol+50))
stop=`echo "$QUERY_STRING" | sed -n 's/^.*stop=\([^&]*\).*$/\1/p'`
echo "<FONT color=979797 size=6>Громкость: $ivol</FONT>"
killall madplay
`killall radio.cgi & wget -O - $station | madplay --attenuate=$vol - -Q --no-tty-control &`


