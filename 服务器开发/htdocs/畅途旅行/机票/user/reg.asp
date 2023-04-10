<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/conn_reg_word.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-注册需知</title>
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
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top" bgcolor="#FFFFFF">
            <div align="center"> 
              <table cellspacing=0 cellpadding=0 width="90%" border=0 align="center">
                <tbody> 
                <tr> 
                  <td> <span class="mainzi"> 
                    <%set rs=server.CreateObject("adodb.recordset")
%>
                    <%
id=Request.QueryString("id")
strSel="select * from qita where id=166"
rs.Open strsel,conn,3,3
%>
                    </span> 
                    <table id=Table1 cellspacing=0 cellpadding=0 width="100%" 
      align=center border=0>
                      <tbody> 
                      <tr> 
                        <td valign=top>&nbsp;&nbsp;&nbsp;&nbsp; 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td>&nbsp;</td>
                            </tr>
                          </table>
                          <span class="style15"><%=Trim(rs("content"))%></span></td>
                      </tr>
                      </tbody> 
                    </table>
                    
                      
                    <%rs.close%>
                  </td>
                </tr>
                </tbody> 
              </table>
              <p><a 
            href="./reg2.asp"><img border=0 
            height=17 src="../images/button_agree.gif" width=59></a>&nbsp; <img 
            border=0 height=17 onClick=history.back() 
            onMouseOver="this.style.cursor='hand'" 
            src="../images/button_dissent.gif" width=59></p>
              </div>
          </td>
        </tr>
      </table>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
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
</BODY>
</HTML>