<!--#include file="conn.asp" -->
<%

typeId = cint(request.form("typeId"))
newsTitle = request.form("newsTitle")
newsInfo = Replace(request.form("newsInfo"), "'", "")
newsDate =  now()

exec="insert into news (type_id, news_title, news_info, news_date) values("&typeId&",'"&newsTitle&"','"&newsInfo&"','"&newsDate&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('Ìí¼Ó³É¹¦!');window.location.href='adminConsole.asp';</script>")
%>
