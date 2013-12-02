<!--#include file="conn.asp" -->
<%
scName = request.querystring("scName")
session("scName") = scName
scTypeId = request.querystring("scTypeId")
if scTypeId = "" then
	scTypeId = 0
end if
session("scTypeId") = scTypeId

sql= "select * from upload_info where sc_cate_id="&request.querystring("cate")

' 所属用户
if  scTypeId <> 0 then
	sql = sql + " and sc_type_id="&scTypeId&" "
end if

'学生姓名
if scName <> "" then
	sql =sql + " and sc_name like '%"&scName&"%' "
end if
sql =sql + " order by sc_type_id desc "

exec=sql
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>