	<%
		typeVal = Request.QueryString("type")
	%>
	<div id="logo">
		<div style="border:0px solid red; margin-left:200px; margin-top:0px; width:500px;">
			<h1 style="font-size:19px; color:#2c1972; font-family:黑体; padding-top:16px;">高校计算机基础课程共享平台
			<%if typeVal = 1 then %>
				&gt;&gt; 计算机基础课程
			<% end if%>
			<%if typeVal = 2 then %>
				&gt;&gt; VB
			<% end if%>
			<%if typeVal = 3 then %>
				&gt;&gt; VF
			<% end if%>
			<%if typeVal = 4 then %>
				&gt;&gt; 计算机应用基础
			<% end if%>
			<%if typeVal = 5 then %>
				&gt;&gt; 数据库及应用
			<% end if%>
			</h1>
		</div>
	</div>
	<div id="navigation">
		<ul>
			<li><b><a href="index.asp">首&nbsp;&nbsp;&nbsp;&nbsp;页</a></b></li>
			<% 
				if typeVal > 5 then
					typeVal = ""
				end if
			
			%>
			<% if typeVal = "" then %>
			<li><b><a href="kj.asp?type=1">计算机基础课程</a></b></li>
			<li><b><a href="kj.asp?type=2">VB</a></b></li>
			<li><b><a href="kj.asp?type=3">VF</a></b></li>				
			<li><b><a href="kj.asp?type=4">计算机应用基础</a></b></li>
			<li><b><a href="kj.asp?type=5">数据库及应用</a></b></li>
			<% else %>
			<li><b><a href="kj.asp?type=<%=typeVal%>">课件</a></b></li>
			<li><b><a href="zyxt.asp?type=<%=typeVal%>">作业习题</a></b></li>
			<li><b><a href="ja.asp?type=<%=typeVal%>">教案</a></b></li>
			<li><b><a href="ckwx.asp?type=<%=typeVal%>">参考文献</a></b></li>
			<li><b><a href="lyb.asp?type=<%=typeVal%>">留言板</a></b></li>
			<% end if %>
			<li><b><a href="aboutus.asp">关于我们</a></b></li>				
		</ul>
	</div>
	
	<div id="header"></div>