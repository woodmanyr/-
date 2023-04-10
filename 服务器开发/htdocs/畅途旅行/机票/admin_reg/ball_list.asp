<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->

<%
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "SELECT * from ball ORDER BY ball_id DESC",conn,1,1 
'删除
if request("del")="del" then
dsql="delete * from ball where ball_id="&request("ball_id")
conn.execute dsql
response.write"<script>alert('心水已成功删除！');location.href='ball_list.asp?pageno="%><%=request("pageno")%><%response.write"';</Script>"
end if
%>
<head>
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<br>
<br>
<%
Dim TotalPage '总页数
Dim PageNo '当前显示的是第几页
Dim RecordCount '总记录条数
If RS.RecordCount=0 then
response.write "<P><center>对不起，数据库中没有相关信息！</center></P>"
response.end
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
&nbsp;&nbsp;&nbsp;&nbsp;心水列表如下: 共计 <%=RS.recordcount%> 条记录<br><br>
<table width="96%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr align="center" valign="middle"> 
    <td width="11%" height="30" bgcolor="#008306">编号</td>
    <td width="7%" bgcolor="#008306"><p>开球<br>
        时间</p>
      </td>
    <td width="12%" bgcolor="#008306">球队A</td>
    <td width="10%" bgcolor="#008306">赔率</td>
    <td width="12%" bgcolor="#008306">球队B</td>
    <td width="11%" bgcolor="#008306">预测</td>
    <td width="8%" bgcolor="#008306">信心指数</td>
    <td width="17%" bgcolor="#008306">发布时间</td>
    <td width="12%" bgcolor="#008306">编辑</td>
  </tr>
  <%
Do while Not Rs.eof and RowCount>0
%>
  <tr align="center" valign="middle" bgcolor="#C9E393"> 
    <td width="11%"> <%=rs("ball_id")%> [<a href="<%=fileName%>.asp?ball_id=<%=rs("ball_id")%>&del=del&pageno=<%=pageno%>">删除</a>]</td>
    <td width="7%"><%=formatdatetime(rs("ball_starttime"),4)%></td>
    <td width="12%"><%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("team_a"),conn,1,1 %><%=brs("team_name")%><%brs.close%></td>
    <td width="10%"><%
			set rs1=server.createobject("adodb.recordset")
rs1.open "select * from ball_pl where ball_pl_id="&rs("ball_pl"),conn,1,3%><%=rs1("ball_pl")%><%rs1.close%></td>
    <td width="12%"><%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("team_b"),conn,1,1 %><%=brs("team_name")%><%brs.close%></td>
    <td width="11%"><%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("ball_test"),conn,1,1 %><%=brs("team_name")%><%brs.close%></td>
    <td width="8%"><img src="<%=rs("ball_xx")%>"></td>
    <td width="17%"><%=rs("ball_addtime")%></td>
    <td width="12%">[<a href="ball_end.asp?ball_id=<%=rs("ball_id")%>">结果</a>][<a href="ball_edit.asp?ball_id=<%=rs("ball_id")%>">编辑</a>]</td>
  </tr>
  <%
RowCount = RowCount - 1
Rs.MoveNext
Loop
%>
</table>
<br>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle"> 
      <td><!--#include file="../public/page.asp"-->
	</td>
      </tr>
</table>
<%rs.close
set rs=nothing
conn.close
set conn=nothing%>
<br>
<br>
 <!--#include file="../public/copyright.inc"-->