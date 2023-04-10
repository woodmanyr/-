<!--#include file="../inc/conn1.asp"-->
<%
page=request("page")
if page="" then
page=1
end if

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select id,address from address"
if Request.Form("Submit")="添加" then
  sql=sql+" where address like '%"&Trim(Request.Form("address"))&"%'"
end if
  sql=sql+" order by address asc"
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
.style1 {color: #FFFFFF}
</style>
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0"  class=body>
<form method="post">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <div align="center"> 
              <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="134">
                <tr> 
                  <td width="100%" bgcolor="#FFFFFF" height="20"> <p align="right"></td>
                </tr>
                <tr>
                  <td bgcolor="#FFFFFF" height="10"><div align="center">
                    
                        城市：
                        <input name="address" type="text" id="address" size="12">
                    <input type="submit" name="Submit" value="添加">
                  </div></td>
                </tr>
                <tr> 
                  <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">旅游城市管理</td>
                </tr>
                <tr> 
                  <td width="100%" height="46" valign="top"> <table border="0" cellspacing="1" width="100%">
                      <tr> 
                        <td width="55%" bgcolor="#0A5092"> <p align="center" class="style1">城市名</p></td>
                        <td width="20%" bgcolor="#0A5092"> <p align="center"><font color="#FFFFFF">操作</font></p></td>
                      </tr>
                      <%
rs.pagesize=30    
page=clng(page)    
if page>rs.pagecount then    
page=rs.pagecount    
end if    
if page<1 then    
page=1    
end if 
if Not rs.Eof  then rs.absolutePage=page    
for ipage=1 to rs.pagesize  
if rs.Eof then exit for
                %>
                      <tr> 
                        <td width="55%"> <p align="center"><%=rs("address")%></td>
                        <td width="20%"> <p align="center"><a href="guonei_address_edit.asp?id=<%=rs("id")%>">[修改]</a><a href="guonei_address_del.asp?id=<%=rs("id")%>">[删除]</a></p></td>
                      </tr>
                      <%
                rs.movenext
                If rs.eof then exit for
                next
                %>
                    </table></td>
                </tr>
                <tr> 
                  <td width="100%" height="26" valign="middle"> <p align="center"><font color="#333333"><b>共 
                      <font color="#990000"><%=rs.pagecount%> </font> 页 </b>&nbsp;<font face="webdings"><a href="guonei_address.asp?page=1"><font color="#484848">9</font></a></font> 
                      <font face="webdings"><a href="guonei_address.asp?page=<%=page-1%>"><font color="#484848">7</font></a></font>[ 
                      <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guonei_address.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
            %>
                      ]<font face="webdings"><a href="guonei_address.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font> 
                      <font face="webdings"><a href="guonei_address.asp?page=<%=rs.PageCount%>"><font color="#484848">:</font></a> 
                      </font><b>&nbsp; 当前第 <font color="#990000"><%=page%> </font> 
                      页</b></font> </td>
                </tr>
              </table>
            </div></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>

</html>
