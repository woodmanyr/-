<!--#include file="../inc/conn1.asp"-->
<%
page=request("page")
if page="" then
page=1
end if

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from area"
rs.open sql,conn,3,2

%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<style type="text/css">

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
<form method="post"></form>
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
          <tr>
            <td width="100%" bgcolor="#FFFFFF" height="20">
              <p align="right"><a href="guoji_area_add.asp">添加大州&gt;&gt;&gt;</a></td>
          </tr>
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">国际大州目的地管理</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
              <table border="0" cellspacing="1" width="100%">
                <tr>
                  <td width="55%" bgcolor="#0A5092">
                    <p align="center"><font color="#FFFFFF">大州目的地</font></p>                  </td>
                  <td width="20%" bgcolor="#0A5092">
                    <p align="center"><font color="#FFFFFF">操作</font></p>
                  </td>
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
if Not rs.Eof then  
rs.absolutePage=page    
for ipage=1 to rs.pagesize  
                %>
                <tr>
                  <td width="55%">
                    <p align="center"><%=rs("area")%></td>
                  <td width="20%">
                    <p align="center"><a href="guoji_area_edit.asp?id=<%=rs("areaid")%>">[修改]</a><a href="guoji_area_del.asp?id=<%=rs("areaid")%>"> [删除]</a></p> 
                  </td>
                </tr>
                <%
                rs.movenext
                If rs.eof then exit for
                next
                %>
                
              </table>
            </td>
          </tr>
          <tr>
            <td width="100%" height="26" valign="middle">
            <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs.pagecount%>  
            </font> 页 </b>&nbsp;<font face="webdings"><a href="guoji_address.asp?page=1"><font color="#484848">9</font></a></font>   
            <font face="webdings"><a href="guoji_area.asp?page=<%=page-1%>"><font color="#484848">7</font></a></font>[   
            <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guoji_area.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
     end if
     
            %>
            ]<font face="webdings"><a href="guoji_area.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font>   
            <font face="webdings"><a href="guoji_area.asp?page=<%=rs.PageCount%>"><font color="#484848">:</font></a>   
            </font><b>&nbsp; 当前第 <font color="#990000"><%=page%> 
            </font> 页</b></font>
            </td>
          </tr>
        </table>
      </div>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>
</body>
</form>
</html>
