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
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 
            src="images/tit_u_l.gif" width=9></td>
          <td align=middle><font 
                color=#666666><b>最 新 公 告</b></font></td>
          <td width=9><img height=28 
            src="images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid; repeat-x: " 
      height=180 cellspacing=3 cellpadding=0 width=200 bgcolor=#a20000 
      background="images/le_bg1.gif" border=0>
        <tbody> 
        <tr> 
          <td class=w valign=top align=middle> 
            <div align=left> 
              <table border="0" cellpadding="0" cellspacing="0" width="100%" id="table17">
                <tr> 
                  <td>&nbsp; </td>
                </tr>
                <tr> 
                  <td> 
                    <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
                      <tr> 
                        <td height="94" style="line-height:150%; font-family:Arial, Helvetica, sans-serif "> 
                          <%set rs_gg=server.CreateObject("adodb.recordset")
sql_gg="select top 1 * from gg order by id desc"
rs_gg.Open sql_gg,conn,3,2
if not rs_gg.Eof then%>
                          <font color="#FFFFFF"><marquee behavior=scroll direction=up width=100% height=150 scrollamount=2 scrolldelay=2 onMouseOver='this.stop()' onMouseOut='this.start()'> 
                          <center>
                            <%=rs_gg("title")%> 
                          </center>
                          <br>
                          &nbsp;&nbsp;&nbsp;&nbsp;<%=rs_gg("content")%> 
                          <%end if%>
                          <%rs_gg.close%>
                          </marquee></font></td>
                      </tr>
                    </table>
                  </td>
                </tr>
                <tr> 
                  <td>　</td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=20 
            src="images/tit_d_l.gif" width=9></td>
          <td align=right><img 
            height=9 
            src="images\arrow_right(1).gif" 
            width=5 border=0></td>
          <td width=9><img height=20 
            src="images/tit_d_r.gif" 
      width=9></td>
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
      <table cellspacing=1 cellpadding=4 width=200 bgcolor=#dfdfdf border=0>
        <tbody> 
        <tr> 
          <td bgcolor=#f4f4f4> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td align=middle height=30><font 
                color=#666666><b>机 票 常 识</b></font></td>
              </tr>
              </tbody> 
            </table>
            <table cellspacing=1 cellpadding=2 width="100%" bgcolor=#dfdfdf 
            border=0>
              <tbody> 
              <tr> 
                <td valign=top bgcolor=#ffffff> 
                  <table  border="0" align="center" cellpadding="0" cellspacing="0" width="100%">
                    <tr> 
                      <td class="textbody"> <span id="lb_ViewBoard"> 
                        <%
sql_gg="select top 10 * from server order by id desc"
rs_gg.Open sql_gg,conn,3,2
for i=1 to  rs_gg.RecordCount
if   rs_gg.Eof then exit for
%>
                        <%title=rs_gg("title")%>
                        <%if len(title)>11 then title=left(title,11)%>
                        <img 
                        height=9 src="images/dian%5B1%5D.gif" width=8 vspace="6" align="absmiddle" hspace="3"><a href="changshi_show.asp?id=<%=rs_gg("id")%>" target="_blank"> 
                        <%=title%> 
                        <%if len(rs_gg("title"))>15 then%>
                        ... 
                        <%end if%>
                        </a><br>
                        <%
