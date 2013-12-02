<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("newsId")
	exec="select * from news where news_id="&Idx&""
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/header.asp" -->
	<style type="text/css">
	body{overflow:auto;}
	</style>
</head>

<body>
<div id="container">
	<div id="holder" class="clearfix">
		<!-- 底部操作菜单栏 -->
		<!--#include file="common/top.asp" -->
		<div id="content" style="width: 748px; min-height: 481px;">
			<div style="height:45px; padding-top:5px; font-family:黑体; font-size:24px; text-align:center; font-weight:bold;border:1px solid #c0c0c0; border-bottom: 0px; background-color:f0f0f0;"><%=rs("news_title")%></div>
			<div style="height:25px; border:1px solid #c0c0c0; background-color:#dfdfdf; text-align:right">发布日期：<%=rs("news_date")%></div>
			<div style="border:1px solid #c0c0c0; border-top: 0px;">
				<div class="listDiv" style="height:auto">
				<%=rs("news_info")%>
				</div>
			</div>
		</div>
	</div>
	<%
		conn.close
		set conn=nothing
	%>
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/footer.asp" -->
</div>

</body></html>