<!--#include file="inc/conn.asp"-->

<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from student where id="&id&""
rs.Open sql,conn,3,2

name=request("name")
if name="" then name="无"
people_number=request("people_number")
if people_number="" then people_number="无"
phone=request("phone")
if phone="" then phone="无"
address=request("address")
if address="" then address="无"
email=request("email")
if email="" then email="无"
qq=request("qq")
if qq="" then qq="无"
more=request("more")
if more="" then more="无"
number=int(request("number"))
sex=Request("sex")
goTime=request("GoDateYear")&"-"&request("GoDateMonth")&"-"&request("GoDateDay")

'backTime=request("BackDateYear")&"-"&request("BackDateMonth")&"-"&request("BackDateDay")
backTime=request("BackDate")

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
.样式1 {
	color: #FFFFFF;
	font-weight: bold;
}
</style>
<title><%=site_name%></title>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="500">
    <tr>
      <td width="100%">

        <table width="500" height="57" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CA9800" bordercolordark="#FFFFFF">
          <tr bgcolor="#ECB100">
            <td width="16%" height="31" align="center"><strong><font color="#FFFFFF">目的地</font></strong></td>
            <td width="14%" height="31" align="center"><strong><font color="#FFFFFF">机场</font></strong></td>
            <td width="16%" height="31" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">航空公司</font></strong></td>
            <td width="12%" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">出发时间</font></strong></td>
            <td width="12%" height="31" align="center"><strong><font color="#FFFFFF">到达时间</font></strong></td>
            <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">全价</font></strong></td>
            <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">特价</font></strong></td>
          </tr>
          <tr>
            <td width="16%" height="18" align="center"><%=rs("address")%></td>
            <td width="14%" height="18" align="center"><%=rs("plane")%></td>
            <td width="16%" height="18" align="center"><%=rs("company")%></td>
            <td width="12%" height="18" align="center"><%=rs("fromtime")%></td>
            <td height="18" align="center"><%=rs("totime")%></td>
            <td width="15%" height="18" align="center"><%=rs("price")%></td>
            <td width="15%" height="18" align="center"><font color="#FF0000"><%=rs("minprice")%></font></td>
          </tr>
        </table></td>
    </tr>
    <tr>
      <td width="100%">
      </td>
    </tr>
    <tr>
      <td width="100%" height="10">
      <form method="POST" action="student_ok.asp">
        <div align="center">
          <table border="1" cellspacing="0" width="500" bordercolorlight="#CA9800" bordercolordark="#FFFFFF" cellpadding="5">
          
          
            <tr bgcolor="#FFF5D7">
              <td width="33%" align="center">乘机人姓名</td>
              <td width="67%" align="center">乘机人身份证号或护照号</td>
            </tr>
            
<%for i=1 to number%>            
            
            
            
            <tr>
              <td width="33%" align="center"><input type="text" name="name<%=i%>" size="20"></td>
              <td width="67%" align="center"><input type="text" name="number<%=i%>" size="40"></td>
            </tr>
          
<%next%>

            
            <tr bgcolor="#FFF5D7">
              <td width="100%" colspan="2">
                <p align="center">
                  <input type="submit" value="提交" name="B1">&nbsp; 
                <input type="reset" value="全部重写" name="B2"></p>              </td>
            </tr>
          </table>
        </div>
        <input type="hidden" name="id" value="<%=id%>"><input type="hidden" name="sex" value="<%=sex%>">
		<input type="hidden" name="name" value="<%=name%>">
		<input type="hidden" name="people_number" value="<%=people_number%>">
		<input type="hidden" name="address" value="<%=address%>"><input type="hidden" name="email" value="<%=email%>">
		<input type="hidden" name="phone" value="<%=phone%>"><input type="hidden" name="more" value="<%=more%>">
		<input type="hidden" name="number" value="<%=number%>"><input type="hidden" name="qq" value="<%=qq%>">
		<input type="hidden" name="goTime" value="<%=goTime%>"><input type="hidden" name="backTime" value="<%=backTime%>">
      </form>
      </td>
    </tr>
    <tr>
      <td width="100%">&nbsp;
      </td>
    </tr>
    <tr>
      <td width="100%" height="10"></td>
    </tr>
  </table>
</div>
</body>

</html>
