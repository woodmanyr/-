<!--#include file="../inc/conn1.asp"-->
<%

set rs=server.CreateObject("adodb.recordset")
sql="select * from address"
rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company3"
rs_company.Open sql_company,conn,3,2

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
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <form method="POST" action="huoche_hangban_add_ok.asp">
              <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122"><center>
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">添加航班</td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top"> 
                      <table border="0" cellpadding="5" cellspacing="1" width="100%" height="336">
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <p align="center"><font color="#FFFFFF">目的地</font> 
                          </td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <select size="1" name="address">
                              <%
                        rs.movefirst
                        for k=1 to rs.recordcount
                        %>
                              <option value="<%response.write     rs("address")%>"> 
                              <%response.write rs("address")%>
                              </option>
                              <%
                        rs.movenext
                        next
                        %>
                            </select>
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">机场</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <select size="1" name="plane">
                              <option selected value="虹桥机场">虹桥机场</option>
                              <option value="浦东机场">浦东机场</option>
                            </select>
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">航空公司</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <select size="1" name="company">
                              <%
                        for l=1 to rs_company.recordcount
                        %>
                              <option value="<%response.write rs_company("company")%>"> 
                              <%response.write rs_company("company")%>
                              </option>
                              <%
                        rs_company.movenext
                        next
                        %>
                            </select>
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">火车班次</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="flycode" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">硬座</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="planetype" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">软座</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="planetype1" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">硬卧上铺</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="flynumber" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">硬卧下铺</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="price" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">软卧上铺</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="minprice" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">软卧下铺</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="flynumber1" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">出发时间</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="fromtime" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">到达时间</font></td>
                          <td width="80%" bgcolor="#E9EEF8" height="27"> 
                            <input type="text" name="totime" size="14">
                          </td>
                        </tr>
                        <tr> 
                          <td width="100%" colspan="2" bgcolor="#E9EEF8" height="27"> 
                            <p align="center"> 
                              <input type="submit" value="提交" name="B1">
                          </td>
                        </tr>
                      </table>
                    </td>
                  </tr>
                </table></center>
                </div>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
