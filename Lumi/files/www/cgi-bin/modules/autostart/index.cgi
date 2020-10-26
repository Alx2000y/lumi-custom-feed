#!/bin/sh
#Copiright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
echo "<title>Автозагрузка</title>`cat /www/menu.html`"
script=$(echo -e $(echo "$QUERY_STRING" | sed -n "s/^.*script=\([^&]*\).*$/\1/p" | sed "s/+/ /g" |sed -e 's/%\(\)/\\\x/g'))
act=`echo "$QUERY_STRING" | sed -n 's/^.*act=\([^&]*\).*$/\1/p'`
string=`echo "$QUERY_STRING" | sed -n 's/^.*string=\([^&]*\).*$/\1/p'`
rcloc="/etc/rc.local"
rel="<script>window.location.href=\"$SCRIPT_NAME\"</script>"
if echo "$QUERY_STRING" | egrep -q "addtask" && [ -n "$script" ]; then
`sed -i 1i\ "$script" $rcloc`
echo $rel
fi
case "$act" in
"remove" )
`sed -i "$string"d $rcloc`
echo $rel;;
"start" )
`sed -i "$string i$script" $rcloc`
let string=string+1
`sed -i "$string"d $rcloc`
echo $rel;;
"stop" )
sed -i "$string s/^/#/" $rcloc
echo $rel;;
esac
echo "<h2>Автозагрузка</h2><h3>Список скриптов в rc.local</h3>"
tab="<table><tr style=background:#667;color:#fff;><td>Путь к скрипту</td><td>Действие</td>"
echo "$tab<td>Удалить?</td></tr>"
i=1
cat /etc/rc.local |
while read CMD; do
if echo "$CMD" | egrep -q "exit 0" ; then
break
fi
if echo "$CMD" | egrep -q -v "#" ; then
act="stop" ro="readonly" cl="#CCCCFF" dis="disabled" s="Остановить"
else
CMD=`echo "$CMD" | sed 's/#//g'`
act="start" cl="#CCCCCC" ro="" dis="" s="Запустить"
fi
echo "<form action=$SCRIPT_NAME method=GET><tr bgcolor=$cl><input type=hidden name=string value=$i><td><input type=text size=100 id=script name=script $ro value=\"`echo $CMD | sed 's/"/\&quot;/g'`\"></td>
<td><button type=subbmit name=act value=$act onClick=\"javascript:return conf('$s', '$CMD') ? true : false;\" style=background-color:$cl>$act</button></td><td align=center><button type=subbmit $dis onClick=\"javascript:return conf('Удалить', '$CMD') ? true : false;\" name=act value=remove style=background-color:$cl>удалить</button></td></tr></form>"
let i=i+1
done
echo "</table><br><h3>Добавить скрипт в rc.local</h3><form action=$SCRIPT_NAME method=GET>$tab</tr><tr bgcolor=#FFFFCC><td align=center><input name=script id=sc type=text size=100></td>
<td><button type=subbmit name=addtask onClick=\"javascript:return conf('Добавить', document.getElementById('sc').value) ? true : false;\">Добавить</button></td></tr></table></form>
<script>function conf(a,b){ var z = ' (' + b + ')?'; var x = a + z; if(confirm(x)){return true}; }</script>"