<!--#include file="inc/conn.asp"-->

<%
id=request("id")
name=request("name")
people_number=request("people_number")
phone=request("phone")
address=request("address")
email=request("email")
qq=request("qq")
more=request("more")
number=int(request("number"))
sex=request("sex")
goTime=request("goTime")
backTime=request("backTime")

name1=request("name1")
name2=request("name2")
name3=request("name3")
name4=request("name4")
name5=request("name5")
name6=request("name6")
name7=request("name7")
name8=request("name8")
name9=request("name9")
name10=request("name10")
name11=request("name11")
name12=request("name12")
name13=request("name13")
name14=request("name14")
name15=request("name15")

number1=request("number1")
number2=request("number2")
number3=request("number3")
number4=request("number4")
number5=request("number5")
number6=request("number6")
number7=request("number7")
number8=request("number8")
number9=request("number9")
number10=request("number10")
number11=request("number11")
number12=request("number12")
number13=request("number13")
number14=request("number14")
number15=request("number15")



on error resume next
set rs=server.CreateObject("adodb.recordset")
sql="select * from buy1"
rs.Open sql,conn,3,2
rs.addnew
rs("titleid")=id
rs("name")=name
rs("people_number")=people_number
rs("phone")=phone
rs("address")=address
rs("email")=email
rs("qq")=qq
rs("more")=more
rs("number")=number
rs("sex")=sex
rs("date")=date()
rs("goTime")=goTIme
rs("backTime")=backTIme
rs.update
rs.movelast

set rs1=server.CreateObject("adodb.recordset")
sql1="select * from people1"
rs1.Open sql1,conn,3,2
rs1.addnew
rs1("planeid")=id
rs1("titleid")=rs("id")
rs1("name1")=name1
rs1("name2")=name2
rs1("name3")=name3
rs1("name4")=name4
rs1("name5")=name5
rs1("name6")=name6
rs1("name7")=name7
rs1("name8")=name8
rs1("name9")=name9
rs1("name10")=name10
rs1("name11")=name11
rs1("name12")=name12
rs1("name13")=name13
rs1("name14")=name14
rs1("name15")=name15

rs1("number1")=number1
rs1("number2")=number2
rs1("number3")=number3
rs1("number4")=number4
rs1("number5")=number5
rs1("number6")=number6
rs1("number7")=number7
rs1("number8")=number8
rs1("number9")=number9
rs1("number10")=number10
rs1("number11")=number11
rs1("number12")=number12
rs1("number13")=number13
rs1("number14")=number14
rs1("number15")=number15
rs1.update
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
<title><%=site_name%></title>
</head>

<body topmargin="0" leftmargin="0">

<p>　</p>
<p>　</p>
<p>　</p>
<p>　</p>
<p>　</p>
<div align="center">
  <center>
  <table border="1" cellpadding="15" cellspacing="0" width="300" bordercolorlight="#CA9800" bordercolordark="#FFFFFF">
    <tr>
        <td width="100%" bgcolor="#ECB100"> 
        <p align="center"><strong>订 购 成 功</strong></td>
    </tr>
    <tr>
      <td width="100%">
        <p align="center"><a href="#" onClick="window.close()" >【关 闭】</a></td>
    </tr>
  </table>
  </center>
</div>

</body>

</html>
