<%
kjType = request.querystring("type")
kjTypeName = ""
if kjType =1 then
	kjTypeName = "����������γ�"
end if
if kjType =2 then
	kjTypeName = "VB"
end if
if kjType =3 then
	kjTypeName = "VF"
end if
if kjType =4 then
	kjTypeName = "�����Ӧ�û���"
end if
if kjType =5 then
	kjTypeName = "���ݿ⼰Ӧ��"
end if
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- �ײ������˵��� -->
	<!--#include file="common/header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			var lyNo = $("#lyNo").val();
			if($.trim(lyNo) == ""){
				alert("ѧ��Ϊ�����");
				$("#lyNo").focus();
				$("#lyNo").addClass('errInpt');
				return false;
			}else{
				$("#lyNo").removeClass('errInpt');
			}
			
			var lyName = $("#lyName").val();
			if($.trim(lyName) == ""){
				alert("����Ϊ�����");
				$("#lyName").focus();
				$("#lyName").addClass('errInpt');
				return false;
			}else{
				$("#lyName").removeClass('errInpt');
			}
			
			var lySpec = $("#lySpec").val();
			if($.trim(lySpec) == ""){
				alert("רҵΪ�����");
				$("#lySpec").focus();
				$("#lySpec").addClass('errInpt');
				return false;
			}else{
				$("#lySpec").removeClass('errInpt');
			}
			
			var lyInfo = $("#lyInfo").val();
			if($.trim(lyInfo) == ""){
				alert("רҵΪ�����");
				$("#lyInfo").focus();
				$("#lyInfo").addClass('errInpt');
				return false;
			}else{
				$("#lyInfo").removeClass('errInpt');
			}
			
			document.addLiuyanban.submit();
		}

	</script>
</head>

<body>
<div id="container">
	<div id="holder" class="clearfix">
		<!-- �ײ������˵��� -->
		<!--#include file="common/top.asp" -->
		<div id="content" style="width: 748px; min-height: 481px;">
			<%if kjType > 5 then%>
				<div style="margin-left:5px;">���������ַ�����뷵����ҳ &gt;&gt; <a href="index.asp">��ҳ</a></div>
			<% end if %>
			<div style="font:����; font-size:24px; font-weight:bold;">
				��<%=kjTypeName%>�����԰�
			</div>
			<div style="height:20px;"></div>
			<div style="border:1px solid #c0c0c0;">
				<div class="listDiv" style="height:auto">
				<form  name="addLiuyanban" method="post" action="addLybInfoAct.asp">
				<input type="hidden" name="lyTypeId" id="lyTypeId" value="<%=cint(kjType)%>" />
				<input type="hidden" name="lyTypeName" id="lyTypeName" value="<%=kjTypeName%>" />
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th height="35px;"><span class="necessSpan">*</span> ѧ �ţ�</th>
							<td><input type="text" name="lyNo" id="lyNo" size="32" style="width:250px;"/></td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> �� ����</th>
							<td><input type="text" name="lyName" id="lyName" size="32" style="width:250px;" /></td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> ר ҵ��</th>
							<td><input type="text" name="lySpec" id="lySpec" size="64" style="width:250px;" /></td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> �� �ԣ�</th>
							<td><textarea name="lyInfo" id="lyInfo" rows="10" cols="70"></textarea></td>
						</tr>
						<tr>
							<td height="50px" colspan="2" id="BtnDiv"><div class="buttonDiv" style="margin-left:220px;" onclick="doSbmit()">�� ��</div> <div class="buttonDiv" onclick="window.location.reload();">�� ��</div></td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- �ײ������˵��� -->
	<!--#include file="common/footer.asp" -->
</div>

</body></html>