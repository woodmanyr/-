<!--#include file="../inc/conn1.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>后台管理－添加旅游</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%
set rs=Server.CreateObject("AdoDb.RecordSet")
action=Request.QueryString("action")
strSel="select * from dingfang"
if action="edit" then
    id=Request.QueryString("id")
    strSel=strSel & " where id="&id
end if
rs.Open strSel,conn,3,3
action=Request.QueryString("action")
if Request.Form("Submit1")<>"" then
  class_id=Request.Form("class_id")
  title=Request.Form("title")  
  content=Request.Form("content")
  flag=Request.Form("flag")
  if flag="" then flag=0
  if action="add" then
    rs.addNew
  elseif action="edit" then 
  else
    Response.Redirect("dingfang.asp")
  end if
    
	rs("title")=title
	rs("flag")=flag 
	rs("content")=content
	rs.Update
	rs.close
Response.Redirect("dingfang.asp")
end if
%>
<script language="javascript">
function check(){  


 if (document.myform.title.value==""){
     alert("请填写标题!");
     return false;
	} 
}
</script>
<body class="body">
<form method="post" name="myform">
<table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#708FE4" class="font">
  <tr>
    <td bgcolor="#FFFFFF"><table width="100%"  border="0" cellpadding="0" cellspacing="1" bgcolor="#FFFFFF">
        <tr bgcolor="#7B9AE7">
          <td width="72%" height="22">
            <div align="center" class="bfont"> 添加信息</div>            </td>
          <td width="28%"><div align="center"><a href="Trip.asp">返回管理页面</a></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td height="22" colspan="2"><div align="right">
              <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                <tr>
                  <td width="19%" height="22"><div align="right"></div></td>
                  <td width="81%" height="11"></td>
                </tr>
				
                <tr>
                  <td height="22"><div align="right">标题：</div></td>
                  <td height="11"><div align="left">
                    <input name="title" type="text" 
					id="title" size="40">
                  </div></td>
                </tr>
                <tr>
                  <td height="22"><div align="right"></div></td>
                  <td height="11"><div align="left">
                    <input name="flag" type="checkbox" id="flag"
					<%if Request.QueryString("action")="edit" then%>
					 <%if rs("flag")=true then%>
 checked
  <%end if%> 
  <%end if%> value="1">
                  </div></td>
                </tr>
                <tr>
                  <td height="24"><div align="right">内容：</div></td>
                  <td height="22">&nbsp;</td>
                </tr>
                <tr>
                  <td height="21" colspan="2"><div align="left">
                    <INPUT type="hidden" name="content"  <%if Request.QueryString("action")="edit" then%>value="<%=Server.HTMLEncode(rs("content"))%>" <%end if%>>
		<IFRAME ID="eWebEditor1" src="htmlEdit/ewebeditor.asp?id=content&style=standard" frameborder="0" scrolling="no" width="550" height="350"></IFRAME>
                  </div></td>
                </tr>
              </table>　　　 
          </div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td height="22" colspan="2" bgcolor="#7B9AE7">　　　　　　　　
            <input name="Submit1" type="submit" value="确 定" onClick="return check()">　　
            <input type="reset" name="Submit2" value="重 置"></td>
        </tr>
    </table></td>
  </tr>
</table>

<script language="javascript">
<% if Request.QueryString("action")="edit" then%>
 
  document.myform.title.value="<%=rs("title")%>";
  
  <%
   rs.close
end if%>
</script> 
</form>
</body>
</html>
