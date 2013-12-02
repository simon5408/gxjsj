<!--#include file="conn.asp" -->
<%

lyTypeName = request.form("lyTypeName")
lyTypeId = request.form("lyTypeId")
lyNo = request.form("lyNo")
lyName = request.form("lyName")
lySpec = request.form("lySpec")
lyInfo = Replace(request.form("lyInfo"), "'", "")
lyDate =  now()

exec="insert into lyb_info ( ly_type_id, ly_type_name, ly_name, ly_no, ly_spec, ly_info, ly_date) values("&lyTypeId&",'"&lyTypeName&"','"&lyName&"','"&lyNo&"','"&lySpec&"','"&lyInfo&"','"&lyDate&"')"
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('感谢你的留言，我们会尽快给你答复!');window.location.href='index.asp';</script>")
%>
