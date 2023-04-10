<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="../inc/conn1.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理－产品管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%
set rs=Server.CreateObject("AdoDb.Recordset")
set rs1=Server.CreateObject("AdoDb.Recordset")
if Request.Form("submit2")="批量删除" then
  for i=1 to Request.Form("checkbox1").count
  strSel="delete  from Trip  where id="&Request.Form("checkbox1")(i)
  conn.Execute(strSel)
 next
  Response.Redirect("?page="&Request.QueryString("page"))
end if 
if Request.QueryString("action")="del" then
  id=Request.QueryString("id")
  strSel="delete * from Trip where id="&id
  conn.Execute (strSel)
  Response.Redirect("Trip.asp")
end if


strSel="select * from dingfang"
rs.Open strSel,conn,3,3
%>
<body class="body">

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#7594E6">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="font">
      <tr>
        <td height="23" bgcolor="#7492EB"><div align="right"><a href="dingfang_add.asp?action=add">添加信息</a></div></td>
      </tr>
      <tr>
        <td height="47" valign="top"><form method="post" name="myform">
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="font">
			  <tr bgcolor="#7493E4">
                <td  bgcolor="#94AAEF"  height="25"><div align="center"><strong>订
                          房 信
                          息</strong></div></td>
			  </tr>
			</table>
		<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="font">
            <tr bgcolor="#7493E4">
              <td height="23" bgcolor="#94AAEF"><div align="center"></div>                <div align="center">信息标题</div></td>
              <td width="214" bgcolor="#94AAEF"><div align="center"></div>                <div align="center">操作</div></td>
              <td width="67" bgcolor="#94AAEF"><div align="center"></div></td>
            </tr>
            <%	
			page=Request("page") 
	if page="" then
	  page=1
	 end if				 
   rs.pagesize=10
   page=clng(page)    
   if page>rs.pagecount then    
  'page=rs.pagecount    
  end if    
   if page<1 then    
  page=1    
  end if    
 if rs.RecordCount<>0 then
 rs.absolutePage=page    
  end if
  for ipage=1 to rs.pagesize  
               If rs.eof then exit for 
		  %>
            <tr bgcolor="#D6DFF7">
			<td height="24" align="center" bgcolor="#D6DFF7"><a href='../dingfang_show.asp?id=<%=rs("id")%>' target="_blank"><%=rs("title")%></a></td>
              <td height="24" align="center"><div align="center"><a href =dingfang_add.asp?action=edit&id=<%=rs("id")%>>修 改</a>　　<a href="dingfang_del.asp?id=<%=rs("id")%>">删 除</a> 　<a href="../dingfang_show.asp?id=<%=rs("id")%>" target="_blank">查 看</a> 　 </div>                <div align="center"></div></td>
              <td height="24" align="center"><div align="center"></div></td>
            </tr>
            <%
		  rs.MoveNext
		  next%>
		  <tr bgcolor="#94AAEF">
		  <td height="22" colspan="3"  bgcolor="#94AAEF"><div align="right">反选
              <input type="checkbox" name="checkbox" value="Check All" onClick="mm()">
		    
		  </div></td>
		  </tr>
        </table>
        </form></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font">
        <tr>
          <td bgcolor="#94AAEF"><form method="get" ><p align="right">
            <%if page<=1 then%>
  首页 上一页
  <%else%>
  <a href="?page=1&id=<%=Request.QueryString("id")%>&type_id=<%=type_id%>">首页</a> <a href="?page=<%=page-1%>&id=<%=Request.QueryString("id")%>&type_id=<%=type_id%>">上一页</a>
  <%end if%>
  <%if page>=rs.PageCount then%>
  下一页 最后一页
  <%else%>
  <a href="?page=<%=page+1%>&id=<%=Request.QueryString("id")%>&type_id=<%=type_id%>">下一页</a> <a href="?page=<%=rs.PageCount%>&id=<%=Request.QueryString("id")%>&type_id=<%=type_id%>">最后一页</a>
  <%end if%>
  转到
  <input name="page" type="text" size="2">
  页
  <input type="submit" name="Submit" value="确定">
          </p></form></td>
        </tr>
      </table></td>
  </tr>
</table>
<script language=javascript>
function mm()
{
   var a = document.getElementsByTagName("input");
   if(a[0].checked==true){
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = false;
   }
   else
   {
   for (var i=0; i<a.length; i++)
      if (a[i].type == "checkbox") a[i].checked = true;
   }
}
</script>
</body>
</html>
