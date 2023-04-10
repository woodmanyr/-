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

if Request.Form("Submit3")="修改积分" then
 for i=1 to Request.Form("num").Count
 strSel="select * from member where id="&Request.Form("hidlevel")(i)
 rs.Open strSel,conn,3,3
 rs("moncount")=Request.Form("num")(i)
 rs.update
 rs.close
 next
 ' Response.Redirect("?page="&Request.QueryString("page"))
end if

if Request.QueryString("action")="del" then
  id=Request.QueryString("id")
  strSel="delete * from member where id="&id
  conn.Execute (strSel)
  Response.Redirect("?page="&Request.QueryString("page"))
end if
strSel="select * from member order by id desc"
rs.Open strSel , conn , 3 ,3
%>
<body class="body">
<form method="post" >
<table width="100%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#7594E6">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="font">
      <tr>
        <td height="25" bgcolor="#7492EB"><div align="right"></div></td>
      </tr>
      <tr>
        <td height="47" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF" class="font">
                <tr bgcolor="#7493E4"> 
                  <td width="120" height="23" bgcolor="#93ABEA"><div align="center"> 
                      会员登录名 </div></td>
                  <td width="100" bgcolor="#93ABEA"><div align="center"> 真实姓名 </div></td>
                  <td width="31" bgcolor="#93ABEA"><div align="center">性别</div></td>
                  <td width="82" bgcolor="#93ABEA"><div align="center"> 生日</div></td>
                  <td width="106" bgcolor="#93ABEA"><div align="center"> 电子邮箱 
                    </div></td>
                  <td width="84" bgcolor="#93ABEA"><div align="center"> 固定电话 </div></td>
                  <td width="88" bgcolor="#93ABEA"><div align="center">手机 </div>
                    <div align="center"></div></td>
                  <td width="52" bgcolor="#93ABEA"><div align="center">积分</div></td>
                  <td width="208" bgcolor="#94AAEF"><div align="center">详细地址 </div></td>
                  <td width="125" bgcolor="#94AAEF"><div align="center"></div>
                    <div align="center">操作</div></td>
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
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("username")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("contact1")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("sex")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("birthday")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("email")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("tel1")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><%=rs("mobile")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><input name="num" type="text" class="input1" id="num" value="<%=rs("moncount")%>" size="4"> 
                    <input name="hidlevel" type="hidden" id="hidlevel2" value="<%=rs("id")%>" size="4"></td>
                  <td height="24" align="center"><%=rs("address")%></td>
                  <td height="24" align="center" bgcolor="#D6DFF7"><div align="center">　　<a href=?action=del&id=<%=rs("id")%>>删 
                      除</a>　 </div>
                    <div align="center"></div></td>
                </tr>
                <%
		  rs.MoveNext
		  next%>
                <tr bgcolor="#94AAEF"> 
                  <td height="22" colspan="12"  bgcolor="#94AAEF"><div align="right"> 
                      <!--反选-->
                      <input type="checkbox" name="checkbox" value="Check All" onClick="mm()" style="display:none ">
                      <input name="Submit3" type="submit" id="Submit" value="修改积分">
                    </div></td>
                </tr>
              </table></td>
      </tr>
    </table>
      <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="font">
        <tr>
          <td bgcolor="#94AAEF"><p align="right">
            <%if page<=1 then%>
  首页 上一页
  <%else%>
  <a href="produce.asp?page=1">首页</a> <a href="produce.asp?page=<%=page-1%>">上一页</a>
  <%end if%>
  <%if page>=rs.PageCount then%>
  下一页 最后一页
  <%else%>
  <a href="produce.asp?page=<%=page+1%>">下一页</a> <a href="produce.asp?page=<%=rs.PageCount%>">最后一页</a>
  <%end if%>
  转到
  <input name="page" type="text" size="2">
  页
  <input type="submit" name="Submit" value="确定">
          </p></td>
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
</form>
</body>
</html>
