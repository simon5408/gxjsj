<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<title>高校计算机基础课程共享平台</title>
	<LINK href="css/onto_style.css" type="text/css" rel="stylesheet">
	
	<!-- jquery js -->
	<script language="javascript" src="js/common/jQuery/jquery-1.4.4.min.js"></script>
	<script language="javascript" src="js/common/jQuery/easyui/jquery.easyui.min.js"></script>
	
	<!-- jquery css -->
	<link rel="stylesheet" type="text/css" href="js/common/jQuery/easyui/themes/default/easyui.css">
	<link rel="stylesheet" type="text/css" href="js/common/jQuery/easyui/themes/icon.css">
	
	<script language="javascript" type="text/javascript">
		function doLogIn(){
			var username = $("#username").val();
			if($.trim(username) == ""){
				alert("请输入用户名");
				$("#username").focus();
				$("#username").addClass('errInpt');
				return false;
			}else{
				$("#username").removeClass('errInpt');
			}
			
			var password = $("#password").val();
			if($.trim(password) == ""){
				alert("请输入密码");
				$("#password").focus();
				$("#password").addClass('errInpt');
				return false;
			}else{
				$("#password").removeClass('errInpt');
			}
			
			document.Login.submit();
		}

	</script>
	
	<style type="text/css">
		.body table{
			background:url('images/bg_img.gif') repeat-x ;
		}
		.loginDiv{
			position: absolute;
			left:26%;
			top:30%;
			border:0px solid #999999; 
			width:600px; 
			height:351px;
			background:url('images/body_bg.gif') no-repeat;
			font-family:微软雅黑;
			color:#f5f5f5;
		}
		.titleDiv{
			border:0px solid #999999; 
			font-family:微软雅黑;
			font-size:32px;
			color:#f5f5f5;
			height:56px;
			*height:77px;
			padding-top:21px;
		}
		.bodyDiv{
			border:0px solid #999999; 
			height:190px;
			*height:190px;
		}
		.unDiv{
			border:0px solid #999999;
			height:45px;
			bottom:3px;
			margin-top:30px;
		}
		.pwDiv{
			border:0px solid #999999;
			height:50px;
		}
		.nameType{
			border:0px solid #999999;
			float:left;
			width:390px;
			text-align:-moz-right !important; /*For FireFox*/
			text-align:right; /*For IE*/
		}
		.msgType{
			border:0px solid #999999;
			float:left;
			color:#e5e5e5;
			font-size:10px;
			width:200px;
			*width:210px;
			margin-top:3px;
			padding-left:3px;
			text-align:-moz-left !important; /*For FireFox*/
			text-align:left; /*For IE*/
		}
		.btDiv{
			border:0px solid #999999;
			height:70px;
			margin-top:5px;
		}
	</style>
</head>

<body>
  <div class="body" style="background:#E8E8E8">
  	<form  name="Login" method="post" action="loginAct.asp">
	<table width="100%" height="97%" border="0" cellspacing="0" cellpadding="0">
	  	<tr>
	  		<td align="center" valign="middle" width="100%" height="97%">
	  		<div class="loginDiv">
	  			<!-- Name -->
	  			<div class="titleDiv">高校计算机基础课程共享平台-管理系统</div>
	  			
	  			<!-- Operate -->
	  			<div class="bodyDiv">
	  				<!-- username -->
	  				<div class="unDiv">
	  					<div class="nameType">
	  						用户姓名：<input type="text" id="username" name="username" value="" size="25" />
	  					</div>
	  				</div>
	  				<!-- password -->
	  				<div class="pwDiv">
	  					<div class="nameType">
	  						用户密码：<input type="password" id="password" name="password" value="" size="25" style="width:180px;" />
	  					</div>
	  				</div>
	  				<!-- button -->
	  				<div class="btDiv">
	  					<input type="button" class="confirmBtn" id="btnSub" value="登 录" onclick="doLogIn()" />
	  					<input type="reset" class="reloadBtn" value="重 置" onclick="window.location.reload();" />
	  				</div>
	  			</div>
	  		</div>	  		</td>
	  	</tr>
	</table>
	</form>
  </div>

</body>
</html>