<!--#include file="conn.asp" -->
<%
	conn.execute ("delete * from upload_info where sc_id = "&request.querystring("scId"))
	conn.close
	set conn=nothing
	
	response.Redirect "listUploadFile.asp?cate="&request.querystring("cate")
	Response.End 
	
%>