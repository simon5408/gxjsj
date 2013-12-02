<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from lyb_info where ly_id = "&request.querystring("lyId"))
	conn.close
	set conn=nothing
	
	response.Redirect "listLiuyanban.asp"
	Response.End 
	
%>