rs_gg.movenext
next
%>
                        <%rs_gg.close%>
                        </span></td>
                    </tr>
                    <tr> 
                      <td height="20" class="line_height"> 
                        <div align="right"><a href="server_index.asp" target="_blank">更多&gt;&gt;&gt;</a></div>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=10><img height=10 alt="" 
            src="images/home.htm" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=10><img height=10 alt="" 
            src="images/home.htm" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 
            src="images/tit_u_l.gif" width=9></td>
          <td align=middle><font 
                color=#666666><b>特 价 机 票</b></font></td>
          <td width=9><img height=28 
            src="images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=200 border=0>
        <tbody> 
        <td background="images/line_r_b.gif" 
          height=1><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        <tr> 
          <td> 
            <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="bkgreen+">
              <tr> </tr>
              <tr> 
                <td align="right"> 
                  <%
         on error resume next
         sql="select top 16 * from student where flag=true order by id desc"
         rs.Open sql,conn,3,2
        %>
                  <%
		for i=1 to rs.Recordcount
		if rs.Eof then Exit for%>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="21"><span 
                        style="FONT-SIZE: 9pt"></span><a href="stu_show.asp?id=<%=rs("id")%>" target="_blank" class="textbody"> 
                        </a> 
                        <table cellspacing=2 cellpadding=0 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                        style="FONT-SIZE: 9pt"><font color=#ff0000><img 
                        height=9 src="images/dian%5B1%5D.gif" width=8 hspace="5"></font></span></font></td>
                            <td width=187><span class="textbody"><a href=dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              </a></span><span class="tab1"><a href=trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
                              </a><a href="stu_show.asp?id=<%=rs("id")%>" target="_blank" class="textbody"> 
                              <%response.write left(rs("title"),23)%>
                              <%if len(rs("title"))>23 then
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
                  <%rs.Movenext
		next
		rs.close
		%>
                  <span class="tab1"><a href="student_index.asp" class="textbody">更多&gt;&gt;&gt;</a></span></td>
              </tr>
            </table>
            <span 
            id=lb_GunGuoji></span></td>
        </tr>
        <tr> 
          <td background="images/line_r_b.gif" 
          height=1><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=10><img height=10 alt="" 
            src="images/home.htm" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=200 border=0>
        <tbody> 
        <tr> </tr>
        <tr> 
          <td background="images/line_r_b.gif" 
          height=1><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        <tr> 
          <td><a href="#"><img height=90 
            alt=学生机票 src="images/index_ad_02.gif" 
            width=194 border=0></a> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=6 src="images/mao.gif" 
            width=6></td>
              </tr>
              </tbody> 
            </table>
            <a href="#"><img height=93 
            alt=学生机票 src="images/index_ad_01.jpg" 
            width=194 border=0></a>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=6 src="images/mao.gif" 
            width=6></td>
              </tr>
              </tbody> 
            </table>
            <a href="#"><img src="images/img01.gif" width="194" height="93" border="0"></a>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=6 src="images/mao.gif" 
            width=6></td>
              </tr>
              </tbody> 
            </table>
            <a href="#"><img src="images/index_ad_04.jpg" width="194" height="350" border="0"></a></td>
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
   strSel="Select * from dinggao where hangban='guoji'"
   rs_ding.Open strSel,conn,3,2
page=request("page")
if page="" then
page=1
end if
company=request("company")
if company="" then
company="所有航空公司"
end if
'address=request("address")
address=request("cityid")
countryid=request("countryid")
areaid=request("areaid")
if address="" then
address="0"
end if


on error resume next
set rs=server.CreateObject("adodb.recordset")
sql="select * from address1 order by address asc"
rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company1"
rs_company.Open sql_company,conn,3,2

set rs_search=server.CreateObject("adodb.recordset")

if address="0" then
sql_search="select * from holiday1 where address like '%'" 
else
sql_search="select * from holiday1 where address like '%"&address&"%'"
end if
if Request.Form("submit")<>"" then
if areaid<>"0"  then
sql_search=sql_search & " and areaid = "&areaid
end if

if   countryid<>"0" then
sql_search=sql_search & " and countryid = "&countryid
end if
end if
if company<>"所有航空公司" then
sql_search=sql_search & " and company like '%"&company&"%'"
end if
sql_Search=sql_search & " order by address,FromTime asc"
rs_search.Open sql_search,conn,3,2
%><form method="POST"   name="regfrom" action="guoji_hangban_list.asp">
        <table width="100%" height="86" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#cccccc" bordercolordark="#FFFFFF" bgcolor="#F9F9F9">
          <tr>
      <td width="74%" height="27">
        <div align="center">
          <center>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
              <tr>
                <td width="13%"><div align="center">出发城市：上海</div></td>
                <td width="10%"><div align="center">航班查询：</div></td>
                <td width="15%">
                  <select size="1" name="company">
                    <option value="所有航空公司" selected>所有航空公司</option>
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
                <td width="54%"><div align="center"></div>                  <table width="98%" border="0" align="center" cellpadding="2" cellspacing="0">
                  <tr>
                    <td width="19%"><div align="right">目 的 地： </div></td>
                    <td width="81%" height="32">
                      <div align="left">
                        <%
  set rs_area=Server.CreateObject("AdoDb.RecordSet")
        rs_area.open "select * from area order by area",conn,1,1
	if rs_area.eof and rs_area.bof then
	response.write "请选择大州"
	response.end
	else
%>
                        <select name="areaid" size="1" id="areaid" onChange="changelocation(document.regfrom.areaid.options[document.regfrom.areaid.selectedIndex].value)">
                          <option selected value=0>请选择大州</option>
                          <%      dim selarea,selnclass
          
        do while not rs_area.eof
%>
                          <option value="<%=rs_area("areaid")%>"><%=trim(rs_area("area"))%></option>
                          <%
        rs_area.movenext
        loop
	end if
        rs_area.close
