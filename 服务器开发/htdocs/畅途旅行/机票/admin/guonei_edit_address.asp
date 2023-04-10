<!--#include file="../inc/conn1.inc"-->
<%
UserName=session("UserName")
PassWord=session("PassWord")
Set rs1 = Server.CreateObject("ADODB.RecordSet")
sql1 = "select * from manager_users where UserName = '"&UserName&"' and password='"&password&"'"
rs1.open sql1,conn,3,2
if rs1("id")="" then
response.redirect "login.asp?pd=用户名密码不正确！"
end if
id=request("id")
if Request("submit")="提交" then
  Set rs1 = Server.CreateObject("ADODB.RecordSet")
  
sql = "update address set address='"& Request("address")&"'  where id="&id&""

rs1.open sql,conn,3,2
Response.Redirect("guonei_address.asp")
end if
Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from address where id="&id&""
rs.open sql,conn,3,2


%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<style type="text/css">
A:link {COLOR: blue; TEXT-DECORATION: none}
A:visited {COLOR: red;TEXT-DECORATION: none}
A:active {COLOR: red; TEXT-DECORATION: none}
A:hover {COLOR: #ff0000; TEXT-DECORATION: none}
A:hover {color:#ff0000;}
a:link.a01 {text-decoration:none;color:#FFFFFF;}
a:visited.a01 {text-decoration:none;color:#FFFFFF;}
a:active.a01 {text-decoration:none;color:#FFFFFF;}
a:hover.a01 {text-decoration:none;color:#505050;}
BODY {FONT-FAMILY: 宋体; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.l15{line-height:150%}
.样式1 {color: #FFFFFF}
</style>
<title><%=site_name%></title>
</head>

<body topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="15%" valign="top">





<!--#include file="../inc/left.inc"-->



    </td>
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">
      <form method="POST">
      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
        
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">修改国际目的地</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
              <table border="0" cellpadding="5" cellspacing="1" width="100%">
                <tr>
                  <td width="24%" bgcolor="#0A5092" align="center">
                    <p align="center" class="样式1">国内目的地</td>
                  <td width="76%" bgcolor="#E9EEF8"><input name="address" type="text" id="address" value="<%=rs("address")%>" size="55"></td>
                </tr>
                <tr>
                  <td colspan="2" bgcolor="#E9EEF8">
                    <p align="center"><input type="submit" value="提交" name="submit"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>
      </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</body>

</html>
