<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->

<%
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "SELECT * From user ORDER BY user_id DESC",conn,1,1 
'删除
if request("del")="del" then
dsql="delete * from user where user_id="&request("user_id")
conn.execute dsql
response.write"<script>alert('用户已成功删除！');location.href='user_list.asp?pageno="%><%=request("pageno")%><%response.write"';</Script>"
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
response.write "< P>< center>对不起，数据库中没有相关信息！< /center>< /P>"
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
&nbsp;&nbsp;&nbsp;&nbsp;用户列表如下: 共计 <%=RS.recordcount%> 条记录<br><br>
<table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr align="center" valign="middle"> 
    <td width="5%" bgcolor="#008306">编号</td>
    <td width="13%" bgcolor="#008306">会员卡号</td>
    <td width="13%" bgcolor="#008306">用户名</td>
    <td width="8%" bgcolor="#008306">真实姓名</td>
    <td width="5%" bgcolor="#008306">性别</td>
    <td width="9%" bgcolor="#008306">电子邮件</td>
    <td width="19%" bgcolor="#008306">注册日期</td>
    <td width="11%" bgcolor="#008306">用户组</td>
    <td width="17%" bgcolor="#008306">编辑</td>
  </tr>
  <%
Do while Not Rs.eof and RowCount>0
%>
  <tr align="center" valign="middle" bgcolor="#C9E393"> 
    <td width="5%"> <%=rs("user_id")%></td>
    <td width="13%"><%=rs("user_member")%></td>
    <td width="13%"><%=rs("user_name")%></td>
    <td width="8%"><%=rs("user_xm")%></td>
    <td width="5%"> 
      <%if rs("user_sex")=1 then response.write("男") else if rs("user_sex")=0 then response.write("女")  else response.write("<font color=red>无</font>") end if%>
    </td>
    <td width="9%"><a href="mailto:<%=rs("user_mail")%>">发邮件</a></td>
    <td width="19%"><%=rs("user_regtime")%></td>
    <td width="11%"> 
      <%
	set rs3=Server.CreateObject("Adodb.Recordset")
sql="SELECT * From user_group where user_group_id="&rs("user_group_id")
rs3.open sql,conn,1,3
		%>
      <%=rs3("user_group")%></td>
    <td width="17%"> [<a href="user_edit.asp?user_id=<%=rs("user_id")%>">编辑</a>] 
      [<a href="user_list.asp?user_id=<%=rs("user_id")%>&del=del&pageno=<%=pageno%>">删除</a>]</td>
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
<br>
<br>
