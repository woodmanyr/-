<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="../cf.asp"-->
<!--#include file="../public/user.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-有效期查询</title>
</head>

<BODY background="../images/bg.jpg" topmargin="0">
<CENTER>
<!--#include file="../top_mem.asp"-->
<table cellspacing=0 cellpadding=0 width=760 align=center bgcolor=#ffffff 
border=0>
  <tbody> 
  <tr> 
    <td width=3></td>
    <td valign=top align=middle bgcolor=#ffffff> 
      <p>&nbsp; </p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td height="341" valign="middle" bgcolor="#FFFFFF"> 
            <div align="center"> 
              <p>&nbsp;</p>
              <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
                <tr bgcolor="#CCCCCC"> 
                  <td height="26" colspan="2"> 
                    <div align="center">会员有效期查询</div>
                  </td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td width="87" height="24" bgcolor="#F7F7F7">
                    <div align="center">会员号码 :</div>
                  </td>
                  <td width="248" height="24"><%=user(24)%></td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td width="87" height="24" bgcolor="#F7F7F7"> 
                    <div align="center">会员 ID :</div>
                  </td>
                  <td width="248" height="24"><%=user(2)%></td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="24" bgcolor="#F7F7F7"> 
                    <div align="center">VIP 状态:</div>
                  </td>
                  <td height="24"> 
                    <%
			  If user(18)= true Then 
			  Response.Write"<font color=red>有效中</font>"
			  else 
			  Response.Write "关闭中"
			  end if%>
                  </td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="24" bgcolor="#F7F7F7"> 
                    <div align="center">会员积分:</div>
                  </td>
                  <td height="24"><%=user(17)%></td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="24" bgcolor="#F7F7F7"> 
                    <div align="center">开通日期:</div>
                  </td>
                  <td height="24"><%=user(19)%></td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="24" bgcolor="#F7F7F7"> 
                    <div align="center">截止日期:</div>
                  </td>
                  <td height="24"><%=user(20)%></td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="24" bgcolor="#F7F7F7"> 
                    <div align="center">剩余天数:</div>
                  </td>
                  <td height="24">&nbsp; </td>
                </tr>
                <tr bgcolor="#F7F7F7"> 
                  <td height="26" colspan="2"> 
                    <div align="center"><a href="../public/logout.asp">退出登陆</a></div>
                  </td>
                </tr>
              </table>
              <table width="350" border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td>&nbsp;</td>
                </tr>
              </table>
              <table width="350" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
                <tr bgcolor="#CCCCCC"> 
                  <td height="26"> 
                    <div align="center"><a href="edit.asp" target="_blank">会员资料修改</a></div>
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
      <font face=宋体><font 
      face=宋体></font></font> </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="../bottom_mem.asp"-->
</CENTER>
</HTML>