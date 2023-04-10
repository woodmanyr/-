<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-出错啦~~</title>
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
                    <td height="358" valign="middle" bgcolor="#FFFFFF"> 
                      <div align="center"><br>
                        <table width="350" border="0" align="center" cellpadding="3" cellspacing="1" bordercolorlight="#0099cc" bordercolordark="#FFFFFF" bgcolor="#000000">
                          <tr align="center"> 
                            <td width="100%" bgcolor=#CCCCCC height="26"><b>登陆错误信息提示：</b></td>
                          </tr>
                          <tr> 
                            <td width="100%" bgcolor=#F7F7F7 height="161" ><b>产生错误的可能原因：</b><br>
                              <br>
                              <li>你还没有登陆，请 <a href="login.asp" target="_parent">重新登陆系统</a>。<br>
                              <li>用户登陆超时，请 <a href="login.asp" target="_parent">重新登陆系统</a>。<br>
                              <li>你的帐号非VIP等级。请 注册VIP会员。<br>
                              <li>你的会员有效期已经到了，请 续费。<br>
                              <li>如果你是非本站会员，请你<a href="../user/reg.asp" target="_parent">注册为本站会员</a>。<br>
                            </td>
                          </tr>
                          <tr align="center"> 
                            <td width="100%" bgcolor=#F7F7F7 height="26"> <a href="javascript:history.go(-1)"><< 
                              返回上一页</a></td>
                          </tr>
                        </table>
                        <p><br>
                        </p>
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
</BODY>
</HTML>

