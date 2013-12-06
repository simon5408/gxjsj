<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			var lyNo = $("#lyNo").val();
			if($.trim(lyNo) == ""){
				alert("学号为必填项！");
				$("#lyNo").focus();
				$("#lyNo").addClass('errInpt');
				return false;
			}else{
				$("#lyNo").removeClass('errInpt');
			}
			
			var lyName = $("#lyName").val();
			if($.trim(lyName) == ""){
				alert("姓名为必填项！");
				$("#lyName").focus();
				$("#lyName").addClass('errInpt');
				return false;
			}else{
				$("#lyName").removeClass('errInpt');
			}
			
			var lyTypeId = $("#lyTypeId").val();
			if($.trim(lyTypeId) == "-99"){
				alert("课程为必选项！");
				$("#lyTypeId").focus();
				$("#lyTypeId").addClass('errInpt');
				return false;
			}else{
				$("#lyTypeId").removeClass('errInpt');
				$("#lyTypeName").val($("#lyTypeId").find('option:selected').text());
			}
			
			var lyInfo = $("#lyInfo").val();
			if($.trim(lyInfo) == ""){
				alert("专业为必填项！");
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
		<!-- 底部操作菜单栏 -->
		<!--#include file="common/top.asp" -->
		<div id="content" style="width: 748px; min-height: 481px;">
			<div style="font:黑体; font-size:24px; font-weight:bold;">
				留言板
			</div>
			<div style="height:20px;"></div>
			<div style="border:1px solid #c0c0c0;">
				<div class="listDiv" style="height:auto">
				<form  name="addLiuyanban" method="post" action="addLybInfoAct.asp">
					<table cellpadding="0" cellspacing="0" border="0">
						<tr>
							<th height="35px;"><span class="necessSpan">*</span> 学 号：</th>
							<td><input type="text" name="lyNo" id="lyNo" size="32" style="width:250px;"/></td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> 姓 名：</th>
							<td><input type="text" name="lyName" id="lyName" size="32" style="width:250px;" /></td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> 课 程：</th>
							
							<td>
								<input type="hidden" name="lySpec" id="lySpec" value="" />
								<input type="hidden" name="lyTypeName" id="lyTypeName" />
								<select name="lyTypeId" id="lyTypeId">
									<option value="-99">-选择-</option>
									<option value="1">计算机基础课程</option>
									<option value="2">VB</option>
									<option value="3">VF</option>
									<option value="4">计算机应用基础</option>
									<option value="5">数据库及应用</option>
								</select>
							</td>
						</tr>
						<tr>
							<th><span class="necessSpan">*</span> 留 言：</th>
							<td><textarea name="lyInfo" id="lyInfo" rows="10" cols="70"></textarea></td>
						</tr>
						<tr>
							<td height="50px" colspan="2" id="BtnDiv"><div class="buttonDiv" style="margin-left:220px;" onclick="doSbmit()">提 交</div> <div class="buttonDiv" onclick="window.location.reload();">重 置</div></td>
						</tr>
					</table>
					</form>
				</div>
			</div>
		</div>
	</div>
	<!-- 底部操作菜单栏 -->
	<!--#include file="common/footer.asp" -->
</div>

</body></html>