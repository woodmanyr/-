<!--#include file="../inc/conn1.asp"-->
<%
Set rs_area = Server.CreateObject("ADODB.RecordSet")
sql_area = "select * from area"
rs_area.open sql_area,conn,3,2
%>
<%if Request("err")="1" then%>
   <script>alert("��ѡ�����")</script>
<%end if%>
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
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
BODY {FONT-FAMILY: ����; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.l15{line-height:150%}
.��ʽ1 {color: #FFFFFF}
</style>
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" class="body" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr>
    <td width="85%" valign="top">
      <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr>
          <td width="100%" height="14">
      <form method="POST" name="form1" action="guoji_country_add_ok.asp">
      <div align="center">
        <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
        <center>
        <tr>
            <td width="100%" bgcolor="#E9EEF8" height="20">
              <p align="center">��ӹ���</td>
        </tr>
          <tr>
            <td width="100%" height="46" valign="top">
              <table border="0" cellpadding="5" cellspacing="1" width="100%">
                <tr>
                  <td width="20%" bgcolor="#0A5092" align="center">
                    <p align="center" class="��ʽ1">ѡ����ݣ�</td>
                  <td width="80%" bgcolor="#E9EEF8"><SELECT id=areaid 
                               name=areaid>
							   <OPTION value=0 selected>ѡ�����</OPTION>
							   <%
							   for i=0 to rs_area.RecordCount
							   if rs_area.Eof then Exit for
							   %>
                    <OPTION   value="<%=rs_area(0)%>"><%=rs_area(1)%></OPTION>
					<%
					rs_area.MoveNext
					next
					%>
                   
                  </SELECT>                          </td>
                </tr>
                <tr>
                  <td bgcolor="#0A5092" align="center"><font color="#FFFFFF">�������ң�</font></td>
                  <td width="80%" bgcolor="#E9EEF8"><input type="text" name="country" size="42"></td>
                </tr>
                <tr>
                  <td width="100%" colspan="2" bgcolor="#E9EEF8">
                    <p align="center"><input type="submit" value="�ύ" name="B1"></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </div>
      </form>
          </td>
        </tr>
      </table>
    </td>
  </tr>
</table>

</body>

</html>
