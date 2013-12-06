<!--#include file="conn.asp" -->
<%
	kjType = Request.QueryString("type")
	typeTitle = ""
	if kjType =1 then
		typeTitle = "计算机基础课程"
	end if
	if kjType =2 then
		typeTitle = "VB"
	end if
	if kjType =3 then
		typeTitle = "VF"
	end if
	if kjType =4 then
		typeTitle = "计算机应用基础"
	end if
	if kjType =5 then
		typeTitle = "数据库及应用"
	end if
	
%>
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
			<%if kjType > 5 then%>
				<div style="margin-left:5px;">您输入的网址有误，请返回首页 &gt;&gt; <a href="index.asp">首页</a></div>
			<% end if %>
			<div style="font:黑体; font-size:24px; font-weight:bold;">
				“<%=typeTitle%>”参考文献
			</div>
			<div style="height:20px;"></div>
			<%
				exec="select * from upload_info where sc_type_id="&kjType&" and sc_cate_id=4"
				set rs=server.createobject("adodb.recordset")
				rs.open exec,conn,1,1 
				for i= 1 to rs.recordcount
				if rs.eof then
				exit for
				end if
			%>
			<div class="listDiv"><img src="images/jt.gif"> <a href="/admin/files/<%=rs("sc_path")%>" target="_blank"><%=rs("sc_name")%></a></div>
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