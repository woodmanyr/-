<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_name%></title>
<link rel="stylesheet" href="inc/css.css"  type="text/css">
 
<%

   set rs_ding=Server.CreateObject("ADODB.Recordset")
   strSel="Select * from dinggao where hangban='guonei'"
   rs_ding.Open strSel,conn,3,2
page=request("page")
if page="" then
page=1
end if
company=request("company")
if company="" then
company="所有航空公司"
end if
address=request("address")

if address="" then
address="请选择航班到达地点"
end if


on error resume next



set rs=server.CreateObject("adodb.recordset")
%>
<%
id=Request.QueryString("id")
strSel="select * from holiday where id="&id
rs.Open strsel,conn,3,3
%>
<style type="text/css">
A:link {	COLOR: #666688; TEXT-DECORATION: none; FONT-SIZE:9pt; cursor: hand;}
A:visited {	COLOR: #666688; TEXT-DECORATION: none; FONT-SIZE:9pt; cursor: hand;}
A:active {COLOR: red; TEXT-DECORATION: none}
A:hover {	COLOR: #FFbb99; TEXT-DECORATION: underline; FONT-SIZE:9pt; cursor: hand;}
BODY {FONT-FAMILY: 宋体; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.style10 {color: #FF0000}
.text1 {	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.style15 {font-size: 15px}
.style18 {font-size: 12px; }
</style>
</head>
 
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">


<div align="center">
	
  <p>&nbsp;</p>
  <table width="600"  border="1" cellpadding="6" cellspacing="0" bordercolor="#B7DBA4">
    <%if not rs.eof then%>
    <tr bgcolor="#5F9D3D">
      <td height="26" colspan="2"><span class="style15">【航空票务中心－国内航班特价信息】</span></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="middle" class="style18">目的地：</td>
      <td width="530"><%=rs("address")%></td>
    </tr>
    <tr>
      <td width="80" align="center" valign="middle" class="style18">机场：</td>
      <td><%=rs("plane")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">航空公司：</td>
      <td><%=rs("company")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">出发时间：</td>
      <td><%=rs("fromtime")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">到达时间：</td>
      <td><%=rs("totime")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">航班号：</td>
      <td><%=rs("flycode")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">机型：</td>
      <td><%=rs("planetype")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">每周航班：</td>
      <td><%=rs("flynumber")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">全价：</td>
      <td><%=rs("price")%></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">特价：</td>
      <td><font color="#FF0000"><%=rs("minprice")%></font></td>
    </tr>
    <tr>
      <td align="center" valign="middle" class="style18">预订：</td>
      <td><a href="#" onClick=javascript:window.open('guonei_buy.asp?id=<%=rs("id")%>','','500,400,scrollbars=yes,resizable=yes')><font color="#000000">
                 <%if rs_ding("flag")=0 then%>
      我要预定
      <%end if%>
               </font></a></td>
    </tr>
    <tr align="center">
      <td height="26" colspan="2"><a href="#" class="style15" onclick="window.close()">【关
          闭】</a></td>
    </tr>
    <%end if%>
  </table>
  <p>
    <%rs.close%>
  </p>
</div>

</body>

</html>