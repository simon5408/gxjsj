<!--#include file="conn.asp" -->
<%
lyId = request.form("lyId")
lyReply = request.form("lyReply")
lyReplyDate = now()
lyRpStatus = 1

exec="update lyb_info set ly_reply='"&lyReply&"',ly_rp_status="&lyRpStatus&",ly_rp_date='"&lyReplyDate&"' where ly_id= "&lyId&""
conn.execute exec
conn.close
set conn=nothing
response.write("<script language=javascript>alert('´ð¸´³É¹¦!');window.location.href='listLiuyanban.asp';</script>")
'response.Redirect "adminConsole.asp"
%>