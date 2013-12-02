<%
dbpath=server.mappath("data/console.mdb")  
     set conn=server.createobject("adodb.connection")  
     conn.open "provider=microsoft.jet.oledb.4.0;data source=" & dbpath
%>