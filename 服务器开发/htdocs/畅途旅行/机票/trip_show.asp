<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE></TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312"><LINK 
href="images/css.css" type=text/css rel=stylesheet>
<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
<BODY bgColor=#e5e5e5 leftMargin=0 topMargin=0 marginheight="0" marginwidth="0">
<DIV id=NewsHeader1_MainHeader>
<!--#include file="top_detail.asp"--></DIV>
<DIV id=NewsHeader1_tbSpdb></DIV>
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR bgColor=#ffcc00>
    <TD width=510>
      <TABLE cellSpacing=0 cellPadding=0 width="100%" border=0>
        <TBODY>
        <TR>
          <TD width=42>&nbsp;</TD>
          <TD height=26><A 
            href="index.asp">首页</A> &gt;&nbsp; <SPAN id=lblNType><A 
            href="server_index.asp">特价机票</A></SPAN>&nbsp;&gt; 
            正文</TD>
        </TR></TBODY></TABLE></TD></TR></TBODY></TABLE>
<TABLE height=4 cellSpacing=0 cellPadding=0 width=760 align=center border=0>
  <TBODY>
  <TR>
    <TD bgColor=#ffffff></TD></TR></TBODY></TABLE>
<TABLE cellSpacing=0 cellPadding=0 width=760 align=center bgColor=#ffffff 
border=0>
  <TBODY>
  <TR>
    <TD width=3></TD>
    <TD vAlign=top align=middle bgColor=#ffffff>
<%set rs=server.CreateObject("adodb.recordset")
%>
<%
id=Request.QueryString("id")
strSel="select * from trip where id="&id
rs.Open strsel,conn,3,3
%>
      <table id=Table1 height=400 cellspacing=0 cellpadding=0 width="90%" 
      align=center border=0>
        <tbody> 
        <tr> 
          <td align=middle height=35><span class="style15"><%=rs("title")%></span><span id=lblTitle 
            style="FONT-WEIGHT: bold; FONT-SIZE: larger"></span></td>
        </tr>
        <tr> 
          <td align=middle height=19><span id=lblType>作者： </span><span class="style15">航空票务中心</span> 
            <span id=lblType>&nbsp; </span></td>
        </tr>
        <tr> 
          <td valign=top height=310>&nbsp;&nbsp;&nbsp;&nbsp; 
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr>
                <td>&nbsp;</td>
              </tr>
            </table>
            <span class="style15"><%=Trim(rs("content"))%></span></td>
        </tr>
        <tr> 
          <td valign=top align=middle height=30>
            <input class=newbtn1 id=btnGoback onMouseOver="this.className='newbtn1_o';" onClick=Javascript:self.close(); onMouseOut="this.className='newbtn1';" type=button value=关闭返回 name=btnGoback>
          </td>
        </tr>
        </tbody>
      </table>
      <p> 
        <%rs.close%>
      </p>
      <FONT face=宋体><FONT 
      face=宋体></FONT></FONT> </TD>
    <TD width=3></TD></TR></TBODY></TABLE>
<!--#include file="bottom_detail.asp"--></BODY></HTML>
