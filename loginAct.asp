<%
username=request.form("username")
password=request.form("password")
dim exec2,conn2,rs2
exec2="select * from user_info where (username='"&username&"' and paswrd='"&password&"')"
dbpath=server.mappath("data/console.mdb")  
set conn2=server.createobject("adodb.connection")  
conn2.open "provider=microsoft.jet.oledb.4.0;data source=" & dbpath
set rs2=server.createobject("adodb.recordset")
rs2.open exec2,conn2,1,1

if not rs2.eof then
session("username") = request.form("username")
userId = rs2("user_id")
session("user_id") = userId
showName = rs2("show_name")
session("show_name") = showName
session("loginTime") = now()
rs2.Close
conn2.Close
response.Redirect "admin/adminConsole.asp"
else
response.write("<script language=javascript>alert('用户名不存在或者密码错误,请重新输入!');history.go(-1);</script>")
rs2.Close
conn2.Close
set conn2=nothing
end if
%>
