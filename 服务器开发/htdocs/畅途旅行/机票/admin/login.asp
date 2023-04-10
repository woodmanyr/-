<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="../inc/conn1.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>管理员登陆</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%
if Request.Form("submit")="确 定" then
 set rs=Server.CreateObject("AdoDb.Recordset")
 pass=TRim(Request.Form("password"))
 name=TRim(Request.Form("name"))
 strSel="select id from admin where name='" & name & "' and password='" & pass & "'"
 rs.Open strSel,conn,3,3
 if rs.Recordcount>0 then
   Response.Cookies("admin_login")="true"
   if Request.QueryString("action")="guestbook" then
    Response.Redirect("../guestbook.asp")
   end if
   Response.Redirect("index.asp")
 end if
 rs.close
end if
%>
<body>
<form method="post">
<table width="244" height="112"  border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#D6D3CE" class="font">
  <tr bgcolor="#FFFFFF">
    <td height="30" colspan="2"><div align="center"><strong>管理员登陆</strong></div></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td width="73" height="25"><div align="right">用户名：</div></td>
    <td width="168"><input name="name" type="text" class="input" style="height:18px;width:100px" size="16"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="12"><div align="right">密码：</div></td>
    <td><input name="password" type="password" class="input" style="height:18px;width:100px" size="16"></td>
  </tr>
  <tr bgcolor="#FFFFFF">
    <td height="13" colspan="2"><div align="center">
      <input type="submit" name="Submit" value="确 定"> 　
      <input type="reset" name="Submit2" value="重置">
    </div></td>
  </tr>
</table>
</form>
</body>
</html>
