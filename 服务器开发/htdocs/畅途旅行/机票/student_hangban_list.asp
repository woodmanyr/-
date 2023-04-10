<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_name%></title>
<link rel="stylesheet" href="inc/css.css"  type="text/css">
 
<%
   set rs_ding=Server.CreateObject("ADODB.Recordset")
   strSel="Select * from dinggao where hangban='guoji'"
   rs_ding.Open strSel,conn,3,2
page=request("page")
if page="" then
page=1
end if
company=request("company")
address=request("cityid")
countryid=request("countryid")
areaid=request("areaid")
if address="" then
address="0"
end if


on error resume next 

set rs_search=server.CreateObject("adodb.recordset")

if address="0" then
sql_search="select * from student where address like '%'" 
else
sql_search="select * from student where address like '%"&address&"%'"
end if
if Request.Form("areaid")<>"" then
if areaid<>"0"  then
sql_search=sql_search & " and areaid = "&areaid
end if

if   countryid<>"0" then
sql_search=sql_search & " and countryid = "&countryid
end if
end if
if company<>"" then
sql_search=sql_search & " and company like '%"&company&"%'"
end if
sql_Search=sql_search & " order by address,FromTime asc"
if Request.QueryString("id")<>"" then
sql_search="select * from student where id="&Request.QueryString("id")
end if
rs_search.Open sql_search,conn,3,2 
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
.style1 {
	color: #FF6600;
	font-weight: bold;
}
.样式1 {font-family: Webdings, Wingdings}
</style>
</head>
 
<script language = "JavaScript"> 
subcat = new Array();
subcatz = new Array();
<%
   count = 0
  set rs_country=server.createobject("adodb.recordset")
  rs_country.open "select * from country order by country ",conn,1,1
  
   do while not rs_country.eof 
%>
subcat[<%=count%>] = new Array("<%= trim(rs_country("country"))%>","<%= rs_country("areaid")%>","<%= rs_country("countryid")%>");
<%
        count = count + 1
        rs_country.movenext
        loop
        rs_country.close
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
  set rs_address=server.createobject("adodb.recordset")
  rs_address.open "select * from address1 order by id ",conn,1,1
  
   do while not rs_address.eof 
%>
subcatz[<%=count%>] = new Array("<%= trim(rs_address("address"))%>","<%= rs_address("countryid")%>","<%= rs_address("address")%>");
<%
        count = count + 1
        rs_address.movenext
        loop
        rs_address.close
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
<script>
function roll(el,way,color)
		{
			if (color=="")
			{
			color="#ffffff";
			}
			var ms = navigator.appVersion.indexOf("MSIE")
			ie4 = (ms>0) && (parseInt(navigator.appVersion.substring(ms+5, ms+6)) >= 4)
			if(ie4)
			{
				if (way =='in')  {el.style.cssText="color: #F2FBF7";el.style.cssText="background-color: "+color}
				if (way =='out') {el.style.cssText="color: #F2FBF7";el.style.cssText="background-color: "+color}					
			}
		}

</script>
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">

<div align="center">
	<!--#include file="inc/top.asp"-->
</div>
<div align="center">
	 <table width="765" border="0" cellpadding="0" cellspacing="0" class="line_height">
       <tr>
         <td height="29" colspan="2" >　>> 在选择航班预订前，请阅读国际机票网上 <a href="server.htm" target="_blank">订票须知</a>。(以下价格均<span class="style1">不含税收</span>) </td>
       </tr>
       <tr>
         <td height="30" colspan="2" >　留学:  <span class="style1"><%=address%></span></td>
       </tr>
       <tr>
         <td width="513" height="11" bgcolor="#F5F5F5">　※ 所有从 <span class="style1">上海</span> 出发到 <span class="style1"><a href="?cityid=<%=address%>"><%=address%></a></span> 的航班 </td>
         <td width="252" bgcolor="#F5F5F5"><div align="right"><a href="student_hangban.asp">返回查询航班</a></div></td>
       </tr>
         <tr>
           <td height="90" colspan="2"><table border="1" cellpadding="0" cellspacing="0" width="100%"  bordercolorlight="#B3C6D9" bordercolordark="#FFFFFF">
             <tr bgcolor="#3C618A">
               <td width="11%" height="34" align="center"><font color="#FFFFFF">目的地</font></td>
               <td width="12%" height="34" align="center"><font color="#FFFFFF">机场</font></td>
               <td width="12%" height="34" align="center"><font color="#FFFFFF">航空公司</font></td>
               <td width="8%" height="34" align="center"><font color="#FFFFFF">出发时间</font></td>
               <td width="8%" height="34" align="center"><font color="#FFFFFF">到达时间</font></td>
               <td width="7%" height="34" align="center"><font color="#FFFFFF">航班号</font></td>
               <td width="5%" height="34" align="center"><font color="#FFFFFF">机型</font></td>
               <td width="8%" height="34" align="center"><font color="#FFFFFF">每周航班</font></td>
               <td width="9%" height="34" align="center"><font color="#FFFFFF">全价</font></td>
               <td width="9%" height="34" align="center"><font color="#FFFFFF">特价</font></td>
               <td width="11%" height="34" align="center"><font color="#FFFFFF">在线订票</font></td>
             </tr>
             <%
                
