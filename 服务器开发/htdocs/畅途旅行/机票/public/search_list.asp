<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-</title>
</head>

<BODY bgColor=#ffffff background=../images/BG1.gif leftMargin=0 topMargin=0>
<!--#include file="../public/top.asp"-->
<TABLE width="784" border=0 align=center cellPadding=0 cellSpacing=0 bgColor=#ffffff>
  <TBODY>
    <TR> 
      <TD background="../images/zuo.gif" 
    rowSpan=2 width=12></TD>
      <TD width="579" align=center vAlign=top> <div align="center"> 
          <table width="97%" border="0" cellspacing="1" cellpadding="3">
            <tr> 
              <td height="24" bgcolor="#F7F7F7"><IMG src="../images/arr1.gif" width=26 
            height=13 border="0" align=absMiddle> <a href="../index.asp">首 页</a> <img src="../images/square_topmenu.gif" width="6" height="9"> 
                文章搜索</td>
            </tr>
            <tr> 
              <td height="40"> <table height="24" cellSpacing="0" cellPadding="0" width="100%" border="0">
                  <tr> 
                    <td align="middle" width="19" background="../images/title2.gif">&nbsp;</td>
                    <td width="512" valign="middle" background="../images/title2_1.gif">·搜索到的&nbsp;文章列表如下: 
                      共计 <font color=red> 
                      <%
nclass_id=trim(request("nclass_id"))
news_title=trim(request("news_title"))
news_link= trim(request("news_link"))
news_writer= trim(request("news_writer"))
news_from= trim(request("news_from"))
set rs=Server.CreateObject("Adodb.Recordset")
if nclass_id="" and  news_title="" and news_link="" and news_writer="" and news_from="" and request("news_date")="" then
rs.open "SELECT * From news ORDER BY news_id DESC",conn,1,1 
else
hrefdate=""
sql1="select * from news where news_id like '%'"
if news_title<>"" then
   sql1=sql1 & " and news_title like '%"&news_title&"%'"
    hrefdate=hrefdate & "&news_title=" & news_title
end if
if nclass_id<>"" then
   sql1=sql1 & " and nclass_id = "&nclass_id&""
   hrefdate=hrefdate & "&nclass_id=" & nclass_id
end if
if news_link<>"" then
   sql1=sql1 & " and news_link like '"&news_link&"'"
   hrefdate=hrefdate & "&news_link=" & news_link
end if
if news_writer<>"" then
   sql1=sql1 & " and news_writer like '"&news_writer&"'"
   hrefdate=hrefdate & "&news_writer=" & news_writer
end if
if news_from<>"" then
   sql1=sql1 & " and news_from like '"&news_from&"'"
   hrefdate=hrefdate & "&news_from=" & news_from
end if
if request("news_date")<>"" then
news_date=formatdatetime(request("news_date"),2)
   sql1=sql1 & " and news_date like '"&news_date&"'"
   hrefdate=hrefdate & "&news_date=" & news_date
end if

sql1=sql1 & " ORDER BY news_id DESC"

rs.open sql1,conn,3,2
end if%>
                      <%=RS.recordcount%></font> 条记录·</td>
                    <td width="16"><img src="../images/title2_2.gif" width="14" height="24"></td>
                  </tr>
                </table></td>
            </tr>
            <%
Dim TotalPage '总页数
Dim PageNo '当前显示的是第几页
Dim RecordCount '总记录条数
If RS.RecordCount=0 then
response.write ""
else
RS.PageSize = config(3)
Totalpage=INT(RS.recordcount / rs.pagesize * -1)*-1 '计算可显示页面的总数
PageNo = Request.QueryString ("PageNo")
'直接输入页数跳转；
If Request.Form("PageNo")<>"" Then PageNo = Request.Form("PageNo")
'如果没有选择第几页，则默认显示第一页；
If PageNo = "" then PageNo = 1 
Rs.AbsolutePage = PageNo
End If
'获取当前文件名，使得每次翻页都在当前页面进行；
Dim fileName,postion
fileName = Request.ServerVariables("script_name")
postion = InstrRev(fileName,"/")+1
'取得当前的文件名称，使翻页的链接指向当前文件；
fileName = Mid(fileName,postion) 
Dim RowCount
RowCount = config(3) '每页显示的记录条数
%>
          </table>
          <TABLE align=center border=0 cellPadding=3 cellSpacing=1 width="97%">
            <TBODY>
              <TR align=middle bgColor=#e7e3e7> 
                <TD align=left bgColor=#f7f7f7 class=chinese height=30>　　　<FONT 
            color=#999999><STRONG>文 章 标 题</STRONG></FONT></TD>
                <TD bgColor=#f5f5f5 class=chinese width="27%"><FONT 
            color=#999999><STRONG>发 表 时 间</STRONG></FONT></TD>
              </TR>
              <%if rs.bof and rs.eof then 
		response.write "<font color=red>近期无更新文章</font>" 
		else
Do while Not Rs.eof and RowCount>0%>
              <TR> 
                <TD bgColor=#ffffff class=chinese height=25><IMG align=middle 
            height=6 src="../images/ss_gc.gif" width=4> <a href=".../display.asp?news_id=<%=rs("news_id")%>"><%=rs("news_title")%></a> <%if rs("news_date")=date() then
response.write"<img src='../images/new.gif'>"
end if%> </TD>
                <TD align=middle bgColor=#ffffff class=chinese><%=rs("news_date")%></TD>
              </TR>
              <TR> 
                <TD background=../images/d.gif colSpan=2></TD>
              </TR>
              <%RowCount = RowCount - 1
Rs.MoveNext
Loop
end if%>
            </TBODY>
          </TABLE>
          <p>
            <!--#include file="../public/search_page.asp"--></p>
          </div></TD>
      <TD width=180 align=middle vAlign=top><!--#include file="../public/right.asp"--></TD>
      <TD background="../images/you.gif" 
    rowSpan=2 width=12></TD>
    </TR>
    <TR> 
      <TD 
height=1 colspan="2" background=../images/dotlineh.gif></TD>
    </TR>
  </TBODY>
</TABLE>
<!--#include file="../public/end.asp"-->
</body>
</html>
