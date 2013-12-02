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
		<div id="content" style="width: 490px;">
			<h1>教学资源整合、共建共享教学平台</h1>
			<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
			高校计算机基础课程共享平台是由江西科技学院数字技术系共建共享的资源平台，汇集了计算机基础课程的教育教学资源，免费为广大的教师服务。</p>
			<div class="indexTitleDiv"> 计算机基础课程</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=1">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 本书是一本电脑入门教程，充分地考虑到了电脑初学者的需求，并通过言简意赅的表在形工资地有关电脑硬件和软件的基础知识及操作介绍给读者...</a></div>
			<div class="indexTitleDiv"> Visual Basic课程</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=2">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本书Visual Basic是Microsoft公司推出的一个集成开发环境，具有简单易学、功能强大、软件费用支出低、见效快等特点...</a></div>
			<div class="indexTitleDiv"> Visual FoxPro课程</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=3">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本书Visual FoxPro简称VFP，是Microsoft公司推出的数据库开发软件，用它来开发数据库，既简单又方便...</a></div>
			<div class="indexTitleDiv"> 计算机应用基础</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=4">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结合目前计算机及信息技术发展的现状，以高职高专学生信息素质的培养为切入点，精心设置课程内容，突出案例教学...</a></div>
			<div class="indexTitleDiv"> 数据库及应用</div>
			<div class="indexBodyDiv"><a href="kj.asp?type=5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;本书对数据库设计与开发的方法及全过程等也用具体实例进行了介绍。书中内容的选取、概念的引入、文字的叙述都力求遵循面向应用、重视实...</a></div>
		</div>
		<div id="news">
			<div class="adDiv">
				通知公告
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
				信息动态
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
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/footer.asp" -->
</div>

</body></html>