rs_search.pagesize=30
page=clng(page)    
if page>rs_search.pagecount then    
page=rs_search.pagecount    
end if    
if page<1 then    
page=1    
end if    
if NOt rs_search.Eof then rs_search.absolutePage=page  
for ipage=1 to rs_search.pagesize  
                if rs_search.Eof then exit for
                %>
             <tr onmousemove="roll(this,'in','#FFEACA');" 
                          onmouseout="roll(this,'out')">
               <td width="11%" height="25" align="center"><%=rs_search("address")%></td>
               <td width="12%" height="25" align="center"><%=rs_search("plane")%></td>
               <td width="12%" height="25" align="center"><%=rs_search("company")%></td>
               <td width="8%" height="25" align="center"><%=rs_search("fromtime")%></td>
               <td width="8%" height="25" align="center"><%=rs_search("totime")%></td>
               <td width="7%" height="25" align="center"><%=rs_search("flycode")%></td>
               <td width="5%" height="25" align="center"><%=rs_search("planetype")%></td>
               <td width="8%" height="25" align="center"><%=rs_search("flynumber")%></td>
               <td width="9%" height="25" align="center"><%=rs_search("price")%></td>
               <td width="9%" height="25" align="center"><font color="#FF0000"><%=rs_search("minprice")%></font></td>
               <td width="11%" height="25" align="center"><a href="#" onClick=javascript:window.open('student_buy.asp?id=<%=rs_search("id")%>','','500,400,scrollbars=yes,resizable=yes')><font color="#000000">
                 <%if rs_ding("flag")=0 then%>
      预定
      <%end if%>
               </font></a></td>
             </tr>
             <%
                rs_search.movenext
                If rs_search.eof then exit for
                next
                %>
             <tr>
               <td height="18" align="center" colspan="11">
                 <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs_search.pagecount%></font> 页 </b>&nbsp;<a href="../guonei/index.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=1" class="样式1"><font color="#484848">9</font></a> <a href="../guonei/index.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page-1%>"> <span class="样式1">7</span></a></font>[
                     <%
					
	   j=page-9
	   if j<1 then j=1
	   jj=page+9
	   if jj>rs_search.pagecount then jj=rs_search.pagecount
      for i=j to jj
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=index.asp?company="&company&"&address="&address&"&godatemonth="&godatemonth&"&godateday="&godateday&"&page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
      %>
        ]<a href="../guonei/index.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page+1%>" class="样式1"><font color="#484848">8</font></a> <a href="../guonei/index.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=rs_search.PageCount%>" class="样式1"> <font color="#484848">:</font></a> <b>&nbsp; 当前第 <font color="#990000"><%=page%></font> 页</b></td>
             </tr>
           </table></td>
         </tr>
       </table>
</div>
<div align="center">
	
</div>

<div align="center">
	<table border="0" cellpadding="0" cellspacing="0" width="765" id="table19" height="1" bgcolor="#848684">
		<tr>
			<td><img border="0" src="images/point.gif" width="1" height="1"></td>
		</tr>
	</table>
</div>
<div align="center">
	<!--#include file="inc/bottom.asp"-->
</div>

</body>

</html>