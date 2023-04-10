<!--#include file="../inc/conn1.asp"-->
<%

page=request("page")
if page="" then
page=1
end if

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from buy"
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

<body class="body" topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">
      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="95%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
        <center>
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">国内航班订购管理</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
              <table border="1" cellpadding="0" cellspacing="0" width="100%" height="52" bordercolorlight="#0A5092" bordercolordark="#FFFFFF">
              
              
              


              
              
                <tr>
                  <td width="9%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">目的地</font></td>
                  <td width="9%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">机场</font></td>
                  <td width="9%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">航空公司</font></td>
                  <td width="9%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">出发时间</font></td>
                  <td width="9%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">到达时间</font></td>
                  <td width="6%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">航班号</font></td>
                  <td width="7%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">机型</font></td>
                  <td width="7%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">全价</font></td>
                  <td width="7%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">特价</font></td>
                  <td width="8%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">购买数量</font></td>
                  <td width="13%" align="center" height="18" bgcolor="#000080"><font color="#FFFFFF">操作</font></td>
                </tr>
                
                
                <%
                
rs.pagesize=35    
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
                
Set rs1 = Server.CreateObject("ADODB.RecordSet")
sql1 = "select * from holiday where id="&rs("titleid")&""
rs1.open sql1,conn,3,2
                %>
                
                <tr>
                  <td width="9%" height="18" align="center"><%=rs1("address")%></td>
                  <td width="9%" height="18" align="center"><%=rs1("plane")%></td>
                  <td width="9%" height="18" align="center"><%=rs1("company")%></td>
                  <td width="9%" height="18" align="center"><%=rs1("fromtime")%></td>
                  <td width="9%" height="18" align="center"><%=rs1("totime")%></td>
                  <td width="6%" height="18" align="center"><%=rs1("flycode")%></td>
                  <td width="7%" height="18" align="center"><%=rs1("planetype")%></td>
                  <td width="7%" height="18" align="center"><%=rs1("price")%></td>
                  <td width="7%" height="18" align="center"><%=rs1("minprice")%></td>
                  <td width="8%" height="18" align="center"><%=rs("number")%></td>
                  <td width="13%" height="18" align="center"><a href="guonei_dinggou_nr.asp?id=<%=rs("id")%>"><font color="#000000">[详细情况]</font></a><font color="#000000">&nbsp;   
                    </font><a href="guonei_dinggou_del.asp?id=<%=rs("id")%>"><font color="#000000">[删除]</font></a></td>
                </tr>
                <%
                rs.movenext
                If rs.eof then exit for
                next
				end if
                %>
                

               
       </table>
            </td>
          </tr>
          <tr>
            <td width="100%" height="26" valign="middle">
            <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs.pagecount%>       
            </font> 页 </b>&nbsp;<font face="webdings"><a href="guonei_dinggou.asp?page=1"><font color="#484848">9</font></a></font>        
            <font face="webdings"><a href="guonei_dinggou.asp?page=<%=page-1%>"><font color="#484848">7</font></a></font>[        
            <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guonei_dinggou.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
            %>
            ]<font face="webdings"><a href="guonei_dinggou.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font>        
            <font face="webdings"><a href="guonei_dinggou.asp?page=<%=rs.PageCount%>"><font color="#484848">:</font></a>        
            </font><b>&nbsp; 当前第 <font color="#990000"><%=page%>   
            </font> 页</b></font>
            </td>
          </tr>
        </table>
            </div>
          </td>
        </tr>
    </table></td>
  </tr>
</table>

</body>

</html>
