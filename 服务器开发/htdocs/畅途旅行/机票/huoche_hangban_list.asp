<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=site_name%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="中国,上海,上海东航南航上航联合售票处,上海东航南航上航联合售票处票务中心,上海航空商务旅行网, 国内机票, 国际机票, 特价机票,打折机票,上海飞机票,飞机票, 火车票, 酒店预定, 旅游咨询, 商务签证, 航班查询, 预定服务">
<meta name="keywords" content="中国,上海,上海东航南航上航联合售票处,上海东航南航上航联合售票处票务中心,上海航空商务旅行网, 国内机票, 国际机票, 特价机票,打折机票,上海飞机票,飞机票, 火车票, 酒店预定, 旅游咨询, 商务签证, 航班查询, 预定服务">
<meta http-equiv="Pragma" contect="no-cache">
<meta name="Robots" contect= "all">
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
sql="select * from address order by address asc"
rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company"
rs_company.Open sql_company,conn,3,2

set rs_search=server.CreateObject("adodb.recordset")

if address="请选择航班到达地点" then
sql_search="select * from holiday " 
else
sql_search="select * from holiday"
end if

if company<>"所有航空公司" then
sql_search=sql_search
end if
sql_Search=sql_search
if Request.QueryString("id")<>"" then
sql_search="select * from holiday "
end if
rs_search.Open sql_search,conn,3,2
%>
 
