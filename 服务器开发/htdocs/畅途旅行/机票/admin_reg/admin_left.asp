<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../images/style.css" type="text/css">
<title>无标题文档</title>
<base target="mainFrame">
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0 onLoad="show_clock()">

<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td height="30" align="center" valign="middle"> 
      <div align="center"><script src="../js/show_clock.js"></script></div></td>
  </tr>
</table>
<div align="center"> 
  <table width="81%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#008306">系统控制面版</td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="../index.asp" target="_blank">网站首页</a> 
        | <a href="admin_main.asp">面版首页</a></td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="system.asp" target="mainFrame">系统设置</a></td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#008306">会员管理控制</td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="user_add.asp">添加</a> 
        | <a href="user_list.asp">修改</a></td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="user_search.asp">搜索会员</a></td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#008306">管理员选项</td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="changpass.asp?user_id=<%=user_id%>">修改个人密码</a></td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393">&nbsp;</td>
    </tr>
    <tr> 
      <td height="25" align="center" valign="middle" bgcolor="#C9E393"><a href="../public/logout.asp" target="_parent">退出系统</a></td>
    </tr>
  </table>
<br>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr>
      <td height="85" align="center" valign="middle"> 
        <p>&lt;<a href="http://www.chinaunite.cn/" target="_blank">优士互联</a>&gt;<br>
          版权所有 2005-2006<br>
          技术支持：<a href="mailto:king@chinaunite.cn">king</a><br>
        </p>
        </td>
    </tr>
  </table>
</div>
</body>
</html>
