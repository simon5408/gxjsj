<!--#include file="conn.asp" -->
<%
specId = request.form("specId")
specName = request.form("specName")
eduId = request.form("eduId")
eduname = request.form("eduname")

exec="update special set spec_name='"&specName&"',edu_id="&eduId&",edu_name='"&eduname&"' where spec_id= "&specId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('专业信息编辑成功!');window.location.href='listSpecName.asp';</script>")
'response.Redirect "adminConsole.asp"
%>