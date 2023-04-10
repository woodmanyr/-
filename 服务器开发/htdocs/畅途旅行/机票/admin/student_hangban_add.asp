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
          <td width="100%" height="14"> <form method="POST" name="regfrom" action="student_hangban_add_ok.asp">
              <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="122">
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20"> <p align="center">添加航班</td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top"> <table border="0" cellpadding="5" cellspacing="1" width="100%" height="365">
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="6"> 
                            <p align="center" class="style1">出发地</td>
                          <td width="76%" height="-2" bgcolor="#E9EEF8"><select name="from_city" id="from_city">
                              <option value="上海" selected>上海</option>
                              <option value="北京">北京</option>
                            </select> </td>
                        </tr>
                        <tr> 
                          <td bgcolor="#0A5092" align="center" height="6"><span class="style1">大州</span></td>
                          <td width="76%" height="-1" bgcolor="#E9EEF8"> 
                            <%
        rs.open "select * from area order by area",conn,1,1
	if rs.eof and rs.bof then
	response.write "请先添加大类"
	response.end
	else
%>
                            <select name="areaid" size="1" id="areaid" onChange="changelocation(document.regfrom.areaid.options[document.regfrom.areaid.selectedIndex].value)">
                              <option selected value=0>请选择大州</option>
                              <option value="<%=rs("areaid")%>"><%=trim(rs("area"))%></option>
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
                        </tr>
                        <tr> 
                          <td bgcolor="#0A5092" align="center" height="13"><span class="style1">国家</span></td>
                          <td width="76%" height="0" bgcolor="#E9EEF8"><select name="countryid" onChange="changelocationz(document.regfrom.countryid.options[document.regfrom.countryid.selectedIndex].value)">
                              <option value="0" selected>请选择国家</option>
                              <%rs.open "select * from country where areaid="&selarea&" order by country" ,conn,1,1
if (rs.eof and rs.bof) then
%>
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
                            </select></td>
                        </tr>
                        <tr> 
                          <td bgcolor="#0A5092" align="center" height="27"><font color="#FFFFFF">目的地</font></td>
                          <td width="76%" height="27" bgcolor="#E9EEF8"> 
                            <!--<select size="1" name="address">
                    <%
                        'rs.movefirst
                        'for k=1 to rs.recordcount
                        %>
                    <option value="<%'response.write     rs("address")%>">
                    <%'response.write rs("address")%>
                    </option>
                    <%
                        'rs.movenext
                        'next
                        %>
                  </select>-->
                            <select name="cityid">
                              <option value="0" selected>请选择城市</option>
                              <%rs.open "select * from address1 where countryid="&selnclass&" order by  id" ,conn,1,1
if (rs.eof and rs.bof) then
%>
                              <% else
do while not rs.eof%>
                              <option value="<%=rs("address")%>"><%=rs("address")%></option>
                              <% rs.movenext
loop
end if
        rs.close
        set rs = nothing
%>
                            </select> </td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">机场</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><select size="1" name="plane">
                              <option selected value="虹桥机场">虹桥机场</option>
                              <option value="浦东机场">浦东机场</option>
                            </select></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">航空公司</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><select size="1" name="company">
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
                            </select></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">航班号</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="flycode" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">航班机型</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="planetype" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">每周航班</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="flynumber" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">单程价格</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="price" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">往返价格</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="minprice" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" bgcolor="#0A5092" align="center" height="27"> 
                            <font color="#FFFFFF">出发时间</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="27"><input type="text" name="fromtime" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" height="13" align="center" bgcolor="#0A5092"> 
                            <font color="#FFFFFF">到达时间</font></td>
                          <td width="76%" bgcolor="#E9EEF8" height="13"><input type="text" name="totime" size="14"></td>
                        </tr>
                        <tr> 
                          <td width="24%" height="6" align="center" bgcolor="#0A5092"><span class="style1">备注</span></td>
                          <td height="6" bgcolor="#E9EEF8">&nbsp;</td>
                        </tr>
                        <tr bgcolor="#E9EEF8"> 
                          <td height="6" colspan="2" align="center"><textarea name="content" cols="60" rows="5" id="content"></textarea></td>
                        </tr>
                        <tr> 
                          <td colspan="2" bgcolor="#E9EEF8" height="27"> <p align="center"> 
                              <input type="submit" value="提交" name="B1">
                          </td>
                        </tr>
                      </table></td>
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
