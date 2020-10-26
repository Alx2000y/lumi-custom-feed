#!/bin/sh
#Copyright (C) 2013 cyberwrt.ru, carduino.ru, cyber-place.ru, mp3car.ru
echo "Content-type: text/html; charset=utf-8"
echo
echo "<title>Терминал</title>"
echo `cat /www/menu.html`
echo "<body><table border=0>
<tr><td><form method=GET action=term.cgi target=hidden>
<input type=text name=terminal style=\"width: 100%; background-color: #f1f1f1;\" placeholder=\"Введите команду\"></td>
<td width=1 valign=top><input type=submit  style=\"font-weight: bold;\"></form></td></tr>
<tr><td colspan=2>
<iframe name=hidden src=term.cgi width=800 height=500 frameborder=0 style=\"background: black\"></iframe></td></tr>
<tr><td><b><a href=http://carduino.ru/ style=\"color: silver\">Магазин</a></td>
<td align=right><b><a href=http://cyber-place.ru/forumdisplay.php?f=44 target=_blank style=\"color: silver\">Поддержка</a></b></td></tr></table></body>"
