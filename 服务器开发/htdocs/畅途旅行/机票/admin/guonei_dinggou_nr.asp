<!--#include file="../inc/conn1.asp"-->
<%

id=request("id")

Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from buy where id="&id&""
rs.open sql,conn,3,2

Set rs_ren = Server.CreateObject("ADODB.RecordSet")
sql_ren = "select * from people where titleid="&rs("id")&""
rs_ren.open sql_ren,conn,3,2


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
        <table border="1" cellpadding="0" cellspacing="0" width="95%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF">
        <center>
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="25">
              <p align="center">国内航班订购情况</td>
        </tr>
          <tr>
            <td width="100%" valign="top">
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
                </tr>
                
                
                <%

                
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
                </tr>


               
       </table>
            </td>
          </tr>
          <tr>
            <td width="100%" height="10" valign="middle">&nbsp;
             
            </td>
          </tr>
        <tr>
            <td width="100%" height="25" valign="middle" bgcolor="#E9EEF8">
            <p align="center">订购情况
            </td>
        </tr>
        <tr>
            <td width="100%" valign="middle">
            <table border="0" cellpadding="0" cellspacing="1" width="100%">
              <tr>
                <td width="50%" bgcolor="#E9EEF8">
                  <p align="center">订购联系人</td>
                <td width="50%" bgcolor="#E9EEF8">
                  <p align="center">其他购票资料</td>
              </tr>
              <tr>
                <td width="50%" valign="top">
                  <table border="0" cellpadding="4" cellspacing="1" width="100%">
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">姓名</td>
                      <td width="19%"><%=rs("name")%></td>
                      <td width="20%">性别</td>
                      <td width="43%"><%if rs("sex")<>"" then Response.Write(rs("sex"))%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">手机号码</td>
                      <td colspan="3"><%=rs("people_number")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">联系电话</td>
                      <td colspan="3"><%=rs("phone")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">联系地址</td>
                      <td colspan="3"><%=rs("address")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">E-mail</td>
                      <td colspan="3"><%=rs("email")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">QQ</td>
                      <td colspan="3"><%=rs("qq")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">乘机时间</td>
                      <td colspan="3"><%=rs("goTime")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">返回时间</td>
                      <td colspan="3"><%=rs("backTime")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">备注</td>
                      <td colspan="3"><%=rs("more")%></td>
                    </tr>
                    <tr>
                      <td width="18%" bgcolor="#E9EEF8">购买数量</td>
                      <td colspan="3"><%=rs("number")%></td>
                    </tr>
                  </table>
                </td>
                <td width="50%" valign="top">
                  <table border="0" cellpadding="0" cellspacing="1" width="100%">
                    <tr>
                      <td width="33%" bgcolor="#E9EEF8" align="center">姓名</td>
                      <td width="67%" bgcolor="#E9EEF8" align="center">身份证号</td>
                    </tr>
                    
<%
for i=1 to rs("number")
%>
                    <tr>
                      <td width="33%">
                        <p align="center"><%response.write rs_ren("name"&i&"")%></td>
                      <td width="67%">
                        <p align="center"><%response.write rs_ren("number"&i&"")%></td>
                    </tr>
<%next%>
                    
                    
                  </table>
                </td>
              </tr>
            </table>
            </td>
        </tr>
        <tr>
            <td width="100%" valign="middle" height="25">
            <p align="center"><a href="guonei_dinggou.asp">返回&gt;&gt;&gt;</a>
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
