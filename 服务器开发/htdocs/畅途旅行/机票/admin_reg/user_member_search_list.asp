<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<%
user_member=trim(request("user_member"))
user_group_id=trim(request("user_group_id"))
user_money=request("user_money")
user_vip=trim(request("user_vip"))


set rs=Server.CreateObject("Adodb.Recordset")
if user_name="" and user_group_id="" and user_money="" and user_vip="" and trim(request("user_vip_s"))="" and trim(request("user_vip_e"))="" then
rs.open "SELECT * From user ORDER BY user_id DESC",conn,1,1 
else
hrefdate=""
sql1="select * from user where user_id like '%'"
if user_member<>"" then
   sql1=sql1 & " and user_member like '%"&user_member&"%'"
    hrefdate=hrefdate & "&user_member=" & user_member
end if
if user_group_id<>"" then
   sql1=sql1 & " and user_group_id like '"&user_group_id&"'"
   hrefdate=hrefdate & "&user_group_id=" & user_group_id
end if
if user_money<>"" then
   sql1=sql1 & " and user_money > "&user_money&""
   hrefdate=hrefdate & "&user_money=" & user_money
end if
if user_vip<>"" then
   sql1=sql1 & " and user_vip like '"&user_vip&"'"
   hrefdate=hrefdate & "&user_vip=" & user_vip
end if
if request("user_vip_s")<>"" then
user_vip_s=formatdatetime(request("user_vip_s"),2)
   sql1=sql1 & " and user_vip_s like '"&user_vip_s&"'"
   hrefdate=hrefdate & "&user_vip_s=" & user_vip_s
end if
if request("user_vip_e")<>"" then
user_vip_e=formatdatetime(request("user_vip_e"),2)
   sql1=sql1 & " and user_vip_e like '"&user_vip_e&"'"
   hrefdate=hrefdate & "&user_vip_e=" & user_vip_e
end if
sql1=sql1 & " ORDER BY user_id DESC"

rs.open sql1,conn,3,2
end if 

'删除
if request("del")="del" then
dsql="delete * from user where user_id="&request("user_id")
conn.execute dsql
response.write"<script>alert('用户已成功删除！');location.href='list.asp?pageno="%><%=request("pageno")%><%response.write"';</Script>"
end if
%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>
<br>
<br>
<%
Dim TotalPage '总页数
Dim PageNo '当前显示的是第几页
Dim RecordCount '总记录条数
If RS.RecordCount=0 then
response.write "<P><center>对不起，没找到符合条件的信息！</center></P>"
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
&nbsp;&nbsp;&nbsp;&nbsp;搜索到符合条件的用户如下: 共计 <%=RS.recordcount%> 条记录<br><br>
<table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr align="center" valign="middle"> 
    <td width="5%" bgcolor="#008306">编号</td>
    <td width="13%" bgcolor="#008306">会员卡号</td>
    <td width="13%" bgcolor="#008306">用户名</td>
    <td width="8%" bgcolor="#008306">姓名</td>
    <td width="5%" bgcolor="#008306">性别</td>
    <td width="9%" bgcolor="#008306">电子邮件</td>
    <td width="19%" bgcolor="#008306">注册日期</td>
    <td width="10%" bgcolor="#008306">用户组</td>
    <td width="18%" bgcolor="#008306">编辑</td>
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
    <td width="10%"> 
      <%
	set rs3=Server.CreateObject("Adodb.Recordset")
sql="SELECT * From user_group where user_group_id="&rs("user_group_id")
rs3.open sql,conn,1,3
		%>
      <%=rs3("user_group")%></td>
    <td width="18%">[<a href="user_edit.asp?user_id=<%=rs("user_id")%>">编辑</a>] 
      [<a href="user_search_list.asp?user_id=<%=rs("user_id")%>&del=del&pageno=<%=pageno%>">删除</a>]</td>
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
      <td><!--#include file="../public/search_page.asp"-->
	</td>
      </tr>
</table>
<br>
<br>
 <!--#include file="../public/copyright.inc"-->