%>
                        </select>
                        <select name="countryid" onChange="changelocationz(document.regfrom.countryid.options[document.regfrom.countryid.selectedIndex].value)">
                          <option value="0" selected>请选择国家</option>
                        </select>
                        <select name="cityid">
                          <option value="0" selected>请选择城市</option>
                        </select>
                        <font color="#FF0000"></font></div>
                      <div align="left"></div>
                      <div align="left"></div></td>
                  </tr>
                </table>
                </td>
                <td width="8%"><input type="submit" value="查询" name="B1"></td>
              </tr>
            </table>
          </center>
      </div></td>
    </tr>
    <tr>
            <td height="11"> 
              <table border="1" cellpadding="0" cellspacing="0" width="100%"  bordercolorlight="#B3C6D9" bordercolordark="#FFFFFF">
                <tr bgcolor="#7B9EC6"> 
                  <td width="11%" height="34" align="center"><font color="#FFFFFF">目的地</font></td>
                  <td width="10%" height="34" align="center"><font color="#FFFFFF">机场</font></td>
                  <td width="11%" height="34" align="center"><font color="#FFFFFF">航空公司</font></td>
                  <td width="8%" height="34" align="center"><font color="#FFFFFF">出发时间</font></td>
                  <td width="8%" height="34" align="center"><font color="#FFFFFF">到达时间</font></td>
                  <td width="10%" height="34" align="center"><font color="#FFFFFF">航班号</font></td>
                  <td width="8%" height="34" align="center"><font color="#FFFFFF">机型</font></td>
                  <td width="7%" height="34" align="center"><font color="#FFFFFF">每周航班</font></td>
                  <td width="9%" height="34" align="center"><font color="#FFFFFF">单程</font></td>
                  <td width="11%" height="34" align="center"><font color="#FFFFFF">往返</font></td>
                  <td width="7%" height="34" align="center"><font color="#FFFFFF">在线订票</font></td>
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
                  <td width="11%" height="25" align="center"><%=rs_search("address")%></td>
                  <td width="10%" height="25" align="center"><%=rs_search("plane")%></td>
                  <td width="11%" height="25" align="center"><%=rs_search("company")%></td>
                  <td width="8%" height="25" align="center"><%=rs_search("fromtime")%></td>
                  <td width="8%" height="25" align="center"><%=rs_search("totime")%></td>
                  <td width="10%" height="25" align="center"><%=rs_search("flycode")%></td>
                  <td width="8%" height="25" align="center"><%=rs_search("planetype")%></td>
                  <td width="7%" height="25" align="center"><%=rs_search("flynumber")%></td>
                  <td width="9%" height="25" align="center"><%=rs_search("price")%></td>
                  <td width="11%" height="25" align="center"><font color="#FF0000"><%=rs_search("minprice")%></font></td>
                  <td width="7%" height="25" align="center"><a href="buy.asp?id=<%=rs_search("id")%>"><font color="#000000"> 
                    </font></a><a href="#" onClick=javascript:window.open('guoji_buy.asp?id=<%=rs_search("id")%>','','500,400,scrollbars=yes,resizable=yes')><font color="#000000"> 
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
                    <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs_search.pagecount%></font> 
                      页 </b>&nbsp;<a href="guoji_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=1" class="样式1"><font color="#484848">9</font></a> 
                      <a href="guoji_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page-1%>"> 
                      <span class="样式1">7</span></a></font>[ 
                      <%
      for i=1 to rs_search.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guoji_hangban_list.asp?company="&company&"&address="&address&"&godatemonth="&godatemonth&"&godateday="&godateday&"&page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
      %>
                      ]<a href="guoji_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=page+1%>" class="样式1"><font color="#484848">8</font></a> 
                      <a href="guoji_hangban_list.asp?company=<%=company%>&address=<%=address%>&godatemonth=<%=godatemonth%>&godateday=<%=godateday%>&page=<%=rs_search.PageCount%>" class="样式1"> 
                      <font color="#484848">:</font></a> <b>&nbsp; 当前第 <font color="#990000"><%=page%></font> 
                      页</b> 
                  </td>
                </tr>
              </table>
            </td>
    </tr>
  </table>
  </form>
      <%
set rs=server.CreateObject("adodb.recordset")
sql="select * from address1 order by address asc"
rs.Open sql,conn,3,2
%>
      <table border="0" cellspacing="0" width="100%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" cellpadding="5">
        <tr> 
          <td bgcolor="#5C98C9"> 
            <p align="center" class="style7">上海 至 各地航线 
          </td>
        </tr>
        <tr> 
          <td> 
            <table border="1" cellpadding="2" cellspacing="0" width="100%" bordercolorlight="#000000" bordercolordark="#FFFFFF">
              <%
        sql="select id,address from address1 where flag=true order by id asc"
         rs.Open sql,conn,3,2
        for m=1 to rs.recordcount/10%>
              <tr> 
                <%for n=1 to 10%>
                <td width="10%" bgcolor="#FFFFFF"><a href="guoji_hangban_list.asp?cityid=<%=rs("address")%>"><%=rs("address")%></a></td>
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
