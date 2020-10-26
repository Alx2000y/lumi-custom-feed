#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
echo "<link rel=stylesheet type=text/css href=/modules/style.css>
<style>tr:hover { background: silver; }</style>"
pack=`echo "$QUERY_STRING" | sed -n 's/^.*pack=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
installed=`echo "$QUERY_STRING" | sed -n 's/^.*installed=\([^&]*\).*$/\1/p' | sed "s/%20/ /g"`
if [ -n "$pack" ] ; then
echo "<h3>Найденные пакеты:</h3><table width=100% border=0>"
install=`opkg list-installed`
for param in `opkg find "*$pack*" | awk '{ print $1 }'` ; do
echo "<tr><td><a href=packinfo.cgi?packinfo=$param target=packinfo>$param</a></td>"
if echo "$install" | egrep -q "$param" ; then
echo "<td bgcolor=#CCFFCC><a href=packinfo.cgi?packinfo=$param&action=remove target=packinfo onclick=\"return confirm('Удалить пакет $param?')\">Remove</a>"
else
echo "<td><a href=packinfo.cgi?packinfo=$param&action=install target=packinfo onclick=\"return confirm('Установить пакет $param?')\">install</a>"
fi
echo "</td></tr>"
done
echo "</table>"
elif [ -n "$installed" ] ; then
echo "<h3>Установленные пакеты:</h3><table width=100% border=0>"
for param in `opkg list-installed | awk '{ print $1 }'` ; do
echo "<tr><td><a href=packinfo.cgi?packinfo=$param target=packinfo>$param</a></td>"
echo "<td bgcolor=#CCFFCC><a href=packinfo.cgi?packinfo=$param&action=remove target=packinfo onclick=\"return confirm('Удалить пакет $param?')\">Remove</a>"
echo "</td></tr>"
done
echo "</table>"
else
if opkg update &> /dev/null
then
echo "-Пакеты обновлены!"
else
echo "ОШИБКА!<br><pre>`opkg update 2>&1`</pre><br><a href=$SCRIPT_NAME>Обновить</a>"
exit 0
fi
fi