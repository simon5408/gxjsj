<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		// ɾ��ѧ����Ϣ
		function doDel(id){
			if(confirm("ȷ��Ҫɾ������Ϣ��")){
				window.location.href="delUploadInfo.asp?scId="+id+"&cate="+<%=request.querystring("cate")%>;
			}
		}
		
		// ������ѯ
		function doSearch(){
			var scName = document.getElementById("scName").value;
			var scTypeId = document.getElementById("scTypeId").value;
						
			document.location.href="listUploadFile.asp?scName="+scName+"&scTypeId="+scTypeId+"&cate="+<%=request.querystring("cate")%>;
		}
</script>
</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "�ϴ���Ϣ����"
%>
<!--#include file="listUploadFileAct.asp" -->
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
			<td><input type="text" name="scName" id="scName" value="<%=session("scName")%>"></td>
			
			<td style="font-family:'��Բ', Helvetica, sans-serif;">��Ŀ��</td>
			<td>
				<select name="scTypeId" id="scTypeId">
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
			<th>����</th>
			<th>��Ŀ</th>
			<th>�ļ�����</th>
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
			<td><%=rs("sc_name")%></td>
			<td><%=rs("sc_type_name")%></td>
			<td><%=rs("sc_path")%></td>
			<td><%=rs("sc_date")%></td>
			<td style="width:80px;">
				<a href='javascript:doDel(<%=rs("sc_id")%>)'class="easyui-linkbutton" plain="true">ɾ��</a>
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