<% 
	' Text Hit Counter Example By www.rczdh.com.cn 
	
	' Declare variables 
	Dim ObjCounterFile, ReadCounterFile, WriteCounterFile 
	Dim CounterFile 
	Dim CounterHits
	
	Set ObjCounterFile = Server.CreateObject("Scripting.FileSystemObject") 
	
	CounterFile = Server.MapPath ("counter.txt") 
	
	Set ReadCounterFile= ObjCounterFile.OpenTextFile (CounterFile, 1, True) 
	
	If Not ReadCounterFile.AtEndOfStream Then 
		CounterHits = Trim(ReadCounterFile.ReadLine) 
	If CounterHits = "" Then CounterHits = 20000 
	Else 
		CounterHits = 20000 
	End If 
	
	ReadCounterFile.Close 
	Set ReadCounterFile = Nothing 
	
	CounterHits = CounterHits + 1 
	
	Set WriteCounterFile= ObjCounterFile.CreateTextFile (CounterFile, True) 
	WriteCounterFile.WriteLine(CounterHits) 
	WriteCounterFile.Close 
	Set WriteCounterFile = Nothing 
	
	Set ObjCounterFile = Nothing 
%> 
	<div id="footer">
		<p align="center"><span lang="en"><font face="Trebuchet MS">2012-2014</font> &copy; </span><b>江西科技学院数字技术系 </b>
		江西科技学院商学院&nbsp;</p>
		<p align="center">地址：江西省南昌市北京东路京东大道1118号 邮编：330029 </p>
		<p align="center">你是本站第<b><% =CounterHits+20000 %></b>位访客 <a href="login.asp" style="color:#999999">管理登陆</a>
		</p>
	</div>
	
	