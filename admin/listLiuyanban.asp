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

' �����û�
if  lyTypeId <> 0 then
	sql = sql + " and ly_type_id="&lyTypeId&" "
end if

'ѧ������
if lyName <> "" then
	sql =sql + " and ly_name like '%"&lyName&"%' "
end if

'ѧ������
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
		// ɾ��ѧ����Ϣ
		function doDel(id){
			if(confirm("ȷ��Ҫɾ������Ϣ��")){
				window.location.href="delLybInfo.asp?lyId="+id;
			}
		}
		
		// ������ѯ
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
			<td style="font-family:'��Բ', Helvetica, sans-serif;">רҵ��</td>
			<td><input type="text" name="lySpec" id="lySpec" value="<%=session("lySpec")%>"></td>
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��Ŀ��</td>
			<td>
				<select name="lyTypeId" id="lyTypeId">
					<option value="0">- ���� -</option>
					<option value="1">����������γ�</option>
					<option value="2">VB</option>
					<option value="3">VF</option>
					<option value="4">�����Ӧ�û���</option>
					<option value="5">���ݿ⼰Ӧ��</option>
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
			<th>רҵ</th>
			<th>��Ŀ</th>
			<th>����</th>
			<th>����</th>
			<th style="width:80px;">����</th>
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