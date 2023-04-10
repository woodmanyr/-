<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<br><br><br><br><br><br>
<%
changpass=request("changpass")
if changpass="save" then
user_id=request("user_id")
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "Select * from user where user_id="&user_id,conn,1,3
if trim(request("oldpass"))<>rs("user_pass") then 
response.write"<script>alert('旧密码错误,请返回填写');history.back();</script>"
response.end
else if trim(request("user_pass"))<>trim(request("user_passqr")) then
response.write"<script>alert('新密码和确认密码不同,请返回填写');history.back();</script>"
response.end
else
rs("user_pass")=trim(request("user_pass"))
rs.update
rs.close
set rs=nothing
response.write "<script>alert('密码修改成功！');location.href='admin_main.asp';</Script>"
end if
end if
end if
%>
<form name="changpass" method="post" action="changpass.asp">
<table width="290" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr>
      <td width="282" height="29" align="center" valign="middle" bgcolor="#008306">修改管理员个人密码</td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" bgcolor="#C9E393">旧的密码: 
        <input name="oldpass" type="password" id="oldpass" value="" size="18"></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" bgcolor="#C9E393">新的密码: 
        <input name="user_pass" type="password" id="user_pass" value="" size="18"></td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" bgcolor="#C9E393"> 
      <p>确认密码: 
          <input name="user_passqr" type="password" id="user_passqr" value="" size="18">
      </p>
      </td>
  </tr>
  <tr>
    <td height="30" align="center" valign="middle" bgcolor="#C9E393">
	<input type="hidden" name="changpass" value="save">
	<input type="hidden" name="user_id" value="<%=user_id%>">
        <input type="submit" name="Submit" value=" 修 改 "></td>
  </tr>
</table>
</form>
<br>
