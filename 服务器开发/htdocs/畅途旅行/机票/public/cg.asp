<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<%user_name=session("user_user_name")%>
<html>
<head>
<title><%=config(0)%>-=-��Աע��ɹ�</title>
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" type=text/css rel=stylesheet>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</HEAD>
<BODY background="../images/bg.jpg" topmargin="0">
<CENTER>
<!--#include file="../top_mem.asp"-->
<table cellspacing=0 cellpadding=0 width=760 align=center bgcolor=#ffffff 
border=0>
  <tbody> 
  <tr> 
    <td width=3></td>
    <td valign=middle align=middle bgcolor=#ffffff> 
      <table width="100%" cellspacing="0" cellpadding="0" height="100%">
        <tr> 
          <td> 
            <div align="center"> 
              <table width="350" border="0" align="center" cellpadding="3" cellspacing="1" bordercolorlight="#0099cc" bordercolordark="#FFFFFF" bgcolor="#000000">
                <tr align="center"> 
                  <td width="100%" bgcolor=#cccccc height="25"><b>��ϲ,���Ѿ�ע��ɹ�!</b></td>
                </tr>
                <tr> 
                  <td width="100%" height="112" bgcolor="#F7F7F7" > 
                    <p align="center">�û���:<%=user_name%><br>
                      <br>
                      �� �� :<strong>******</strong></p>
                    <p align="center">�����Ʊ��������Ϣ!</p>
                  </td>
                </tr>
                <tr align="center"> 
                  <td width="100%" height="20" bgcolor="#F7F7F7"> <a href="login.asp"><< 
                    ��½ϵͳ</a></td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
      </table>
      <p>&nbsp; </p>
      </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="../bottom_mem.asp"-->
</CENTER>

