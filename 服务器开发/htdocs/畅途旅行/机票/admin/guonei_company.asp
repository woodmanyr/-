<!--#include file="../inc/conn1.asp"-->
<%

page=request("page")
if page="" then
page=1
end if

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from company"
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
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" class="body" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <div align="center"> 
              <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
                <tr> 
                  <td width="100%" bgcolor="#FFFFFF" height="20"> <p align="right"><a href="guonei_company_add.asp">添加航空公司&gt;&gt;&gt;</a></td>
                </tr><center>
                <tr> 
                  <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">国内航空公司地管理</td>
                </tr>
                <tr> 
                  <td width="100%" height="46" valign="top"> <table border="0" cellspacing="1" width="100%">
                      <tr> 
                        <td width="55%" bgcolor="#0A5092"> <p align="center"><font color="#FFFFFF">航空公司</font></p></td>
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
rs.absolutePage=page    
for ipage=1 to rs.pagesize  
                %>
                      <tr> 
                        <td width="55%"> <p align="center"><%=rs("company")%></td>
                        <td width="20%"> <p align="center"><a href="guonei_company_edit.asp?id=<%=rs("id")%>">[修改]</a>&nbsp; 
                            <a href="guonei_company_del.asp?id=<%=rs("id")%>">[删除]</a></p></td>
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
                      <font color="#990000"><%=rs.pagecount%> </font> 页 </b>&nbsp;<font face="webdings"><a href="guonei_company.asp?page=1"><font color="#484848">9</font></a></font> 
                      <font face="webdings"><a href="guonei_company.asp?page=<%=page-1%>"><font color="#484848">7</font></a></font>[ 
                      <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guonei_company.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
            %>
                      ]<font face="webdings"><a href="guonei_company.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font> 
                      <font face="webdings"><a href="guonei_company.asp?page=<%=rs.PageCount%>"><font color="#484848">:</font></a> 
                      </font><b>&nbsp; 当前第 <font color="#990000"><%=page%> </font> 
                      页</b></font> </td>
                </tr>
              </table>
            </div></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
