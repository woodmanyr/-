<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-登陆</title>
</head>
<BODY background="../images/bg.jpg" topmargin="0">
<!--#include file="../top_mem.asp"--><CENTER>
<table cellspacing=0 cellpadding=0 width=760 align=center bgcolor=#ffffff 
border=0>
  <tbody> 
  <tr> 
    <td width=3></td>
    <td valign=top align=middle bgcolor=#ffffff> 
      <table width="100%" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td> 
            <div align="center"> 
              <table width="80%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td height="321" valign="middle" bgcolor="#FFFFFF"> 
                    <div align="center"> 
                      <form action="./login.asp" method="post">
                        <table width="290" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
                          <tr> 
                            <td width="282" height="29" align="center" valign="middle" bgcolor="#CCCCCC"><strong>登 
                              陆</strong></td>
                          </tr>
                          <tr> 
                            <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">用户名: 
                              <input name="user_name" type="text" id="user_name" value="" size="18">
                            </td>
                          </tr>
                          <tr> 
                            <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">密 
                              码 : 
                              <input name="user_pass" type="password" id="user_pass" value="" size="18">
                            </td>
                          </tr>
                          <tr> 
                            <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                              <input type="hidden" name="login" value="login">
                              <input class=button type="submit" name="Submit2" value=" 登 陆 ">
                            </td>
                          </tr>
                          <%
		  if request("login")="login" then
		  user_name=trim(request("user_name"))
          user_pass=trim(request("user_pass"))
          if user_name<>"" then
set rs=server.createobject("adodb.recordset")
rs.open "select * from user where user_name='"&user_name&"'",conn,1,3
	if rs.bof and rs.eof then
response.write"<tr><td height='30' align='center' valign='middle' bgcolor='#F7F7F7'><font color=red>你输入的信息有误!请重新输入</font></td></tr>"
else
if rs("user_name")=user_name and rs("user_pass")=user_pass then
session("user_name")=rs("user_name")
session("user_pass")=rs("user_pass")
session("user_id")=rs("user_id")
session("user_group_id")=rs("user_group_id")
user_dl=rs("user_dl")
rs("user_dl")=user_dl+1
rs.update
if rs("user_group_id")=config(8) or rs("user_group_id")=3 then
Response.Redirect("../admin_reg/")
else
Response.Redirect("../index.asp")
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
else
response.write"<tr><td height='30' align='center' valign='middle' bgcolor='#F7F7F7'><font color=red>你输入的信息有误!请重新输入</font></td></tr>"
end if 
end if
end if
end if
%>
                        </table>
                      </form>
                    </div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
      <p>&nbsp; </p>
      <font face=宋体><font 
      face=宋体></font></font> </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="../bottom_mem.asp"--></CENTER>
</body> </html>