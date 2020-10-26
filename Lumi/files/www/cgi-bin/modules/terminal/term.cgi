#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html"
echo
if echo "$QUERY_STRING" | egrep -q "terminal=" ; then
QUERY_STRING=${QUERY_STRING//terminal=}
QUERY_STRING=${QUERY_STRING//+/ }
#echo "$QUERY_STRING"
QUERY_STRING=${QUERY_STRING//%/\\x}
echo "<font color=#00ff00>root@CyberWrt:/www/></font><font color=white> $(echo -e $QUERY_STRING)"
if [ $QUERY_STRING == "top" ] ; then
echo "<pre>`$QUERY_STRING -n1`</pre>"
`killall top`
echo "<script>onload = function () {setTimeout (\"document.location.href = 'term.cgi?terminal=top';\", 2 * 1000)}</script>"
echo "</font>"
else
rrr=$(echo -e $QUERY_STRING)
echo "<pre>`eval $rrr 2>&1`</pre></font>"
fi
else
echo "<center><pre><font color=#FFFFFF>`cat /etc/banner`<br><br>Сегодня: `date`</font></pre></center>"
fi
#rrr=$(ls /dev | egrep "tty")
#rrr=`$rrr`
#rrr=`ls /dev | egrep "tty"`
#echo "$rrr"
#echo "<pre>`$(echo $rrr 2>&1)`</pre></font>"
#echo "<pre>`$(echo -e $QUERY_STRING)`</pre>"
#echo `echo -e $QUERY_STRING`
#echo `"$rrr"`