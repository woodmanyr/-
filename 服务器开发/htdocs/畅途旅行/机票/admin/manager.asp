<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="../inc/conn1.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理－用户管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<style type="text/css">
<!--
.style1 {
	color: #FF0000;
	font-weight: bold;
}
-->
</style>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%
set rs=Server.CreateObject("AdoDb.Recordset")
if Request("add")="确定" then
  user_name=Trim(Request.Form("user_name"))
  password=Trim(Request.Form("password"))
  id=Request.QueryString("id")
  if Request.QueryString("id")<>"" then
   strSel="select * from admin where id="&id
   rs.Open strSel,conn,3,3
  else
   strSel="select * from admin"
   rs.Open strSel,conn,3,3
   rs.addnew
  end if
   
   rs("name")=user_name
   rs("password")=password
   rs.update
   rs.close
   Response.Redirect("manager.asp")
end if
if Request.QueryString("action")="edit" then
  set rs1=Server.CreateObject("AdoDb.Recordset")
 id=Request.QueryString("id")
  strSel="select * from admin where id ="&id
  rs1.Open strSel,conn,3,3
end if
if Request.QueryString("action")="del" then
  id=Request.QueryString("id")
  strSel="delete * from admin where id="&id
  conn.Execute (strSel)
  Response.Redirect("manager.asp")
end if
strSel="select * from admin order by id desc"
rs.Open strSel , conn , 1 ,3
%>
<script language="javascript">
 function check(){
   if (document.myform.user_name.value==""){
     alert("请填写管理员名称!");
     return false;
   }
   if (document.myform.password.value==""){
     alert("请填写管理员密码!");
     return false;
   }
 }
  
</script>
<body class="body">
<form method="post"  name="myform" onSubmit="return check()">
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#3462DA">
  <tr>
    <td valign="top" bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="0" class="font">
      <tr>
        <td height="12" bgcolor="#7B9AE7"><div align="right">
            <table width="570" height="21" border="0" align="center" cellpadding="0" cellspacing="0">
              <tr>
                <td>姓名：</td>
                <td><input name="user_name" type="text" class="input" id="user_name"  size="16" <%if Request.QueryString("action")="edit" then%> value='<%=rs1("name")%>' 
			  <%end if%>>
                </td>
                <td>密码：</td>
                <td><input name="password" type="password" class="input" id="password" size="16" <%if Request.QueryString("action")="edit" then%> 
			  value='<%=rs1("password")%>'
			  <%end if%>></td>
                <td><input name="add" type="submit" id="add" value="确定"></td>
              </tr>
            </table>
          </div>
            <div align="center"></div></td>
      </tr>
      <tr>
        <td height="47" valign="top"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
            <tr bgcolor="#7B9AE7">
              <td width="518" height="23"><div align="center">管理员名称</div></td>
              <td colspan="2"><div align="center">操作</div></td>
            </tr>
            <%for i=0 to rs.RecordCount
		  if rs.Eof then Exit for
		  %>
            <tr bgcolor="#D6DFF7">
              <td height="24" align="center"><%=rs("name")%></td>
              <td width="114"><div align="center"><a href =?action=edit&id=<%=rs("id")%>>修 改</a> </div></td>
              <td width="142"><div align="center"><a href=?action=del&id=<%=rs("id")%>>删 除</a> </div></td>
            </tr>
            <%rs.MoveNext
		  next%>
        </table></td>
      </tr>
    </table></td>
  </tr>
</table>
</form>
</body>
</html>
