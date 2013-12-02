<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from news where news_id = "&request.querystring("newsId"))
	conn.close
	set conn=nothing
	
	response.Redirect "listNews.asp?type="&request.querystring("type")
	Response.End 
	
%>