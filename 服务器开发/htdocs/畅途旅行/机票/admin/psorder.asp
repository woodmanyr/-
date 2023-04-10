<!--#include file="../inc/conn1.asp"-->
<%

page=request("page")
if page="" then
page=1
end if

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from psorder order by id desc"
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
.样式1 {color: #FFFFFF}
</style>
<title></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body class="body" topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="100%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
         
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">自定航程管理</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
              <table border="0" cellpadding="5" cellspacing="1" width="100%">
                <tr>
                  <td width="7%" bgcolor="#0A5092">
                    <p align="center" class="样式1"> 旅客姓名 </p>
                  </td>
                  <td width="6%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 出发点 </span></div></td>
                  <td width="6%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 目的地 </span></div></td>
                  <td width="6%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 转机点 </span></div></td>
                  <td width="8%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 最长停留期 </span></div></td>
                  <td width="9%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 航空公司 </span></div></td>
             
                  <td width="6%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 方向 


 </span></div></td>
                  <td width="8%" bgcolor="#0A5092"><div align="center"><span class="样式1">去往日期 </span></div></td>
                  <td width="9%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 返回日期 </span></div></td>
                  <td width="7%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 期望价格 </span></div></td>
                  <td width="7%" bgcolor="#0A5092"><div align="center"><span class="样式1"> 电话 </span></div></td>
                  <td width="6%" bgcolor="#0A5092">
                    <p align="center" class="样式1"> 传真 </p>
                  </td>
                  <td width="8%" bgcolor="#0A5092"><div align="center"><span class="样式1">Email </span></div></td>
                  <td width="7%" bgcolor="#0A5092">
                    <p align="center" class="样式1">操作</p>
                  </td>
                </tr>
                
                <%
rs.pagesize=15    
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
                  <td width="7%">
                    <p align="center"><%=rs("name")%></td>
                  <td width="6%"><div align="center"><%=rs("fromaddress")%></div></td>
                  <td width="6%"><div align="center"><%=rs("toaddress")%></div></td>
                  <td width="6%"><div align="center"><%=rs("middaddress")%></div></td>
                  <td width="8%"><div align="center"><%=rs("statetime")%></div></td>
                  <td width="9%"><div align="center"><%=rs("company")%></div></td>
                  <td width="6%"><div align="center"><%=rs("auto")%></div></td>
                  <td width="8%"><div align="center"><%=rs("todate")%></div></td>
                  <td width="9%"><div align="center"><%=rs("backdate")%></div></td>
                  <td width="7%"><div align="center"><%=rs("price")%></div></td>
                  <td width="7%"><div align="center"><%=rs("tel")%></div></td>
                  <td width="6%">
                    <p align="center"><%=rs("fax")%></td>
                  <td width="8%"><div align="center"><%=rs("email")%></div></td>
                  <td width="7%">
                    <p align="center">   
                    <a href="psorder_del.asp?id=<%=rs("id")%>">[删除]</a></p> 
                  </td>
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
            </font> 页 </b>&nbsp;<font face="webdings"><a href="?page=1"><font color="#484848">9</font></a></font>  
            <font face="webdings"><a href="?page=<%=page-1%>"><font color="#484848">7</font></a></font>[  
            <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
            %>
            ]<font face="webdings"><a href="?page=<%=page+1%>"><font color="#484848">8</font></a></font>  
            <font face="webdings"><a href="?page=<%=rs.PageCount%>"><font color="#484848">:</font></a>  
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

</html>
