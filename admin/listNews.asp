<!--#include file="conn.asp" -->
<%
newsTitle = request.querystring("newsTitle")
session("newsTitle") = newsTitle

sql= "select * from news where type_id= "&request.querystring("type")

'学生姓名
if newsTitle <> "" then
	sql =sql + " and news_title like '%"&newsTitle&"%' "
end if

sql =sql + " order by news_date desc "

exec=sql
set rs=server.createobject("adodb.recordset")
rs.open exec,conn,1,1 
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		// 删除学生信息
		function doDel(id){
			if(confirm("确定要删除该信息？")){
				window.location.href="delNews.asp?newsId="+id+"&type="+<%=request.querystring("type")%>;
			}
		}
		
		// 条件查询
		function doSearch(){
			var newsTitle = document.getElementById("newsTitle").value;
						
			document.location.href="listNews.asp?newsTitle="+newsTitle+"&type="+<%=request.querystring("type")%>;
		}
</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "新闻信息管理"
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<div id="tbleDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">名称：</td>
			<td><input type="text" name="newsTitle" id="newsTitle" value="<%=session("newsTitle")%>"></td>
		</tr>
	</table>
	<div class="searchBtnDiv" style="width:99.5%">
		<a href="javascript:void(0);" onclick="doSearch()" class="easyui-linkbutton" icon="icon-search">查 询</a>
	</div>
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th>序号</th>
			<th>新闻名称</th>
			<th>发布日期</th>
			<th style="width:80px;">操作</th>
		</tr>
		
		<%
			for i= 1 to rs.recordcount
			if rs.eof then
			exit for
			end if
		%>
		<tr>
			<td><%=rs("news_id")%></td>
			<td><%=rs("news_title")%></td>
			<td><%=rs("news_date")%></td>
			<td style="width:80px;">
				<a href='showNews.asp?newsId=<%=rs("news_id")%>'class="easyui-linkbutton" plain="true">预览</a>
				<a href='javascript:doDel(<%=rs("news_id")%>)'class="easyui-linkbutton" plain="true">删除</a>
			</td>
		</tr>
		<% 
			rs.movenext
			next 
		%>
	</table>
	</div>
	<!-- 主体功能区(结束) -->
	</div>
<%
	conn.close
	set conn=nothing
%>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>