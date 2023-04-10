<!--#include file="../inc/conn1.asp"-->
<%
id=request("id")

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from gg where id="&id&""
rs.open sql,conn,3,2


%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
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
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body class="body" topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <form method="POST" action="gg_edit_ok.asp">
              <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122"><center>
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">修改公告</td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top"> <table border="0" cellpadding="5" cellspacing="1" width="100%">
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center"> <p align="center"><font color="#FFFFFF">主题</font></td>
                          <td width="80%" bgcolor="#E9EEF8"><input type="text" name="title" size="55" value="<%=rs("title")%>"></td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center"><font color="#FFFFFF">内容</font></td>
                          <td width="80%" bgcolor="#E9EEF8"><textarea rows="11" name="content" cols="53"><%=rs("content")%></textarea></td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center"><font color="#FFFFFF">时间</font></td>
                          <td width="80%" bgcolor="#E9EEF8"><%=now()%></td>
                        </tr>
                        <tr> 
                          <td width="100%" colspan="2" bgcolor="#E9EEF8"> <p align="center"> 
                              <input type="submit" value="提交" name="B1">
                          </td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
              </div>
              <input type="hidden" name="id" value="<%=id%>">
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
