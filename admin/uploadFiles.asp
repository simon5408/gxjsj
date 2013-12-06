<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>

<%
cateId = request.querystring("cate")
If request.totalbytes>0 Then
 formsize=request.totalbytes             ' 取二进制流字节长度
 formdata=request.binaryread(formsize)        ' 读取二进制流内容
 bncrlf=chrB(13)&chrB(10)
 datastart=instrb(formdata,bncrlf&bncrlf)+3       ' 取二进制流文件开始位置 (两个回车换行符)
 divider=leftB(formdata,instrb(formdata,bncrlf)-1)     ' 定义取二进制流 Field 分隔标记 (内容为二进制)
 dataend=instrb(datastart,formdata,divider)-datastart   ' 取二进制流文件部分结束位置
'将文件信息保存到数据库
 Call SaveTofile()       '将上传的文件保存到服务器
End If


Sub SaveTofile()'将上传的文件保存到服务器
'2.将获取的信息以二进制流文件存放 --- stm
 savepath=server.mappath("files")&"\"   '根据情况自己要先建立相应目录 或者开启fso自动建立
 Set  strm=createObject("adodb.str"&"eam")
 with strm
  .type=1          ' 二进制模式
  .mode=3          ' 指定打开模式为读写
  .open
  .write formdata        '写入二进制流内容
  '以文本模式读取数据,用于获得提交上来的文件路径及名称等信息
  .position=0         '将游标指向数据首部
  .type=2          '以文本模式读取
  .CharSet = "gb2312"     '设置中文编码
  formhead=.ReadText(datastart-1)   '读取表单头部内容
 End with
   '2.1获取上传的文件名称filename
   fullname=fRegExpSgl(formhead,true,true,true,"[\s\S]*filename\=""(.*?)""[\s\S]*","$1")
   fname=Split(fullname,"\")
   filename=fname(UBound(fname))  '获取到文件名
   Set fso = Server.CreateObject("Scripting.File"&"System"&"Object") '判断是否与本地盘文件重名,否则重命名 XXX(1).xxx
    If fso.FileExists(savepath&filename) Then
     For i=1 To 999
      Fxname=Split(filename,".")
      Fn=Left(filename,InstrRev(filename,".")-1)
      Fnx=fxname(UBound(fxname))
      If Not fso.FileExists(SavePath&Fn&"("&i&")."&Fnx) Then
       filename=Fn&"("&i&")."&Fnx
       Exit For
      End If
     Next
    End If
'3.从stm二进制流文件中获取有效信息 及 保存文件
 Set  formstrm=createOBject("adodb.str"&"eam")
  with formstrm
   .type=1         ' 二进制模式
   .mode=3
   .open
   strm.position = datastart      ' 指定 stm 对象的起始位置, 以变量 bStart 的值为起始位置
   strm.copyTo formstrm,dataend    ' 拷贝 stm 二进制流至 fromStm 对象, 长度为 bEnd 变量的长度
   .saveTofile (savepath&filename),2   ' 将信息保存到文件, 如果存在相同名称, 则覆盖
   .close
  end with
 Set strm=Nothing
 Set formstrm=Nothing
 response.redirect "addUploadInfo.asp?cate="&cateId&"&pathName="&Server.UrlEncode(filename)
End Sub
function fRegExpSgl(str,glb,igc,mtl,pt,rpt)
 dim re
 set re=new RegExp
  re.global=glb
  re.ignoreCase=igc
  re.multiline=mtl
  re.pattern=pt
  fRegExpSgl=re.replace(str,rpt)
 set re=nothing
end function
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" " http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns=" http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
	<!--#include file="header.asp" -->
	
	<script language="javascript" type="text/javascript">
		function doSbmit(){
			
			var scFile = $("#scFile").val();
			if($.trim(scFile) == ""){
				alert("文件为必选项！");
				$("#scFile").focus();
				$("#scFile").addClass('errInpt');
				return false;
			}else{
				$("#scFile").removeClass('errInpt');
			}
						
			document.form1.submit();
		}

	</script>
</head>

<body  leftmargin="0" topmargin="0">
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
	<form action="" method="post" name="form1" enctype="multipart/form-data">
	<!-- enctype="multipart/form-data"不能省略,以保证提交过来的信息的正确性,可以远程提交信息 -->
	<div id="oprtDiv">
	<table class="trgTbl" width="100%" border="0" cellpadding="1" cellspacing="1" style="background:#f5f5f5">
		
		<tr>
			<th width="100" height="50" align="right">上传文件：</th>
			<td width="" align="left">
				<input name="FileName" id="scFile" type="FILE" class="tx1" size="40" style="height:22">
			</td>
		</tr>
	</table>
	</div>
	<div id="operateBtn">
		<a href="javascript:void(0);" onclick="doSbmit()" class="easyui-linkbutton" icon="icon-save">上 传</a>
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