<%set rs=server.CreateObject("adodb.recordset")
%>
<style type="text/css">
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
.样式1 {font-family: Webdings, Wingdings}
.style3 {color: #407739; font-weight: bold; }
</style>
<LINK href="images/yide.css" type=text/css rel=stylesheet>

<META content="MSHTML 6.00.2800.1106" name=GENERATOR></HEAD>
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
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
<script>
function guoji_check()
{
  if (document.all.cityid.value=="0")
    {
	   alert("请选择到达城市");
	   return false;
	 }
  return true;
}
</script>
<script>
function guonei_check()
{
  if (document.all.address.value=="请选择航班到达地点")
    {
	   alert("请选择到达城市");
	   return false;
	 }
  return true;
}
</script>
<!--#include file="top.asp" --><table cellspacing=0 cellpadding=0 width=978 align=center border=0>
  <tbody> 
  <tr> 
    <td valign=top align=middle width=200> 
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 border=0>
        <tbody> 
        <tr> 
          <td>&nbsp;</td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 src="" width=9></td>
          <td align=middle><font 
                color=#666666><b>旅 游 频 道</b></font></td>
          <td width=9><img height=28 src="" width=9></td>
        </tr>
        </tbody> 
      </table>
      <%set rs=server.CreateObject("adodb.recordset")
%>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=8 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td align=middle valign="top"> 
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
              <tr> 
                <td align="left"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><span style="FONT-SIZE: 9pt"><img 
                              height=5 src="images/spacer.gif" 
                              width=1></span></td>
                    </tr>
                  </table>
                  <% 
		  sql="select top 9 title,id from trip where flag=true  order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="20"><span class="tab1"><a href=trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
                        </a></span> 
                        <table cellspacing=2 cellpadding=0 width=100% 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                  style="FONT-SIZE: 9pt"><img height=7 
                  src="images/right_04_tu1.gif" width=7></span></font></td>
                            <td width=187><span class="textbody"><a href=dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              </a></span><span class="tab1"><a href=trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
                              <%response.write left(rs("title"),13)%>
                              <%
                                if len(rs("title"))>13 then
                                response.write "..."
                                end if
                                %>
                              </a></span></td>
                          </tr>
                          </tbody> 
                        </table>
                      </td>
                    </tr>
                  </table>
                  <div align="right"> 
                    <%rs.Movenext
		  next
		  rs.close%>
                    <a href="trip.asp" class="textbody">更多&gt;&gt;&gt;</a></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 src="" width=9></td>
          <td align=middle><font 
                color=#666666><b>酒 店 预 订</b></font></td>
          <td width=9><img height=28 src="" width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=8 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td align=middle valign="top"> 
            <table width="100%" border="0" cellpadding="0" cellspacing="0" >
              <tr> 
                <td align="left"> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td><span style="FONT-SIZE: 9pt"><img 
                              height=5 src="images/spacer.gif" 
                              width=1></span></td>
                    </tr>
                  </table>
                  <% 
		  sql="select top 10 title,id from dingfang where flag=true  order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="20"><span class="textbody"><a href=dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                        </a></span> 
                        <table cellspacing=2 cellpadding=0 width=100% 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                  style="FONT-SIZE: 9pt"><img height=7 
                  src="images/right_04_tu1.gif" width=7></span></font></td>
                            <td width=187><a href=dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              <%response.write left(rs("title"),13)%>
                              <%
                                if len(rs("title"))>13 then
                                response.write "..."
                                end if
                                %>
                              </a></td>
                          </tr>
                          </tbody> 
                        </table>
                      </td>
                    </tr>
                  </table>
                  <div align="right"> 
                    <%rs.Movenext
		  next
		  rs.close%>
                    <a href="dingfang.asp" class="textbody">更多&gt;&gt;&gt;</a></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=1 src="" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=6 src="images/mao.gif" 
            width=6></td>
        </tr>
        </tbody> 
      </table>
    </td>
    <td valign=top align=middle width="778">
	<table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table><%
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
sql="select * from address order by address asc"
rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company3"
rs_company.Open sql_company,conn,3,2

set rs_search=server.CreateObject("adodb.recordset")

if address="请选择航班到达地点" then
sql_search="select * from holiday3 where address like '%'" 
else
sql_search="select * from holiday3 where address like '%"&address&"%'"
end if

if company<>"所有航空公司" then
sql_search=sql_search & " and company like '%"&company&"%'"
end if
sql_Search=sql_search & " order by address,FromTime asc"
rs_search.Open sql_search,conn,3,2
%><form method="POST"   name="regfrom" action="huoche_hangban_list.asp">
        <table width="100%" height="86" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#FFFFFF" bgcolor="#F9F9F9">
          <tr> 
            <td width="74%" height="27"> 
              <div align="center"> 
                <center>
                  <table border="0" cellpadding="0" cellspacing="0" width="85%">
                    <tr> 
                      <td width="17%">
                        <div align="center">出发城市：上海</div>
                      </td>
                      <td width="15%">
                        <div align="center">航班查询：</div>
                      </td>
                      <td width="20%"> 
                        <select size="1" name="company">
                          <option value="所有车次类型">所有车次类型</option>
                          <option value="<%response.write rs_company("company")%>">
                          <%response.write rs_company("company")%>
                          </option>
                        </select>
                      </td>
                      <td width="27%"> 
                        <select size="1" name="address">
                          <option value="请选择航班到达地点">请选择航班到达地点</option>
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
                      <td width="21%">
                        <input type="submit" value="查询" name="B1">
                      </td>
                    </tr>
                  </table>
                </center>
              </div>
            </td>
          </tr>
          <tr> 
            <td width="74%" height="11"> 
              <table border="1" cellpadding="0" cellspacing="0" width="774"  bordercolorlight="#B3C6D9" bordercolordark="#FFFFFF">
                <tr> 
                  <td width="74" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">目的地</font></td>
                  <td width="56" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">车次类型</font></td>
                  <td width="64" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">出发时间</font></td>
                  <td width="59" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">到达时间</font></td>
                  <td width="58" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">车次</font></td>
                  <td width="74" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">硬座</font></td>
                  <td width="72" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">硬卧上铺</font></td>
                  <td width="72" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">硬卧下铺</font></td>
                  <td width="71" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">软卧上铺</font></td>
                  <td width="71" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">软卧下铺</font></td>
                  <td width="79" align="center" bgcolor="#7B9EC6"><font color="#FFFFFF">在线订票</font></td>
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
                <tr onMouseMove="roll(this,'in','#D9F2FF');" 
                          onMouseOut="roll(this,'out')"> 
                  <td width="74" align="center"><%=rs_search("address")%></td>
                  <td width="56" align="center"><%=rs_search("company")%></td>
                  <td width="64" align="center"><%=rs_search("fromtime")%></td>
                  <td width="59" align="center"><%=rs_search("totime")%></td>
                  <td width="58" align="center"><%=rs_search("flycode")%></td>
                  <td width="74" align="center"><%=rs_search("planetype")%></td>
                  <td width="72" align="center"><%=rs_search("flynumber")%></td>
                  <td width="72" align="center"><%=rs_search("price")%></td>
                  <td width="71" align="center"><%=rs_search("minprice")%></td>
                  <td width="71" align="center"><%=rs_search("flynumber1")%></td>
                  <td width="79" align="center"><a href="#" onClick=javascript:window.open('guonei_buy.asp?id=<%=rs_search("id")%>','','500,400,scrollbars=yes,resizable=yes')><font color="#000000"> 
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
                  <td align="center" colspan="11"> 
                    <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs_search.pagecount%></font> 
                      页 </b>&nbsp;<a href="huoche_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=1" class="样式1"><font color="#484848">9</font></a> 
                      <a href="huoche_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page-1%>"> 
                      <span class="样式1">7</span></a></font>[ 
                      <%
					
	   j=page-9
	   if j<1 then j=1
	   jj=page+9
	   if jj>rs_search.pagecount then jj=rs_search.pagecount
      for i=j to jj
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=huoche_hangban_list.asp?company="&company&"&address="&address&"&godatemonth="&godatemonth&"&godateday="&godateday&"&page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
      %>
                      ]<a href="huoche_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page+1%>" class="样式1"><font color="#484848">8</font></a> 
                      <a href="huoche_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=rs_search.PageCount%>" class="样式1"> 
                      <font color="#484848">:</font></a> <b>&nbsp; 当前第 <font color="#990000"><%=page%></font> 
                      页</b> 
                  </td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </form>
      <script>
function guoji_check()
{
  if (document.all.cityid.value=="0")
    {
	   alert("请选择到达城市");
	   return false;
	 }
  return true;
}
</script>
      <script>
function guonei_check()
{
  if (document.all.address.value=="请选择航班到达地点")
    {
	   alert("请选择到达城市");
	   return false;
	 }
  return true;
}
</script>
      <%
set rs=server.CreateObject("adodb.recordset")
sql="select * from address address where flag=true order by address asc"
rs.Open sql,conn,3,2
%>
      <table border="0" cellspacing="0" width="100%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" cellpadding="5">
        <tr> 
          <td bgcolor="#5C98C9"> 
            <p align="center" class="style7">上海 至 各地班车
          </td>
        </tr>
        <tr> 
          <td> 
            <table border="1" cellpadding="2" cellspacing="0" width="100%" bordercolorlight="#000000" bordercolordark="#FFFFFF">
              <%
        sql="select id,address from address where flag=true order by id asc"
         rs.Open sql,conn,3,2
        for m=1 to rs.recordcount/5%>
              <tr> 
                <%for n=1 to 5%>
                <td width="20%" bgcolor="#FFFFFF"><a href="huoche_hangban_list.asp?address=<%=rs("address")%>"><%=rs("address")%></a></td>
                <%
                rs.movenext
                next
                %>
              </tr>
              <%
                next
                %>
            </table>
          </td>
        </tr>
      </table>
    </td>
  </tr>
  </tbody> 
</table>
<!--#include file="bottom.asp" --><BR>
</DIV>
</BODY></HTML>
