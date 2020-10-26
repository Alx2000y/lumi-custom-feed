#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
packinfo=`echo "$QUERY_STRING" | sed -n 's/^.*packinfo=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
action=`echo "$QUERY_STRING" | sed -n 's/^.*action=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
if [ -n "$packinfo" ] & [ -z "$action" ] ; then
echo "<font color=white><pre>`opkg info $packinfo`</pre></font>"
elif [ "$action" == "install" ] ; then
echo "<font color=white><pre>`opkg install $packinfo 2>&1`</pre></font>
<script>top.frames['main'].location.href='main.cgi?pack=$packinfo'; return false</script>"
elif [ "$action" == "remove" ] ; then
echo "<font color=white><pre>`opkg remove $packinfo 2>&1`</pre></font>
<script>top.frames['main'].location.href='main.cgi?pack=$packinfo'; return false</script>"
fi
