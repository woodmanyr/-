<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<%
user_name=trim(request("user_name"))
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "select * from user where user_name='"&user_name&"'",conn,1,1

If rs.eof Then
response.write "<center>û�и��û�����ע�����û�!!! <br><br></center>"
response.write "<center><a href='reg.asp'>����ע��</a></center>" 
response.end
End If
%>
<html>
<head>
<title><%=config(0)%>-=-�������롪���ڶ���</title>
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
  <TR><TD HEIGHT="63"><DIV ALIGN="CENTER"> 
                  <p><br>
                  </p>
                  <p>&nbsp; </p>
        <p>����ָ��ڶ����� ���������������ʾ�����<BR>
        <BR>
          ���������ʾ���⣺  <B><font color=red><%=user_name%><%session("user_name")=user_name%></FONT></B><BR>
        </p>
        <form action="getpass2.asp" method="post" name="form">
          <input name="user_passda" type=text id="user_passda" style="BORDER-BOTTOM: #2b6da9 1px dotted; BORDER-LEFT: #2b6da9 1px dotted; BORDER-RIGHT: #2b6da9 1px dotted; BORDER-TOP: #2b6da9 1px dotted; COLOR: #000000" SIZE="20"> 
<input class=button type=submit value="��һ��"></FORM>
                  <p>&nbsp;</p>
                  <p><br>
                    <br>
                  </p>
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