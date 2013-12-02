<!--#include file="conn.asp" -->
<%
specName = request.form("specName")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="insert into special(spec_name,edu_id,edu_name) values('"&specName&"',"&eduId&",'"&eduname&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('专业信息添加成功!');window.location.href='addSpecName.asp';</script>")
%>