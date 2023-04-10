<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<script src="../js/Popup.js"></script>
<title><%=config(0)%>-=-搜索</title>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<!--#include file="../public/top.asp"-->
<TABLE width="784" border=0 align=center cellPadding=0 cellSpacing=0 bgColor=#ffffff>
  <TBODY>
    <TR> 
      <TD background="../images/zuo.gif" 
    rowSpan=2 width=12></TD>
      <TD align=center vAlign=top><br>
<div align="center"><form name="search" method="post" action="../search_list.asp">
            <table width="480" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
              <tr> 
                <td height="26" colspan="2" align="center" valign="middle" bgcolor="#FFFFFF"> 
                  <table height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
                    <tr> 
                      <td align="middle" width="16" background="../images/title2.gif">&nbsp;</td>
                      <td width="512" align="center" valign="middle" background="../images/title2_1.gif"><strong>文章搜索 
                        所有项目如不要求则留空</strong> </td>
                      <td width="16"><img src="../images/title2_2.gif" width="14" height="24"></td>
                    </tr>
                  </table></td>
              </tr>
              <tr> 
                <td width="16%" height="30" align="center" valign="middle" bgcolor="#F7F7F7">文章类别:</td>
                <td width="84%" height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <div align="left"> 
                    <select name="nclass_id" id="select2">
                      <option class=button selected value="">请选择类别</option>
                      <%  dim rs1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from nclass",conn,1,3
  do while not rs1.eof                        
        %>
                      <option value="<%=trim(rs1("nclass_id"))%>"><%=trim(rs1("nclass_name"))%></option>
                      <%                        
        rs1.movenext                        
        loop                        
        rs1.close                        
        %>
                    </select>
                  </div></td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">文章标题:</td>
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <div align="left"> 
                    <input class=button name="news_title" type="text" id="news_title5" size="50">
                  </div></td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">文章连接:</td>
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <div align="left"> 
                    <input class=button name="news_link" type="text" id="news_link3" size="50">
                  </div></td>
              </tr>
              <tr bgcolor="#F7F7F7"> 
                <td height="24" align="center" valign="middle"> 
                  <p>发布日期:</p></td>
                <td height="24" align="center" valign="middle"> 
                  <div align="left"> 
                    <input name="news_date" type="text" id="news_date" size="10">
                    &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.search.news_date, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
                    &lt;- 点这个小图选日期</div></td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">文章作者:</td>
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <div align="left"> 
                    <input class=button name="news_writer" type="text" id="news_writer3" size="15">
                  </div></td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">文章来源:</td>
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <div align="left"> 
                    <input class=button name="news_from" type="text" id="news_from2" size="30">
                  </div></td>
              </tr>
              <tr> 
                <td height="30" colspan="2" bgcolor="#F7F7F7"> 
                  <div align="center"> 
                    <input type="hidden" name="news_search" value="save">
                    <input class=button type="submit" name="Submit" value=" 搜索文章 ">
                  </div></td>
              </tr>
            </table>
</form>
        </div><br>
<br>
</TD>
      <TD background="../images/you.gif" 
    rowSpan=2 width=12></TD>
    </TR>
    <TR> 
      <TD background=../images/dotlineh.gif 
height=1></TD>
    </TR>
  </TBODY>
</TABLE>
<!--#include file="../public/end.asp"-->
</body>
</html>
