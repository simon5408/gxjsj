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
		<p align="center"><span lang="en"><font face="Trebuchet MS">2012-2014</font> &copy; </span><b>�����Ƽ�ѧԺ���ּ���ϵ </b>
		�����Ƽ�ѧԺ��ѧԺ&nbsp;</p>
		<p align="center">��ַ������ʡ�ϲ��б�����·�������1118�� �ʱࣺ330029 </p>
		<p align="center">���Ǳ�վ��<b><% =CounterHits+20000 %></b>λ�ÿ� <a href="login.asp" style="color:#999999">�����½</a>
		</p>
	</div>
	
	