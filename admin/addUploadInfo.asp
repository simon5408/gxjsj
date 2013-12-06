<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%
filePath = URLDecode(request.querystring("pathName"))
cate = request.querystring("cate")
cateName = ""
if cate =1 then
	cateName = "课件"
end if
if cate =2 then
	cateName = "作业习题"
end if
if cate =3 then
	cateName = "教材教案"
end if
if cate =4 then
	cateName = "软件下载"
end if
if cate =5 then
	cateName = "教学大纲"
end if

Function URLDecode(enStr)
   dim deStr,strSpecial
   dim c,i,v
     deStr=""
     strSpecial="!""#$%&'()*+,.-_/:;<=>?@[\]^`{|}~%"
     for i=1 to len(enStr)
       c=Mid(enStr,i,1)
       if c="%" then
         v=eval("&h"+Mid(enStr,i+1,2))
         if inStr(strSpecial,chr(v))>0 then
           deStr=deStr&chr(v)
           i=i+2
         else
           v=eval("&h"+ Mid(enStr,i+1,2) + Mid(enStr,i+4,2))
           deStr=deStr & chr(v)
           i=i+5
         end if
       else
         if c="+" then
           deStr=deStr&" "
         else
           deStr=deStr&c
         end if
       end if
     next
     URLDecode=deStr
End function

%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			var scName = $("#scName").val();
			if($.trim(scName) == ""){
				alert("名称为必填项！");
				$("#scName").focus();
				$("#scName").addClass('errInpt');
				return false;
			}else{
				$("#scName").removeClass('errInpt');
			}
			
			var scTypeId = $("#scTypeId").val();
			if($.trim(scTypeId) == "-99"){
				alert("课程科目为必选项！");
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
	session("typeName") = "新增课件"
%>
	<!-- 头部操作菜单栏 -->
	<!--#include file="top.asp" -->

	<!-- 左边操作栏 -->
	<div id="left">
		<!--#include file="left.asp" -->
	</div>
	
	<div id="right">
	<!-- 主体功能区(开始) -->
	<form  name="addEduType" method="post" action="addUploadInfoAct.asp">
	<input type="hidden" name="scCateId" id="scCateId" value="<%=cint(cate)%>" />
	<input type="hidden" name="scCateName" id="scCateName" value="<%=cateName%>" />
	<input type="hidden" name="scPath" id="scPath" value="<%=filePath%>" />
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		<tr>
			<th width="100" height="50" align="right">名称：</th>
			<td width="" align="left"><input type="text" name="scName" id="scName" style="width:355px"></td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">课程科目：</th>
			<td width="" align="left">
				<input type="hidden" name="scTypeName" id="scTypeName" value="" />
				<select id="scTypeId" name="scTypeId">
					<option value="-99">- 选择 -</option>
					<option value="1">计算机基础课程</option>
					<option value="2">VB</option>
					<option value="3">VF</option>
					<option value="4">计算机应用基础</option>
					<option value="5">数据库及应用</option>
				</select>
			</td>
		</tr>
		<tr>
			<th width="100" height="50" align="right">上传文件：</th>
			<td width="" align="left">
				<%=filePath%>
			</td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">保 存</a>
		<a href="javascript:void(0);" onclick="window.location.reload();" class="easyui-linkbutton" icon="icon-reload">刷 新</a>
	</div>
	</form>
	<!-- 主体功能区(结束) -->
	</div>
<%
    else
		response.Redirect "../login.asp"
 	end if 
%>
</body>
</html>
