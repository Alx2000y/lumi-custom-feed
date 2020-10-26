#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
echo "<title>Установка пакетов</title><style>.selector{ /*position: fixed; top: 100px;*/ left: 30%; }
div.menu{ /*position: fixed; top:0px; width:100%; background-color:white;*/ }
.main{/*	position: absolute; top: 100px;*/ width:28%; }</style>
<div class=menu><div style=clear:left></div>
`cat /www/menu.html`<br>"
if echo "$QUERY_STRING" | egrep -q "uplfile" ; then
#uplfile=`echo "$QUERY_STRING" | sed -n 's/^.*uplfile=\([^&]*\).*$/\1/p'`
TMP_FILE="/tmp/_$$"
cat > $TMP_FILE
File=`head -n2 $TMP_FILE | grep "filename=" | sed -e "s/.*filename=\"\(.*\)\".*/\1/"`
NLINES=`wc -l $TMP_FILE | awk '{print $1}'`
head -n$(($NLINES-1)) $TMP_FILE | tail -n$((NLINES-5)) > /tmp/$File
rm -f $TMP_FILE
echo "<input id=c type=hidden value=\"`opkg install /tmp/$File 2>&1`\"><script>
alert('Файл $File загружен \n\n\n' + 'Отчет об установке:\n' + document.getElementById('c').value);
</script>"
`rm -f /tmp/$File`
//window.location.href='$SCRIPT_NAME';
fi
echo "<table><tr><form method=get action=main.cgi target=main><td>
<input type=text name=pack style=width:180px;><input type=submit value=\"Найти пакет\"></td></form><form method=get action=main.cgi target=main><td>
<input type=submit name=installed value=\"Установленные пакеты\"></td></form><form method=get action=main.cgi target=main><td>
<input type=hidden name=pack value=*><input type=submit value=\"Все доступные пакеты\"></td></form>
<form method=post action=$SCRIPT_NAME?uplfile enctype=multipart/form-data><td><input type=button value=\"Добавить пакет\" onclick=\"this.form.f.style.display='block';this.style.display='none';\">
<input id=f type=file name="uplfile" style=display:none; onchange=\"if(this.value.substring(this.value.lastIndexOf('.')+1,this.value.length).toLowerCase()!='ipk') 
 {alert('Необходимо выбрать IPK файл для загрузки!'); return;}else{this.form.s.style.display='block';}\"></td><td><input id=s type=submit value=\"Загрузть и установить\" style=display:none;></td></form></tr></table></div>"
echo "<iframe class=main name=main id=main src=main.cgi scrool=auto width=29% height=80% frameborder=no></iframe>"
echo "<iframe class=selector name=packinfo src=packinfo.cgi scrool=auto width=69% height=80% style=background-color:black></iframe>"
