#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo 
echo "<title>RADIO</title>"
echo "<script type="text/javascript">function startTime(){ var tm=new Date(); var h=tm.getHours(); var m=tm.getMinutes(); var s=tm.getSeconds(); m=checkTime(m); s=checkTime(s);document.getElementById('txt').innerHTML=h+":"+m+":"+s; t=setTimeout('startTime()',500); }
function checkTime(i){ if (i<10) { i="0" + i;} return i; } </script>" 
echo "<div class="header"><b><span id="txt"></span> </b>| Интернет Радио</div>" 

if [ -f /tmp/install.sh ]; then
echo "<pre>`sh /tmp/install.sh`</pre>"
rm -f /tmp/install.sh
fi
if echo "$QUERY_STRING" | egrep -q "station=" ; then
echo -e `echo "$QUERY_STRING" | awk '{print$1}' |sed -e 's/%\(\)/\\\x/g'|sed 's/+/ /g' | sed "s/station=//g" | sed "s/&url=/ /g"` >>  /www/modules/web_radio_rmx/list.radio
echo "<script>window.location.href=\"$SCRIPT_NAME\"</script>"
fi
if echo "$QUERY_STRING" | egrep -q "del=" ; then
QUERY_STRING=${QUERY_STRING//del=}
#QUERY_STRING=`echo "$QUERY_STRING" | sed "s/\//\//g"`
echo $QUERY_STRING
`sed -i "$QUERY_STRING"d /www/modules/web_radio_rmx/list.radio` 
echo "<script>window.location.href=\"$SCRIPT_NAME\"</script>"
fi
echo "<style>
input[type='range']{-webkit-appearance: none; 
margin: 13px;
background-color:#dfdfdf;
);
height: 50px; 
width: 480px; 
border-radius: 20px;
border: 2px solid #000;
box-shadow: 0px 0px 15px 0px rgba(50, 50, 50, 0.8);}
input[type=range]::-webkit-slider-thumb{-webkit-appearance: none;
width: 30px; 
height: 50px; 
background: #979797;
border: 2px;
border-color: #000;
-webkit-border-radius: 8px; 
border-radius: 8px;}
input[type="radio"]{display:none;}
input[type='radio']:checked + label span{background: url(/modules/web_radio_rmx/checkbox.png) no-repeat 0 -32px;}
input[type='radio'] + label span {display:inline-block;width:32px;height:32px;margin:1px 6px 4px 0;vertical-align:middle;background: url(/modules/web_radio_rmx/checkbox.png) no-repeat 0px 0px;cursor:pointer;}
</style>
<script>
window.addEventListener('DOMContentLoaded', function(){
vol.addEventListener('touchend', function(event){
event.preventDefault();
document.getElementById('UartForm').submit();
}, false);
}, false);
function conf(a, b){
if ( a !== '' && b !== '' ) { return confirm('Добавить станцию ' + a + '?')? true : false; } else { alert('Не заполненые необходимые поля'); }
return false;
;}
</script>"
echo "<iframe width=600 height=50 scrolling=no name=radio src=\"radio.cgi\" frameborder=no></iframe><form action=radio.cgi method=GET id=UartForm target=radio>
<input type=range id=vol name=vol min=-49 max=-10 step=1 value=-40 onClick=\"javascript:document.getElementById('UartForm').submit()\">
<div class="stitched"><table class="radiotabstyle"><tr><th><input type=radio id=0 name=station value=CyberWrt.ru/radio onClick=\"javascript:document.getElementById('UartForm').submit()\" checked><label for=0><span></span>Выключить</label></th></tr></div>"
i=1
cat /www/modules/web_radio_rmx/list.radio |
while read CMD; do
echo "<tr><td><input type=radio id=$i name=station value=`echo $CMD | awk '{print$2}'` onClick=\"javascript:document.getElementById('UartForm').submit()\"><label for=$i><span></span>`echo $CMD | awk '{print$1}'`</label></td><td></td><td><a href=$SCRIPT_NAME?del=$i onClick=\"return confirm('Удалить `echo $CMD | awk '{print$1}'` ?');\"><img src=/modules/web_radio_rmx/del.png></a></td></tr>"
let i=i+1
done;
echo "</table></form>
<form action=$SCRIPT_NAME method=GET><input type=text id=stn name=station placeholder=\"Введите название (Бизнес_FM)\" size=35><input type=text id=url name=url placeholder=\"Введите ссылку (http://bfmstream.bfm.ru:8004/fm)\" size=35><button type=submit onclick=\"var a = document.getElementById('stn').value; var b = document.getElementById('url').value; return conf( a, b );\">Добавить</button></font></div>"
echo `cat /www/menu.html`
