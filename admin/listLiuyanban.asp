<!--#include file="conn.asp" -->
<%
lyName = request.querystring("lyName")
session("lyName") = lyName
lyRpStatus = request.querystring("lyRpStatus")
if lyRpStatus = "" or lyRpStatus="-99" then
	lyRpStatus = -99
end if
session("lyRpStatus") = lyRpStatus
lyTypeId = request.querystring("lyTypeId")
if lyTypeId = "" or lyTypeId="-99" then
	lyTypeId = -99
end if
session("lyTypeId") = lyTypeId

sql= "select * from lyb_info where 1=1 "

if  lyRpStatus <> -99 then
	sql = sql + " and ly_rp_status="&lyRpStatus&" "
end if

if  lyTypeId <> -99 then
	sql = sql + " and ly_type_id="&lyTypeId&" "
end if

'ѧ������
if lyName <> "" then
	sql =sql + " and ly_name like '%"&lyName&"%' "
end if

sql =sql + " order by ly_rp_status asc "

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
		// ɾ��ѧ����Ϣ
		function doDel(id){
			if(confirm("ȷ��Ҫɾ������Ϣ��")){
				window.location.href="delLybInfo.asp?lyId="+id;
			}
		}
		
		// ������ѯ
		function doSearch(){
			var lyName = document.getElementById("lyName").value;
			var lyRpStatus = document.getElementById("lyRpStatus").value;
			var lyTypeId = document.getElementById("lyTypeId").value;
						
			document.location.href="listLiuyanban.asp?lyName="+lyName+"&lyRpStatus="+lyRpStatus+"&lyTypeId="+lyTypeId;
		}
</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "���԰���Ϣ����"
%>
	<!-- ͷ�������˵��� -->
	<!--#include file="top.asp" -->

	<!-- ��߲����� -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- ���幦����(��ʼ) -->
	<div id="tbleDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">���ƣ�</td>
			<td><input type="text" name="lyName" id="lyName" value="<%=session("lyName")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">�Ƿ�𸴣�</td>
			<td>
				<select name="lyRpStatus" id="lyRpStatus">
					<option value="-99">- ���� -</option>
					<option value="0"<% if session("lyRpStatus") = 0 then%>selected<%end if%>>δ��</option>
					<option value="1"<% if session("lyRpStatus") = 1 then%>selected<%end if%>>�Ѵ�</option>
				</select>
			</td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��Ŀ��</td>
			<td>
				<select name="lyTypeId" id="lyTypeId">
					<option value="-99">- ���� -</option>
					<option value="1"<% if session("lyTypeId") = 1 then%>selected<%end if%>>����������γ�</option>
					<option value="2"<% if session("lyTypeId") = 2 then%>selected<%end if%>>VB</option>
					<option value="3"<% if session("lyTypeId") = 3 then%>selected<%end if%>>VF</option>
					<option value="4"<% if session("lyTypeId") = 4 then%>selected<%end if%>>�����Ӧ�û���</option>
					<option value="5"<% if session("lyTypeId") = 5 then%>selected<%end if%>>���ݿ⼰Ӧ��</option>
				</select>
			</td>
		</tr>
	</table>
	<div class="searchBtnDiv" style="width:99.5%">
		<a href="javascript:void(0);" onclick="doSearch()" class="easyui-linkbutton" icon="icon-search">�� ѯ</a>
	</div>
	<table width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th>ѧ��</th>
			<th>����</th>
			<th>��Ŀ</th>
			<th>����</th>
			<th>��������</th>
			<th>��</th>
			<th>������</th>
			<th style="width:80px;">����</th>
		</tr>
		
		<%
			for i= 1 to rs.recordcount
			if rs.eof then
			exit for
			end if
			
			lyReply = rs("ly_reply")
			if isnull(lyReply) or lyReply = "" then
				lyReply = "-"
			end if
			
			lyReplyDate = rs("ly_rp_date")
			if isnull(lyReplyDate) or lyReplyDate = "1970/1/1" then
				lyReplyDate = "-"
			end if
		%>
		<tr <% if rs("ly_rp_status") = 1 then %> style="font-weight:bold;"<%end if%>>
			<td><%=rs("ly_no")%></td>
			<td><%=rs("ly_name")%></td>
			<td><%=rs("ly_type_name")%></td>
			<td><%=rs("ly_info")%></td>
			<td><%=rs("ly_date")%></td>
			<td><%=lyReply%></td>
			<td><%=lyReplyDate%></td>
			<td style="width:80px; font-weight:normal;">
				<a href='replyLyb.asp?lyId=<%=rs("ly_id")%>' class="easyui-linkbutton" plain="true">��</a>
				<a href='javascript:doDel(<%=rs("ly_id")%>)'class="easyui-linkbutton" plain="true">ɾ��</a>
			</td>
		</tr>
		<% 
			rs.movenext
			next 
		%>
	</table>
	</div>
	<!-- ���幦����(����) -->
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