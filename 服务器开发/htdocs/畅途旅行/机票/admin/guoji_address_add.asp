<!--#include file="../inc/conn1.asp"-->

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
    document.form1.countryid.length = 0; 

    var locationid=locationid;
    var i;
    var j;
    var k;
    j=1;
    for (i=0;i < <%=count%>; i++)
        {
            if (subcat[i][1] == locationid)
            { //��䲻�Ǻ����
            if (j==1)
            {
            j=2;
            k=subcat[i][2];
            };
             document.form1.countryid.options[document.form1.countryid.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
   
    }



</script>
<body topmargin="0" class="body" leftmargin="0">

<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <form method="POST" name="form1" action="guoji_address_add_ok.asp">
              <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122"><center>
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">���Ŀ�ĵ�</td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top"> <table border="0" cellpadding="5" cellspacing="1" width="100%">
                        <tr> 
                          <td width="20%" bgcolor="#0A5092" align="center"> 
                            <p align="center" class="��ʽ1">ѡ�������أ�</td>
                          <td width="80%" bgcolor="#E9EEF8"><table width="90%" border="0" align="center" cellpadding="2" cellspacing="0">
                              <tr> 
                                <td width="17%"> 
                                  <%
        rs.open "select * from area order by area",conn,1,1
	if rs.eof and rs.bof then
	response.write "������Ӵ���"
	response.end
	else
%>
                                  ���ݣ� </td>
                                <td width="22%"><select name="areaid" size="1" id="select" onChange="changelocation(document.form1.areaid.options[document.form1.areaid.selectedIndex].value)">
                                    <option selected value="<%=rs("areaid")%>"><%=trim(rs("area"))%></option>
                                    <%      dim selarea,selnclass
         selarea=rs("areaid")
        rs.movenext
        do while not rs.eof
%>
                                    <option value="<%=rs("areaid")%>"><%=trim(rs("area"))%></option>
                                    <%
        rs.movenext
        loop
	end if
        rs.close
%>
                                  </select></td>
                                <td width="10%">���ң�</td>
                                <td width="51%"><select name="countryid">
                                    <%rs.open "select * from country where areaid="&selarea&" order by country" ,conn,1,1
if (rs.eof and rs.bof) then
%>
                                    <option selected value="0">�����С��</option>
                                    <%selnclass=0
else
selnclass=rs("countryid")
do while not rs.eof%>
                                    <option value="<%=rs("countryid")%>"><%=rs("country")%></option>
                                    <% rs.movenext
loop
end if
        rs.close
%>
                                  </select> <font color="#FF0000">&nbsp;</font></td>
                              </tr>
                            </table></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#0A5092" align="center"><font color="#FFFFFF">Ŀ�ĵ�</font></td>
                          <td width="80%" bgcolor="#E9EEF8"><input type="text" name="address" size="42"></td>
                        </tr>
                        <tr> 
                          <td width="100%" colspan="2" bgcolor="#E9EEF8"> <p align="center"> 
                              <input type="submit" value="�ύ" name="B1">
                          </td>
                        </tr>
                      </table></td>
                  </tr>
                </table>
              </div>
            </form></td>
        </tr>
      </table></td>
  </tr>
</table>

</body>

</html>
