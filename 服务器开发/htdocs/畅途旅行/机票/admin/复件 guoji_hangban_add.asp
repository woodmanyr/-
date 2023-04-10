<!--#include file="../inc/conn1.asp"-->
<%

'set rs=server.CreateObject("adodb.recordset")
'sql="select * from address1"
'rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company1"
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
.style1 {color: #FFFFFF}
</style>
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%dim count%>
<script language = "JavaScript">
subcat = new Array();
subcatz = new Array();
<%
   count = 0
  set rs=server.createobject("adodb.recordset")
  rs.open "select * from country order by country ",conn,1,1
  
   do while not rs.eof 
%>
subcat[<%=count%>] = new Array("<%= trim(rs("country"))%>","<%= rs("areaid")%>","<%= rs("countryid")%>");
<%
        count = count + 1
        rs.movenext
        loop
        rs.close
%>

function changelocation(locationid)
    {
    document.regfrom.countryid.length = 0; 
    document.regfrom.cityid.length = 0; 

    var locationid=locationid;
    var i;
    var j;
    var k;
    j=1;
	document.regfrom.countryid.options[document.regfrom.countryid.length] = new Option( "请选择国家","0");
    for (i=0;i < <%=count%>; i++)
        {
            if (subcat[i][1] == locationid)
            { //这句不是很理解
            if (j==1)
            {
            j=2;
            k=subcat[i][2];
            };
             document.regfrom.countryid.options[document.regfrom.countryid.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
    changelocationz(k);    
    }

<%
   count = 0
  set rs=server.createobject("adodb.recordset")
  rs.open "select * from address1 order by id ",conn,1,1
  
   do while not rs.eof 
%>
subcatz[<%=count%>] = new Array("<%= trim(rs("address"))%>","<%= rs("countryid")%>","<%= rs("id")%>");
<%
        count = count + 1
        rs.movenext
        loop
        rs.close
%>

function changelocationz(locationid)
    {
    document.regfrom.cityid.length = 0; 

    var locationid=locationid;
    var i;
	document.regfrom.cityid.options[document.regfrom.cityid.length] = new Option( "请选择城市","0");
    for (i=0;i < <%=count%>; i++)
        {
            if (subcatz[i][1] == locationid)
            { //这句不是很理解
             document.regfrom.cityid.options[document.regfrom.cityid.length] = new Option(subcatz[i][0], subcatz[i][0]);
            }        
        }
        
    }
</script>
<body class="body" topmargin="0" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <form method="POST" name="regfrom" action="guoji_hangban_add_ok.asp">
              <div align="center">
                <p><img src="images/xp1.jpg" width="606" height="574">
                  </center>
</p>
                <p>您好，您现在用的是试用版，如果您觉得此整站程序对您有用 请联系购买 价格：600元/套<br />
QQ：8020734 Tel:13558999744（请注明购买整站程序）<br />
MSN:meskyes@qq.com </p>
              </div>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
