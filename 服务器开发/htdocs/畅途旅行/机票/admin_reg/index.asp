<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->


<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="inc/style.css" type="text/css">
<title><%=config(0)%>==<%=config(1)%>-=-后台管理系统</title>
</head>

<frameset rows="*" cols="184,*" frameborder="NO" border="0" framespacing="0">
  <frame src="admin_left.asp" name="leftFrame" scrolling="auto" marginwidth="0" marginheight="0" noresize>
  <frameset rows="43,*" cols="*" framespacing="0" frameborder="NO" border="0">
    <frame src="admin_top.htm" name="topFrame" scrolling="auto" marginwidth="0" marginheight="0" noresize>
    <frame src="admin_main.asp" scrolling="auto" marginwidth="0" marginheight="0" name="mainFrame">
  </frameset>
</frameset>
<noframes><body>

</body></noframes>
</html>

