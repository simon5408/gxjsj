<div id="viewTop"></div>
	
<!-- 页面信息菜单 -->
<div id="infoTop">
	<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/user.gif" border="0"> <% =session("show_name") %>
			<span class="timeFont">[登录时间：<% =session("loginTime") %>]</span>
	</div>
	<div class="infoDiv" style="margin-left:8px;">
		<img src="../images/jobstp/jobtype.gif" border="0"> 功能类型
			<span class="timeFont" id="jobTypeName">[<%=session("typeName")%>]</span>
	</div>
</div>

<!-- 页面操作菜单 -->
<div id="pageTop">
	<a href="../login.asp" class="easyui-linkbutton" plain="true" icon="icon-ahead">退 出</a>
	<a href="../index.asp" class="easyui-linkbutton" plain="true" icon="icon-undo">首 页</a>
</div>

<!-- 导航操作栏 -->
<div id="tipNvg" <% if session("leftZero") <> "" then %> style="left:0;" <% end if %>>
	<table border="0" cellspacing="0" cellpadding="0">
		<tr>
			<td width="29" height="37"><img src="../images/jobstp/tip_true.png" border="0"></td>
			<td id="tipCont" height="37" background="../images/jobstp/tip_bg.gif"> <b><%=session("typeName")%></b></td>
			<td width="8" height="37"><img src="../images/jobstp/tip_right.gif" border="0"></td>
		</tr>
	</table>
	<div class="tipArrow">
		<img src="../images/jobstp/tip_arrow.gif" border="0">
	</div>
</div>