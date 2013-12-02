<!--#include file="conn.asp" -->
<%
lyName = request.querystring("lyName")
session("lyName") = lyName
lySpec = request.querystring("lySpec")
session("lySpec") = lySpec
lyTypeId = request.querystring("lyTypeId")
if lyTypeId = "" then
	lyTypeId = 0
end if
session("lyTypeId") = lyTypeId

sql= "select * from lyb_info where 1=1 "

' 所属用户
if  lyTypeId <> 0 then
	sql = sql + " and ly_type_id="&lyTypeId&" "
end if

'学生姓名
if lyName <> "" then
	sql =sql + " and ly_name like '%"&lyName&"%' "
end if

'学生姓名
if lySpec <> "" then
	sql =sql + " and ly_spec like '%"&lySpec&"%' "
end if

sql =sql + " order by ly_date desc "

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
				window.location.href="delLybInfo.asp?lyId="+id;
			}
		}
		
		// 条件查询
		function doSearch(){
			var lyName = document.getElementById("lyName").value;
			var lySpec = document.getElementById("lySpec").value;
			var lyTypeId = document.getElementById("lyTypeId").value;
						
			document.location.href="listLiuyanban.asp?lyName="+lyName+"&lySpec="+lySpec+"&lyTypeId="+lyTypeId;
		}
</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "留言板信息管理"
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
			<td><input type="text" name="lyName" id="lyName" value="<%=session("lyName")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">专业：</td>
			<td><input type="text" name="lySpec" id="lySpec" value="<%=session("lySpec")%>"></td>
			<td style="font-family:'幼圆', Helvetica, sans-serif;">科目：</td>
			<td>
				<select name="lyTypeId" id="lyTypeId">
					<option value="0">- 不限 -</option>
					<option value="1">计算机基础课程</option>
					<option value="2">VB</option>
					<option value="3">VF</option>
					<option value="4">计算机应用基础</option>
					<option value="5">数据库及应用</option>
				</select>
			</td>
		</tr>
	</table>
	<div class="searchBtnDiv" style="width:99.5%">
		<a href="javascript:void(0);" onclick="doSearch()" class="easyui-linkbutton" icon="icon-search">查 询</a>
	</div>
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th>学号</th>
			<th>名称</th>
			<th>专业</th>
			<th>科目</th>
			<th>留言</th>
			<th>日期</th>
			<th style="width:80px;">操作</th>
		</tr>
		
		<%
			for i= 1 to rs.recordcount
			if rs.eof then
			exit for
			end if
		%>
		<tr>
			<td><%=rs("ly_no")%></td>
			<td><%=rs("ly_name")%></td>
			<td><%=rs("ly_spec")%></td>
			<td><%=rs("ly_type_name")%></td>
			<td><%=rs("ly_info")%></td>
			<td><%=rs("ly_date")%></td>
			<td style="width:80px;">
				<a href='javascript:doDel(<%=rs("ly_id")%>)'class="easyui-linkbutton" plain="true">删除</a>
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