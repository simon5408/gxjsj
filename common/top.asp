	<%
		typeVal = Request.QueryString("type")
	%>
	<div id="logo">
		<div style="border:0px solid red; margin-left:200px; margin-top:0px; width:500px;">
			<h1 style="font-size:19px; color:#2c1972; font-family:����; padding-top:16px;">��У����������γ̹���ƽ̨
			<%if typeVal = 1 then %>
				&gt;&gt; ����������γ�
			<% end if%>
			<%if typeVal = 2 then %>
				&gt;&gt; VB
			<% end if%>
			<%if typeVal = 3 then %>
				&gt;&gt; VF
			<% end if%>
			<%if typeVal = 4 then %>
				&gt;&gt; �����Ӧ�û���
			<% end if%>
			<%if typeVal = 5 then %>
				&gt;&gt; ���ݿ⼰Ӧ��
			<% end if%>
			</h1>
		</div>
	</div>
	<div id="navigation">
		<ul>
			<li><b><a href="index.asp">��&nbsp;&nbsp;&nbsp;&nbsp;ҳ</a></b></li>
			<% 
				if typeVal > 5 then
					typeVal = ""
				end if
			
			%>
			<% if typeVal = "" then %>
			<li><b><a href="kj.asp?type=1">����������γ�</a></b></li>
			<li><b><a href="kj.asp?type=2">VB</a></b></li>
			<li><b><a href="kj.asp?type=3">VF</a></b></li>				
			<li><b><a href="kj.asp?type=4">�����Ӧ�û���</a></b></li>
			<li><b><a href="kj.asp?type=5">���ݿ⼰Ӧ��</a></b></li>
			<% else %>
			<li><b><a href="kj.asp?type=<%=typeVal%>">�μ�</a></b></li>
			<li><b><a href="zyxt.asp?type=<%=typeVal%>">��ҵϰ��</a></b></li>
			<li><b><a href="ja.asp?type=<%=typeVal%>">�̰�</a></b></li>
			<li><b><a href="ckwx.asp?type=<%=typeVal%>">�ο�����</a></b></li>
			<li><b><a href="lyb.asp?type=<%=typeVal%>">���԰�</a></b></li>
			<% end if %>
			<li><b><a href="aboutus.asp">��������</a></b></li>				
		</ul>
	</div>
	
	<div id="header"></div>