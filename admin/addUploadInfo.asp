<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
cate = request.querystring("cate")
cateName = ""
if cate =1 then
	cateName = "�μ�"
end if
if cate =2 then
	cateName = "��ҵϰ��"
end if
if cate =3 then
	cateName = "�̰�"
end if
if cate =4 then
	cateName = "�ο�����"
end if
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			var scName = $("#scName").val();
			if($.trim(scName) == ""){
				alert("����Ϊ�����");
				$("#scName").focus();
				$("#scName").addClass('errInpt');
				return false;
			}else{
				$("#scName").removeClass('errInpt');
			}
			
			var scTypeId = $("#scTypeId").val();
			if($.trim(scTypeId) == "-99"){
				alert("�γ̿�ĿΪ��ѡ�");
				$("#scTypeId").focus();
				$("#scTypeId").addClass('errInpt');
				return false;
			}else{
				$("#scTypeId").removeClass('errInpt');
				$("#scTypeName").val($("#scTypeId").find('option:selected').text());
			}
			
			document.addEduType.submit();
		}

	</script>

</head>

<body>
<% username=session("username") 
	if username<>"" then 
	session("typeName") = "�����μ�"
%>
	<!-- ͷ�������˵��� -->
	<!--#include file="top.asp" -->

	<!-- ��߲����� -->
	<div id="left">
		
	</div>
	
	<div id="right">
	<!-- ���幦����(��ʼ) -->
	<form  name="addEduType" method="post" action="addUploadInfoAct.asp">
	<input type="hidden" name="scCateId" id="scCateId" value="<%=cint(cate)%>" />
	<input type="hidden" name="scCateName" id="scCateName" value="<%=cateName%>" />
	<input type="hidden" name="scPath" id="scPath" value="<%=request.querystring("pathName")%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="100" height="50" align="right">���ƣ�</th>
			<td width="" align="left"><input type="text" name="scName" id="scName" style="width:355px"></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">�γ̿�Ŀ��</th>
			<td width="" align="left">
				<input type="hidden" name="scTypeName" id="scTypeName" value="" />
				<select id="scTypeId" name="scTypeId">
					<option value="-99">- ѡ�� -</option>
					<option value="1">����������γ�</option>
					<option value="2">VB</option>
					<option value="3">VF</option>
					<option value="4">�����Ӧ�û���</option>
					<option value="5">���ݿ⼰Ӧ��</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">�ϴ��ļ���</th>
			<td width="" align="left">
				<%=request.querystring("pathName")%>
			</td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">�� ��</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">ˢ ��</a>
	</div>
	</form>
	<!-- ���幦����(����) -->
	</div>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>