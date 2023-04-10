<!--#include file="../inc/conn1.asp"-->
<%
title=request("title")
content=request("content")
content=replace(content,chr(32),"&nbsp;")
content=Replace(content,chr(13),"<BR>")
sort=request("sort")
Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from news"
rs.open sql,conn,3,2

rs.addnew
rs("title")=title
rs("content")=content
rs("sort")=sort
rs.update
Response.Redirect("news.asp")


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
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <form method="POST" action="news_add_ok.asp">
              <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122"><center>
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">添加最新信息</td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top"> <p align="center"><br>
                        <br>
                        添加成功<br>
                        <br>
                        <a href="news.asp">请返回&gt;&gt;&gt;</a> </td>
                  </tr>
                </table>
              </div>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
