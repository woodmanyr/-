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
<!--#include file="top.asp" -->
<table cellspacing=0 cellpadding=0 width=978 align=center border=0>
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
    <td valign=top align=middle width="778"> 
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp;</td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width=70% align=center border=0>
        <tbody> 
        <tr> 
          <td valign=top> 
            <table cellspacing=0 cellpadding=0 width=100% border=0>
              <tbody> 
              <tr> 
                <td class=orgborder>&nbsp; </td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td valign=top> <a name=1></a> 
            <table cellspacing=0 cellpadding=0 width="50%" border=0>
              <tbody> 
              <tr> 
                <td> 
                  <table cellspacing=1 cellpadding=3 bgcolor=#efefef width="100%">
                    <tbody> 
                    <tr> 
                      <td width="100%"></td>
                    </tr>
                    <tr> 
                      <td width="100%"> 
                        <table cellspacing=1 cellpadding=0 width=100%>
                          <tbody> 
                          <tr> 
                            <td colspan=3> <a name=2></a> 
                              <table cellspacing=0 cellpadding=0 width="100%">
                                <tbody> 
                                <tr> 
                                  <td valign=center height=28> 
                                    <div align=center><strong>浦东机场大巴专线 </strong></div>
                                  </td>
                                </tr>
                                </tbody> 
                              </table>
                            </td>
                          </tr>
                          <tr> 
                            <td valign=top width=360 bgcolor=#ffffff> 
                              <table cellspacing=1 cellpadding=3 width=360 
                        bgcolor=#cccccc>
                                <tbody> 
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>机场一线 : 虹桥机场 - 浦东机场 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td width=70> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>虹桥机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>单一票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>当日航班结束 </div>
                                  </td>
                                  <td> 
                                    <div align=center>30 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 :021 -6834 6612 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>机场三线 : <br>
                                      银河宾馆 - 徐家汇 - 打浦桥 - 龙阳路站 - 浦东机场 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>遵义路 </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>多级票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>全程 20 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 :021 - 6834 6645 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5 height=62> 
                                    <div align=center>机场五线 : <br>
                                      上海火车站 - 人民广场 - 东方医院 - 罗山路 - 浦东机场 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>上海火车站 </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>多级票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>全程 18 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 : 021 - 6834 6830 </div>
                                  </td>
                                </tr>
                                </tbody> 
                              </table>
                            </td>
                            <td bgcolor=#ffffff>&nbsp;</td>
                            <td valign=top width=360 bgcolor=#ffffff> 
                              <table cellspacing=1 cellpadding=3 width=360 
                        bgcolor=#cccccc>
                                <tbody> 
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>机场二线 : 静安寺航站楼 - 浦东机场 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td width=70> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>静安寺航站楼 </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>单一票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>当日航班结束 </div>
                                  </td>
                                  <td> 
                                    <div align=center>19 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 :021- 6834 6612 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>机场四线 : 鲁迅公园 - 大柏树 - 五角场 
                                      - 德平路 - 浦东机场 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>东江湾路 </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:40 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>多级票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>全程 18 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 : 021 - 6834 6830 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>机场六线 : <br>
                                      中山公园 - 静安寺 - 东方医院 - 紫金山大酒店 - 张江高科技园区 - 浦东机场 
                                    </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>起点 </div>
                                  </td>
                                  <td> 
                                    <div align=center>首班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>末班时间 </div>
                                  </td>
                                  <td> 
                                    <div align=center>票价 </div>
                                  </td>
                                  <td> 
                                    <div align=center>间隔时间 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>桃浦路 </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>浦东机场 </div>
                                  </td>
                                  <td> 
                                    <div align=center>8:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20 元 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 分钟 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>咨询电话 : 021 - 6834 6830 </div>
                                  </td>
                                </tr>
                                </tbody> 
                              </table>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <table width=100% border=0>
                          <tbody> 
                          <tr> 
                            <td style=bgcolor="#FFFFFF" bgcolor="#FFFFFF"> 
                              <p align=center><font size="4" face="楷体_GB2312">浦 
                                东 机 场 酒 店 班 车</font></p>
                              <p><font size=2>A线：花园饭店、锦江饭店、新锦江饭店<br>
                                B线：静安宾馆、国际贵都、静安希尔顿、上海宾馆<br>
                                C线：上海大厦、和平饭店、海伦宾馆、新城饭店、王宝和大酒店<br>
                                D线：富豪东亚、奥林匹克、华亭宾馆、建国宾馆<br>
                                E1线：龙柏饭店、世博大酒店、日航龙柏<br>
                                E2线：威斯汀太平洋酒店、虹桥宾馆<br>
                                F线：金门大酒店、国际饭店、青年会宾馆<br>
                                浦东A线：国际会议中心、香格里拉大酒店、金贸凯悦大酒店、海神大酒店<br>
                                浦东B线：通贸大酒店、紫金山大酒店、新亚汤臣大酒店</font></p>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <table cellspacing=0 cellpadding=0 width="100%">
                          <tbody> 
                          <tr> 
                            <td valign=center height=28> 
                              <div align=center><strong>虹桥机场大巴专线 </strong></div>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <table class=ourfont cellspacing=0 bordercolordark=#ffffff cellpadding=0 width=100% bordercolorlight=#000000 border=1>
                          <tbody> 
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54>线路</td>
                            <td width=90>起始站点 </td>
                            <td width=86>起始站点 </td>
                            <td width=242>发车时间 </td>
                            <td width=342>沿途停靠站点 </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>机场一线 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓ <br>
                                浦东机场 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点 <br>
                                末班：20点30 <br>
                                首班：8点 <br>
                                末班：航班结束</p>
                            </td>
                            <td width=242> 
                              <p align=center>早晨三班为45分钟间隔，后每20分钟发一班 </p>
                            </td>
                            <td width=342> 
                              <p align=center>无 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>民航专线 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓<br>
                                威海路、陕西路 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点 <br>
                                末班：22点50<br>
                                首班：6点 <br>
                                末班：20点30</p>
                            </td>
                            <td style=width=242> 
                              <p align=center>20分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>无 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>941 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场<br>
                                ↑↓ <br>
                                上海火车站 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点<br>
                                末班：20点15<br>
                                首班：6点 <br>
                                末班：20点25 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>虹桥机场一虹井路一上海动物园一虹梅路一虹许路一虹古路一 仙霞路一天山电影院一遵义路一中山西路一中山公园一江苏路 
                                一曹家渡一国棉六厂一胶州路一西康路一上海火车站 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>925 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓ <br>
                                人民广场 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点 <br>
                                末班：21点<br>
                                首班：6点 <br>
                                末班：22点 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>虹桥机场一机场新村一上海动物园一程家桥一虹梅路一虹许路 一虹桥开发区一中山西路一定西路一江苏路一美丽园一陕西路 
                                一石门路一人民广场 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>938 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓ <br>
                                商城路 （浦东） </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点 <br>
                                末班：21点30 <br>
                                首班：6点 <br>
                                末班：21点30 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>虹桥机场一机场新村一上海动物园一程家桥一虹梅路一虹许路 一水城路一虹桥开发区一安顺路一中山西路一第二结核病院一 
                                吴中路一直山路一华亭宾馆一大钥桥路一宛平路一东安路一南 洋中学一打浦路一鲁班路一西藏南路一南车站路一塘桥一宁阳 
                                路一王家宅浦电路一潍坊路一八佰伴一商城路 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>806 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓ <br>
                                中山南一路 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点 <br>
                                末班：21点30 <br>
                                首班：6点<br>
                                末班：21点30 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>虹桥机场一机场新村一上海动物园一程家桥一虹梅路一虹许路 一水城路一高级法院一长顺路一凯旋路一番禹路一香花桥一交 
                                通大学一徐家汇一宛平路一东安路一岳阳路一大木桥路一打浦桥 一斜土路一翟溪路一中山南一路一鲁班路 
                              </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>807 </p>
                            </td>
                            <td width=90> 
                              <p align=center>虹桥机场 <br>
                                ↑↓ <br>
                                真光新村 </p>
                            </td>
                            <td width=86> 
                              <p align=center>首班：6点<br>
                                末班：21点 <br>
                                首班：6点 <br>
                                末班：21点 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10分钟 </p>
                            </td>
                            <td width=342> 
                              <p align=center>虹桥机场一机场新村一上海动物园一程家桥一王满四桥 一中新径一仙霞路一马家桥一北新径一云岭路一金沙汪路一梅 
                                川路一曹安路一北石路一铜川路一上海西站一真光新村 虹桥机场国内到达。国际到达均有出租车站点，最近又设 
                                置了短途出租车站点。航班开始到结束均有出租车候客。</p>
                            </td>
                          </tr>
                          </tbody>
                        </table>
                        <table width=100% border=0>
                          <tbody> 
                          <tr> 
                            <td style=bgcolor="#FFFFFF" bgcolor="#FFFFFF"> 
                              <p align=center><font face=楷体_GB2312 size=4><em><u>虹 
                                桥 机 场 发 往 外 省 市 班 车 表 </u></em></font></p>
                              <p><font size=2>杭州10：30、12：00、13：30、15：00、16：30、18：00，高速85元<br>
                                南京13：30、15：30、18：00，高速95元<br>
                                江阴12：50、17：15，经张家港，80元<br>
                                宜兴12：30、15：30，高速80元<br>
                                常熟11：30、13：30、15：30、17：30，65元<br>
                                昆山7：30-20：30，每小时一班，高速90元<br>
                                苏州10：00-19：00，每小时一班，50元<br>
                                无锡10：30-19：00，每小时一班，高速75元</font></p>
                            </td>
                          </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td valign=top width="100%" bgcolor=#efefef>&nbsp; </td>
                    </tr>
                    </tbody> 
                  </table>
                </td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
    </td>
  </tr>
  </tbody> 
</table>
<DIV align=center>
<!--#include file="bottom.asp" --><BR>
</DIV>
</BODY></HTML>
