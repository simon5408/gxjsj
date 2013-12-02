<!--#include file="conn.asp" -->
<%

scName = request.form("scName")
scTypeId = cint(request.form("scTypeId"))
scTypeName = request.form("scTypeName")
scCateId = cint(request.form("scCateId"))
scCateName = request.form("scCateName")
scPath = request.form("scPath")
scDate =  now()

exec="insert into upload_info (sc_name, sc_type_id, sc_type_name, sc_cate_id, sc_cate_name, sc_path, sc_date) values('"&scName&"',"&scTypeId&",'"&scTypeName&"',"&scCateId&",'"&scCateName&"','"&scPath&"','"&scDate&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('Ìí¼Ó³É¹¦!');window.location.href='adminConsole.asp';</script>")
%>
