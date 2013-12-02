<!--#include file="conn.asp" -->
<%
exec="select * from special"
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>