<!--#include file="../inc/conn1.asp"-->
<%

id=request("id")
from_city=Request.Form("from_city")
areaid=request("areaid")
countryid=Request("countryid")
address=request("address")
if address="" then address="未选择目的地"
plane=request("plane")
company=request("company")
flycode=request("flycode")
if flycode="" then flycode="   "
planetype=request("planetype")
if planetype="" then planetype="   "
flynumber=request("flynumber")
if flynumber="" then flynumber="   "
price=request("price")
if price="" then price="   "
minprice=request("minprice")
if minprice="" then minprice="   "
fromtime=request("fromtime")
if fromtime="" then fromtime="   "
totime=request("totime")
if totime="" then totime="   "
content=Request("content")
if content="" then content="   "


Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from holiday1 where id="&id
rs.open sql,conn,3,2
rs("from_city")=from_city
rs("areaid")=areaid
rs("countryid")=countryid
rs("address")=address
rs("plane")=plane
rs("company")=company
rs("flycode")=flycode
rs("planetype")=planetype
rs("flynumber")=flynumber
rs("price")=price
rs("minprice")=minprice
rs("fromtime")=fromtime
rs("totime")=totime
rs("content")=content
rs.update
rs.close


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
</style>
<title></title>
</head>

<body topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="15%" valign="top">&nbsp; </td>
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">
      <form method="POST" action="gg_add_ok.asp">
      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
        <center>
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">修改航班</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
            <p align="center"><br>
            <br>
            修改成功<br>
            <br>
			<%%>
            <a href="guoji_hangban.asp">请返回&gt;&gt;&gt;</a>
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
