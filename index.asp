<!--#include file="conn.asp" -->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- �ײ������˵��� -->
	<!--#include file="common/header.asp" -->
</head>

<body>
<div id="container">
	<div id="holder" class="clearfix">
		<!-- �ײ������˵��� -->
		<!--#include file="common/top.asp" -->
		<div id="content" style="width: 490px;">
			<h1>��ѧ��Դ���ϡ����������ѧƽ̨</h1>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			��У����������γ̹���ƽ̨���ɽ����Ƽ�ѧԺ���ּ���ϵ�����������Դƽ̨���㼯�˼���������γ̵Ľ�����ѧ��Դ�����Ϊ���Ľ�ʦ����</p>
			<div class="indexTitleDiv"> ����������γ�</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ������һ���������Ž̳̣���ֵؿ��ǵ��˵��Գ�ѧ�ߵ����󣬲�ͨ���Լ�����ı����ι��ʵ��йص���Ӳ��������Ļ���֪ʶ���������ܸ�����...</a></div>
			<div class="indexTitleDiv"> Visual Basic�γ�</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Visual Basic��Microsoft��˾�Ƴ���һ�����ɿ������������м���ѧ������ǿ���������֧���͡���Ч����ص�...</a></div>
			<div class="indexTitleDiv"> Visual FoxPro�γ�</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;����Visual FoxPro���VFP����Microsoft��˾�Ƴ������ݿ⿪��������������������ݿ⣬�ȼ��ַ���...</a></div>
			<div class="indexTitleDiv"> �����Ӧ�û���</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;���Ŀǰ���������Ϣ������չ����״���Ը�ְ��רѧ����Ϣ���ʵ�����Ϊ����㣬�������ÿγ����ݣ�ͻ��������ѧ...</a></div>
			<div class="indexTitleDiv"> ���ݿ⼰Ӧ��</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;��������ݿ�����뿪���ķ�����ȫ���̵�Ҳ�þ���ʵ�������˽��ܡ��������ݵ�ѡȡ����������롢���ֵ�������������ѭ����Ӧ�á�����ʵ...</a></div>
		</div>
		<div id="news">
			<div class="adDiv">
				֪ͨ����
			</div>
			
			<div class="newsItem" style="height:193px;">
					<%
						exec1="select * from news where type_id=1"
						set rs1=server.createobject("adodb.recordset")
						rs1.open exec1,conn,1,1
						for i= 1 to 4
						if rs1.eof then
						exit for
						end if
					%>
					<p><a href="showNews.asp?newsId=<%=rs1("news_id")%>"><%=i%>.&nbsp;<%=rs1("news_title")%></a> </p>
					<% 
						rs1.movenext
						next 
					%>
			</div>
			<div class="adDiv">
				��Ϣ��̬
			</div>
			<div class="newsItem" style="height:193px;">
				<%
						exec2="select * from news where type_id=2"
						set rs2=server.createobject("adodb.recordset")
						rs2.open exec2,conn,1,1
						for i= 1 to 4
						if rs2.eof then
						exit for
						end if
					%>
					<p><a href="showNews.asp?newsId=<%=rs2("news_id")%>"><%=i%>.&nbsp;<%=rs2("news_title")%></a> </p>
					<% 
						rs2.movenext
						next 
					%>
			</div>
	  </div>
	</div>
	<!-- �ײ������˵��� -->
	<!--#include file="common/footer.asp" -->
</div>

</body></html>