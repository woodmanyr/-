<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<html>
<head>
<title><%=config(0)%>-=-忘记密码</title>
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
  <TR>
    <TD HEIGHT="182">
        <p>&nbsp;</p>
                <p align="center">密码恢复第一步： 请输入你的用户名<BR>
                  <BR>
                </p>
        <form action="getpass1.asp" method="post" name="form">
                  <p align="center"> 
                    <input name="user_name" type=text id="user_name" style="BORDER-BOTTOM: #2b6da9 1px dotted; BORDER-LEFT: #2b6da9 1px dotted; BORDER-RIGHT: #2b6da9 1px dotted; BORDER-TOP: #2b6da9 1px dotted; COLOR: #000000" SIZE="20">
                    <input class=button type=submit value="下一步">
                  </p>
          <p>&nbsp;</p>
        </FORM></TD></TR></TABLE>
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