<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/header.asp" -->
</head>

<body>
<div id="container">
	<div id="holder" class="clearfix">
		<!-- 底部操作菜单栏 -->
		<!--#include file="common/top.asp" -->
		<div id="content" style="width: 748px; min-height: 481px;">
			<div style="font:黑体; font-size:24px; font-weight:bold;">
				在线咨询平台<span style="margin-right:0; font-size:16px; float:right; font-weight:normal; color:#0000FF">没有找到答案，请【<a href="lyb.asp"><b>留言</b></a>】</span>
			</div>
			<div style="height:20px;"></div>
			<%
				exec="select * from lyb_info"
				set rs=server.createobject("adodb.recordset")
				rs.open exec,conn,1,1 
				for i= 1 to rs.recordcount
				if rs.eof then
				exit for
				end if
				
				lyReply = rs("ly_reply")
				if isnull(lyReply) or lyReply = "" then
					lyReply = "[请耐心等待，尽快给你答复]"
				end if
				
				lyReplyDate = rs("ly_rp_date")
				if isnull(lyReplyDate) or lyReplyDate = "1970/1/1" then
					lyReplyDate = "-"
				end if
			%>
			<div class="lybContent">
				<div class="lybZX">
					<div><b>咨询姓名：</b><%=rs("ly_name")%></div>
					<div><b>学号：</b><%=rs("ly_no")%></div>
					<div><b>科目：</b><%=rs("ly_type_name")%></div>
					<div><b>日期：</b><%=rs("ly_date")%></div>
				</div>
				<div class="lybDF"><b>咨询内容：</b><%=rs("ly_info")%></div>
				<div class="lybZX" style="border-top:1px dotted #909090;"><b>答复时间：</b><%=lyReplyDate%></div>
				<div class="lybDF"><b>答复内容：</b><%=lyReply%></div>
			</div>
			<% 
				rs.movenext
				next 
			%>
			
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