<!--#include file="../inc/conn1.asp"-->
<%
country=request("country")
areaid=Request("areaid")
id=request("id")
if areaid=0 then
  areaid=1
 end if
Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from country where countryid="&id
rs.open sql,conn,3,2


rs("country")=country
rs("areaid")=areaid
rs.update
Response.Redirect("guoji_country.asp")


%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
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
BODY {FONT-FAMILY: ����; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.l15{line-height:150%}
</style>
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" class="body" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">
      <form method="POST" >
      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
      
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">���Ŀ�ĵ�</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
            <p align="center"><br>
            <br>
            ��ӳɹ�<br>
            <br>
            <a href="guoji_country.asp">�뷵��&gt;&gt;&gt;</a>
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
