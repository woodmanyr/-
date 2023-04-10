<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<%
user_name=session("user_name")
user_passda=trim(request("user_passda"))
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from user where user_name='"&user_name&"'",conn,1,1

If rs.eof Then
response.write "<center>没有该用户资料，请返回注册新用户!!! <br><br></center>"
response.write "<center><a href='../reg.asp'>返回</a></center>" 
response.end
rs.close
set rs=nothing
conn.close
set conn=nothing
End If
if user_passda<>rs("user_passda") then 
response.write "<center>答案错，请返回重新输入答案!!! <br><br></center>"
response.write "<center><a href='javascript:onclick=history.go(-1)'>按这儿返回</a></center>" 
response.end
rs.close
set rs=nothing
conn.close
set conn=nothing
End If
%>

<html>
<head>
<title><%=config(0)%>-=-忘记密码—重新设置新密码~</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<!--#include file="../top.asp"-->
<TABLE width="784" border=0 align=center cellPadding=0 cellSpacing=0 bgColor=#ffffff>
  <TBODY>
    <TR> 
      <TD background="../images/zuo.gif" 
    rowSpan=2 width=12></TD>
      <TD align=center vAlign=top>
<div align="center"><TABLE WIDTH="100%" height="100%" BORDER="0" ALIGN="CENTER" CELLPADDING="2" CELLSPACING="2">
  <TR><TD HEIGHT="63">
      <DIV ALIGN="CENTER"> 
<form action=getpass2.asp method=post name=reg>
                    <p>&nbsp;</p><table width="300" border="0" align="center" cellpadding="3" cellspacing="1" bordercolorlight="#0099cc" bordercolordark="#FFFFFF" bgcolor="#000000">
                      <tr align="center" valign="top" bgcolor="#CCCCCC"> 
                        <td height="30" colspan="2" valign="middle">密码恢复第三步： <font color="#FF0000">请重新设置新密码</font></td>
          </tr>
                      <tr valign="top" align="center" bgcolor="#F7F7F7"> 
                        <td width="85" height="26" valign="middle">新的密码:</td>
                        <td width="200" height="26" valign="middle"> 
                          <input class=button name="user_pass" type="password" id="user_pass" size="20"></td>
          </tr>
                      <tr valign="top" align="center" bgcolor="#F7F7F7"> 
                        <td height="26" valign="middle">确认密码:</td>
                        <td height="26" valign="middle"> 
                          <input class=button name="user_passqr" type="password" id="user_passqr" size="20"></td>
          </tr>
                      <tr valign="top" align="center" bgcolor="#F7F7F7"> 
                        <td height="26" colspan="2" valign="middle">&nbsp;</td>
          </tr>
                      <tr valign="top" align="center" bgcolor="#F7F7F7"> 
                        <td height="26" colspan="2" valign="middle"> 
                          <input type="hidden" name="getpass" value="save">
			<input type="hidden" name="user_name" value="<%=rs("user_name")%>">
			<input type="hidden" name="user_passda" value="<%=rs("user_passda")%>">
			<input type="hidden" name="user_id" value="<%=rs("user_id")%>">
              <input class=button type="submit" name="Submit" value=" 修 改 ">
             </td>
          </tr>
        </table><p>&nbsp;</p></form>
      </DIV></TD></TR></TABLE> 
        </div></TD>
      <TD background="../images/you.gif" 
    rowSpan=2 width=12></TD>
    </TR>
    <TR> 
      <TD background=../images/dotlineh.gif 
height=1></TD>
    </TR>
  </TBODY>
</TABLE>
<!--#include file="../end.asp"-->
	      <%
		  getpass=request("getpass")
		  if getpass="save" then
		  if trim(request("user_pass"))<>trim(request("user_passqr")) then
		  response.write "<script>alert('新密码和确认密码不同,请返回重新填写!');location.href='getpass.asp';</Script>"
response.end
else
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "Select * from user where user_id="&trim(request("user_id")),conn,1,3
rs("user_pass")=trim(request("user_pass"))
rs.update
response.write "<script>alert('恭喜,密码修改成功!请返回登陆!');location.href='../login.asp';</Script>"
end if
end if
rs.close
set rs=nothing
conn.close
set conn=nothing
	   %>