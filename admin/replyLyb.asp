<!--#include file="conn.asp" -->
<%
	Idx = Request.QueryString("lyId")
	exec="select * from lyb_info where (ly_id="&Idx&")"
	set rs=server.createobject("adodb.recordset")
	rs.open exec,conn,1,1 
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			var lyReply = $("#lyReply").val();
			if($.trim(lyReply) == ""){
				alert("不能答复空信息！");
				$("#lyReply").focus();
				$("#lyReply").addClass('errInpt');
				return false;
			}else{
				$("#lyReply").removeClass('errInpt');
			}
			
			document.editSpecName.submit();
		}

	</script>

</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "答复留言"
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<form  name="editSpecName" method="post" action="replyLybAct.asp">
	<input type="hidden" name="lyId" value="<%=Idx%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="100" height="50" align="right">学号：</th>
			<td width="" align="left"><%=rs("ly_no")%></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">姓名：</th>
			<td width="" align="left"><%=rs("ly_name")%></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">科目：</th>
			<td width="" align="left"><%=rs("ly_type_name")%></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">留言：</th>
			<td width="" align="left"><%=rs("ly_info")%></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">日期：</th>
			<td width="" align="left"><%=rs("ly_date")%></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">答复：</th>
			<td width="" align="left"><textarea name="lyReply" id="lyReply" rows="20" cols="80"></textarea></td>
		</tr>
		
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">保 存</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">刷 新</a>
		<a href="listLiuyanban.asp" class="easyui-linkbutton" icon="icon-back">返 回</a>
	</div>
	</form>
	<!-- 主体功能区(结束) -->
	</div>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>