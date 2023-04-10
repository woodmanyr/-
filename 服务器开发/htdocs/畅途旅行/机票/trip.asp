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
      <table width="90%"  border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td style="line-height:150%; font-family:Arial, Helvetica, sans-serif "> 
            <%set rs_gg=server.CreateObject("adodb.recordset")
sql_gg="select top 1 * from gg order by id desc"
rs_gg.Open sql_gg,conn,3,2
if not rs_gg.Eof then%>
            <%end if%>
            <%rs_gg.close%>
          </td>
        </tr>
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
        <tr> 
          </tr>
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
            width=194 border=0></a> </td>
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
    <td valign=top align=middle width="578"> 
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table width="558" cellspacing="0" cellpadding="0" height="29" background="images/search_bg.gif" align="center">
        <tr> 
          <td width="1%"><img height=29 
            src="images/search_l.gif" width=14></td>
          <td width="96%"><marquee onMouseOver=this.stop() onMouseOut=this.start() scrollamount=2 
      scrolldelay=2 width="100%">&nbsp;&nbsp;&nbsp; <font size=2><b>我们的工作时间 8:00--22:00 
            本公司与所有国际,国内50余家航空公司建立了良好的关系,在业界具有良好的口碑,在座位紧张时,我公司可为您申请经济的机票舱位</b></font>&nbsp;&nbsp;&nbsp;&nbsp;</marquee></td>
          <td width="3%"><img height=29 
            src="images/search_r.gif" 
        width=14></td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <a 
      href="http://www.yide.com/help/newkid.asp"> </a> 
      <% set rs=server.CreateObject("adodb.recordset")
 type_id=Request.QueryString("type_id")
   Select case type_id
case "0"
            artype="广告行程"   
    case "1"
            artype="常规行程"    
case "2"
            artype="自由行"     
case "3"
            artype="华东行程"   
case else 
            artype=""
End select

strSel="select * from Trip where type like '%"&artype&"'order by id desc "

             rs.Open strSel,conn,3,2

%>
      <table width="558" border="0" cellpadding="0" cellspacing="0" class="line_height" align="center">
        <tr> 
          <td height="90" colspan="2"> 
            <table border="1" cellpadding="0" cellspacing="0" width="100%"  bordercolorlight="#B3C6D9" bordercolordark="#FFFFFF">
              <%
                
rs.pagesize=30
page=clng(page)    
if page>rs.pagecount then    
page=rs.pagecount    
end if    
if page<1 then    
page=1    
end if    
if NOt rs.Eof then rs.absolutePage=page  
for ipage=1 to rs.pagesize  
                if rs.Eof then exit for
                %>
              <tr> 
                <td width="11%" height="25" align="center"> 
                  <div align="left">　　· <a href=trip_show.asp?id=<%=rs("id")%> target="_blank"><%=rs("title")%></a><br>
                  </div>
                </td>
              </tr>
              <%
                rs.movenext
                If rs.eof then exit for
                next
                %>
              <tr> 
                <td height="18" align="center" colspan="11"> 
                  <p align="center"><font color="#333333" size="2"><b>共 <font color="#990000"><%=rs.pagecount%></font> 
                    页 </b>&nbsp;<font face="webdings"><a href="trip.asp?page=1"><font color="#484848">9</font></a></font> 
                    <font face="webdings"> <a href="trip.asp?page=<%=page-1%>"> 
                    <font color="#484848">7</font></a></font>[ 
                    <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=trip.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
     next
      
     
      %>
                    ]<font face="webdings"><a href="trip.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font> 
                    <font face="webdings"> <a href="trip.asp?page=<%=rs.PageCount%>"> 
                    <font color="#484848">:</font></a> </font><b>&nbsp; 当前第 <font color="#990000"><%=page%></font> 
                    页</b></font> 
                </td>
              </tr>
            </table>
          </td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td>&nbsp;</td>
        </tr>
        </tbody> 
      </table>
    </td>
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
                color=#666666><b> 在 线 订 票</b></font></td>
          <td width=9><img height=28 
            src="images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-TOP: #cfcfcf 1px solid; BACKGROUND: url(images/ri_bg2.gif) repeat-x 50% top; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=1 cellpadding=0 width=200 border=0>
        <tbody> 
        <tr> </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-TOP: #cfcfcf 1px solid; BACKGROUND: url(images/ri_bg2.gif) repeat-x 50% top; BORDER-LEFT: #cfcfcf 1px solid" 
      height=100 cellspacing=5 cellpadding=0 width=200 
border=0>
        <tbody> 
        <tr> 
          <td><a 
            href="contact.asp" class="mainzi"><span class="mainzi"> 
            <%set rs=server.CreateObject("adodb.recordset")
%>
            <%
id=Request.QueryString("id")
strSel="select * from qita where id=171"
rs.Open strsel,conn,3,3
%>
            </span></a> 
            <table id=Table1 cellspacing=0 cellpadding=0 width="100%" 
      align=center border=0>
              <tbody> 
              <tr> 
                <td valign=top> 
                  <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr> </tr>
                  </table>
                  <font color="#FFFFFF"><%=Trim(rs("content"))%></font></td>
              </tr>
              </tbody> 
            </table>
            <%rs.close%>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=5 src="images/mao.gif" 
            width=5></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=20 
            src="images\tit_d_l(1).gif" 
            width=9></td>
          <td align=right>&nbsp;<img 
            height=9 
            src="images\arrow_right(1).gif" 
            width=5 border=0></td>
          <td width=9><img height=20 
            src="images\tit_d_r(1).gif" 
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
      <a 
      href="#" target=_blank><img height=77 
            alt=学生机票 src="images/index_ad_03.gif" 
            width=200 border=0> </a> 
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
  </tr>
  </tbody> 
</table>
<!--#include file="bottom.asp" --><BR>
</DIV>
</BODY></HTML>
