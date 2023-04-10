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
                color=#666666><b>签 证 信 息</b></font></td>
          <td width=9><img height=28 
            src="images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid; repeat-x: " 
      height=180 cellspacing=3 cellpadding=0 width=200 bgcolor=#a20000 
      background="images/le_bg1.jpg" border=0>
        <tbody> 
        <tr> 
          <td class=w valign=top align=middle> 
            <div align=left>  
              <table border="0" cellpadding="0" cellspacing="0" width="100%" id="table17">
                <tr> 
                  <td>&nbsp; </td>
                </tr>
                <tr> 
                  <td><marquee behavior=scroll direction=up width=100% height=150 scrollamount=2 scrolldelay=2 onMouseOver='this.stop()' onMouseOut='this.start()'> 
                    <table width="98%"  border="0" cellpadding="0" cellspacing="0" class="bkgreen+">
                      <tr> </tr>
                      <tr> 
                        <td align="right"> 
                          <%
         on error resume next
         sql="select top 16 * from news where sort=2 order by id desc"
         rs.Open sql,conn,3,2
        %>
                          <%
		for i=1 to rs.Recordcount
		if rs.Eof then Exit for%>
                          <table cellspacing=2 cellpadding=0 
align=center>
                            <tbody> 
                            <tr> 
                              <td align=middle width=10 height=15><font color=#ff6600><span 
                        style="FONT-SIZE: 9pt"></span></font></td>
                              <td width=187> <font color="#FFFFFF"> 
                                <%response.write left(rs("title"),23)%>
                                <%if len(rs("title"))>23 then
                                response.write "..."
                                end if
                                %>
                                <br>
                                <%response.write left(rs("content"),23)%>
                                </font></td>
                            </tr>
                            <tr>
                              <td align=middle width=10 height=15>&nbsp;</td>
                              <td width=187>&nbsp;</td>
                            </tr>
                            </tbody> 
                          </table>
                          <%rs.Movenext
		next
		rs.close
		%>
                        </td>
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
                              </a></span><span id="lb_ViewBoard"> </span><span class="tab1"><a href="stu_show.asp?id=<%=rs("id")%>" target="_blank" class="textbody">
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
            <a href="#"><img src="images/index_ad_05.jpg" width="194" height="350" border="0"></a> 
          </td>
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
      <table cellspacing=0 cellpadding=0 width=778 align=center border=0>
        <tbody> 
        <tr valign=top> 
          <td> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td valign=top height=41><img height=41 
            src="images/moneytitle.gif" width=607></td>
              </tr>
              <tr> 
                <td> 
                  <table cellspacing=0 cellpadding=0 width="100%" border=0>
                    <tbody> 
                    <tr> 
                      <td width=20><img height=20 src="images/spacer.gif" 
                  width=20></td>
                      <td class=a9 background=images/bglogo.gif> 
                        <table cellspacing=0 cellpadding=0 width="100%" align=center 
                  border=0>
                          <tbody> 
                          <tr> 
                            <td><img height=10 src="images/spacer.gif" 
                        width=10></td>
                          </tr>
                          </tbody> 
                        </table>
                        本页包含所有服务的价格及所需材料清单的详细信息，以下第一部分为价格，第二部分为材料清单。<br>
                        <br>
                        <span 
                  class=a105>外国人在中国旅游、商务、工作签证、居留证及其他相关服务代办报价：<br>
                        <br>
                        </span>请在最左面一列选择外籍人士的国籍（未列出的都归属在其他国家一栏），最上面一行选择他所需的签证服务（E1-S12具体对应何种服务可从表格下面查得），所得交点的数字就为该项服务针对该国籍人士的费用（<font 
                  color=#ff0000>2005年6月1日起最新报价</font>），所有服务无需外国人出境，无需外国人面试。另：所有服务均可选择加急，最大程度节约外籍人士的时间。<br>
                        <span 
                  class=a105></span><font color=#ff0000>&nbsp;</font> 
                        <table class=a9 cellspacing=1 cellpadding=0 width="100%" 
                  bgcolor=#000000 border=0>
                          <tbody> 
                          <tr bgcolor=#d54a25> 
                            <td bgcolor=#d54a25> 
                              <div align=center><font 
                        color=#ffffff><b>国籍</b></font></div>
                            </td>
                            <td bgcolor=#d54a25> 
                              <div align=center><font 
                        color=#ffffff><b>E1</b></font></div>
                            </td>
                            <td align=middle bgcolor=#d54a25><b><font 
                        color=#ffffff>S1</font></b></td>
                            <td bgcolor=#d54a25> 
                              <div align=center><font 
                        color=#ffffff><b>S2</b></font></div>
                            </td>
                            <td bgcolor=#d54a25> 
                              <div align=center><font 
                        color=#ffffff><b>S3</b></font></div>
                            </td>
                            <td align=middle><font color=#ffffff><b>S4</b></font></td>
                            <td> 
                              <div align=center><font 
                        color=#ffffff><b>S5</b></font></div>
                            </td>
                            <td> 
                              <div align=center><font 
                        color=#ffffff><b>S6</b></font></div>
                            </td>
                            <td align=middle><b><font color=#ffffff>S7</font></b></td>
                            <td> 
                              <div align=center><font 
                        color=#ffffff><b>S8</b></font></div>
                            </td>
                            <td> 
                              <div align=center><font 
                        color=#ffffff><b>S9</b></font></div>
                            </td>
                            <td align=middle><b><font 
color=#ffffff>S10</font></b></td>
                            <td align=middle><b><font 
color=#ffffff>S11</font></b></td>
                            <td align=middle><b><font 
                    color=#ffffff>S12</font></b></td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>哈萨克斯坦</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>乌兹别克斯坦</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>亚美尼亚</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>1940</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr valign=center align=middle bgcolor=#ffffff> 
                            <td bgcolor=#eeeeee>伊朗</td>
                            <td>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td align=middle>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td align=middle>/</td>
                            <td>1500</td>
                            <td>1200</td>
                            <td>1500</td>
                            <td>3500</td>
                            <td>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>埃塞俄比亚</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>2520</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1940</div>
                            </td>
                            <td align=middle>2230</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1640</div>
                            </td>
                            <td align=middle>2030</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>安哥拉</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>1930</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>刚果（金）</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>加蓬</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>1960</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1620</div>
                            </td>
                            <td align=middle>1750</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1320</div>
                            </td>
                            <td align=middle>1550</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>喀麦隆</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td> 
                              <div align=center>/</div>
                            </td>
                            <td align=middle>/</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr valign=center align=middle bgcolor=#ffffff> 
                            <td bgcolor=#eeeeee>科特迪瓦</td>
                            <td>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td align=middle>/</td>
                            <td>/</td>
                            <td>/</td>
                            <td align=middle>/</td>
                            <td>1500</td>
                            <td>1200</td>
                            <td>1500</td>
                            <td>3500</td>
                            <td>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>白俄罗斯</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>2100</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1600</div>
                            </td>
                            <td align=middle>1850</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1300</div>
                            </td>
                            <td align=middle>1650</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee><font 
                        color=#ff0000>荷兰</font></td>
                            <td> 
                              <div align=center>4300</div>
                            </td>
                            <td align=middle>1980</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1540</div>
                            </td>
                            <td align=middle>1760</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1240</div>
                            </td>
                            <td align=middle>1560</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>摩尔多瓦</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>1970</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1560</div>
                            </td>
                            <td align=middle>1770</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1260</div>
                            </td>
                            <td align=middle>1570</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>乌克兰</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>1930</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr valign=center align=middle bgcolor=#ffffff> 
                            <td bgcolor=#eeeeee><font color=#ff0000>英国</font></td>
                            <td>4300</td>
                            <td>2040</td>
                            <td>1160</td>
                            <td>1570</td>
                            <td align=middle>1810</td>
                            <td>860</td>
                            <td>1270</td>
                            <td align=middle>1610</td>
                            <td>1500</td>
                            <td>1200</td>
                            <td>1500</td>
                            <td>3500</td>
                            <td>500</td>
                          </tr>
                          <tr valign=center align=middle bgcolor=#ffffff> 
                            <td bgcolor=#eeeeee>巴拿马</td>
                            <td>4500</td>
                            <td>2760</td>
                            <td>1160</td>
                            <td>1680</td>
                            <td align=middle>2300</td>
                            <td>860</td>
                            <td>1380</td>
                            <td align=middle>2100</td>
                            <td>1500</td>
                            <td>1200</td>
                            <td>1500</td>
                            <td>3500</td>
                            <td>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>巴西</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>2300</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1710</div>
                            </td>
                            <td align=middle>1970</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1410</div>
                            </td>
                            <td align=middle>1770</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>玻利维亚</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>1930</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>厄瓜多尔</td>
                            <td> 
                              <div align=center>4500</div>
                            </td>
                            <td align=middle>1930</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee><font 
                        color=#ff0000>美国</font></td>
                            <td> 
                              <div align=center>4300</div>
                            </td>
                            <td align=middle>1930</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1520</div>
                            </td>
                            <td align=middle>1730</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>1220</div>
                            </td>
                            <td align=middle>1530</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>委内瑞拉</td>
                            <td valign=center align=middle>4500</td>
                            <td valign=center align=middle>2140</td>
                            <td valign=center align=middle>1160</td>
                            <td valign=center align=middle>1610</td>
                            <td valign=center align=middle>1880</td>
                            <td valign=center align=middle>860</td>
                            <td valign=center align=middle>1310</td>
                            <td valign=center align=middle>1680</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>1200</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>3500</td>
                            <td valign=center align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>智利</td>
                            <td valign=center align=middle>4500</td>
                            <td valign=center align=middle>1960</td>
                            <td valign=center align=middle>1160</td>
                            <td valign=center align=middle>1530</td>
                            <td valign=center align=middle>1750</td>
                            <td valign=center align=middle>860</td>
                            <td valign=center align=middle>1230</td>
                            <td valign=center align=middle>1550</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>1200</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>3500</td>
                            <td valign=center align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>香港和澳门</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>1200</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>3500</td>
                            <td valign=center align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>台湾</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>/</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>1200</td>
                            <td valign=center align=middle>1500</td>
                            <td valign=center align=middle>3500</td>
                            <td valign=center align=middle>500</td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle bgcolor=#eeeeee>其他国家</td>
                            <td> 
                              <div align=center>3800</div>
                            </td>
                            <td align=middle>1530</td>
                            <td> 
                              <div align=center>1160</div>
                            </td>
                            <td> 
                              <div align=center>1260</div>
                            </td>
                            <td align=middle>1340</td>
                            <td> 
                              <div align=center>860</div>
                            </td>
                            <td> 
                              <div align=center>960</div>
                            </td>
                            <td align=middle>1140</td>
                            <td align=middle>1500</td>
                            <td align=middle>1200</td>
                            <td align=middle>1500</td>
                            <td align=middle>3500</td>
                            <td align=middle>500</td>
                          </tr>
                          </tbody> 
                        </table>
                        <table class=a9 cellspacing=5 cellpadding=0 width="100%" 
                  border=0>
                          <tbody> 
                          <tr> 
                            <td> 
                              <div align=right>[ 价格单位：RMB元 | 其中 E1，S1-S7，S10，S11项服务：<u>所示价格为全部费用总和</u> 
                                ]<br>
                                [ S8，S9，S12项服务：<u>所示价格仅指服务费</u>，另有政府费用凭政府发票实报实销 
                                ]</div>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <br>
                        E1、目前持普通旅游（L）或者商务（F）签证，希望得到：1年多次签证<br>
                        S1、目前持普通旅游（L）或者商务（F）签证，希望得到：6个月多次签证<br>
                        S2、目前持普通旅游（L）或者商务（F）签证，希望得到：6个月0次签证 [<font color=#ff0000> 
                        New!</font>]<br>
                        S3、目前持普通旅游（L）或者商务（F）签证，希望得到：6个月1次签证 [<font 
                  color=#ff0000> New!</font>]<br>
                        S4、目前持普通旅游（L）或者商务（F）签证，希望得到：6个月2次签证 [<font 
                  color=#ff0000> New!</font>]<br>
                        S5、目前持普通旅游（L）或者商务（F）签证，希望得到：3个月0次签证<br>
                        S6、目前持普通旅游（L）或者商务（F）签证，希望得到：3个月1次签证<br>
                        S7、目前持普通旅游（L）或者商务（F）签证，希望得到：3个月2次签证<br>
                        S8、目前持任何类型签证，第一次办理1年多次（台湾为2年）就业证、工作签证＋居留许可（无需面试）<br>
                        S9、目前持工作（Z）签证，希望延期1年多次就业证、工作签证＋居留许可（无需体检）<br>
                        S10、目前持任何类型签证，希望得到：上海本地外国人驾驶证（有效期6年） [<font color=#ff0000> 
                        New!</font>]<br>
                        S11、目前持工作（Z）签证，希望得到：外国人养犬证（有效期1年）<br>
                        S12、来沪工作的外国人员家属随就业人办理工作签证＋居留许可（500元/人为服务费，不含政府费用）<br>
                        <font 
                  color=#ff0000>*以上所有服务都能够在上海完成，无需外国人出境，无需外国人面试，可加急。<br>
                        </font><font 
                  color=#ff0000>*以上所有服务我公司提供免费递送，付款方式为办结后付款。</font><br>
                        <br>
                        <span 
                  class=a105>以上服务项目对应的材料需求清单：<br>
                        </span><br>
                        <b>E1服务项目：1年多次签证申办[<font 
                  color=#ff0000> New!</font>]需准备的材料</b><br>
                        材料：护照、1张2寸照片<br>
                        <u>正常办理时限</u>：10个工作日 <br>
                        <br>
                        注：此类签证我们会送至山东分部签发，由于政策的原因签出率有时候不能得到保证。其实我们还是<b><font 
                  color=#ff0000>强烈建议</font></b>您办理3-6个月的签证，因为3-6个月的签证（S1-S7的服务）在上海的签出率100%，价格相对便宜而且出证时间短。如果您确实特别需要E1服务的话，我们建议先将护照及目前签证复印件传真至我公司，然后由我们和山东分部确认无误后再进行操作。<br>
                        <br>
                        <b>S1-S7服务项目：签证延期需准备的材料</b><br>
                        材料：护照，临时住宿登记表（<a 
                  href="http://www.visainchina.com/images/regform.jpg" 
                  target=_blank><u>点击查看样表</u></a>）、1张2寸照片<br>
                        <u>正常办理时限</u>：5个工作日<br>
                        <br>
                        注：临时住宿登记表办理（两种方案，可供选择）<br>
                        1、外国人去居住地所在派出所自行办理（推荐！每次出入境或迁址都必须重新登记）<br>
                        2、入住涉外宾馆1晚，在宾馆前台可登记办理（别忘记请宾馆敲章，填写离店日期时最好填未定）<br>
                        <br>
                        <b><span 
                  class=a105><a 
                  name=express></a></span>S8服务项目：1年多次工作签证/居留许可申办需准备的材料</b><br>
                        1、护照（Passport）<br>
                        2、简历（Resume or C.V. Written by yourself）<br>
                        3、临时住宿登记表（Registration Form Of Temporary Residence）*<br>
                        4、健康证明（Health Certificated）<br>
                        5、资格证明（Qualification Document）<br>
                        6、劳动合同（Labor Contract）<br>
                        7、营业执照和组织机构代码证复印件，如是外资企业还需提供批准证书（Business License）<br>
                        8、8张2寸照片<br>
                        <u>正常办理时限</u>：10个工作日<u></u><u><br>
                        普通加急服务</u>：7个工作日，额外加急费用400元<br>
                        <br>
                        <font 
                  color=#ff0000><b>*最新消息：</b></font>自2005年8月22日起，凡持有L，F，X签证外籍人士服务于：1、公司注册资金小于300万美金或者2、职位低于副总经理职位的，无法直接申办就业证！办理期间必须出境一次办理Z签证入境后，方可继续申请就业证和居留许可。详细信息请来电33011478咨询！<br>
                        <br>
                        <b>S9服务项目：1年多次工作签证、居留许可延期需准备的材料</b><br>
                        1、护照及有效工作签证、居留许可<br>
                        2、就业证（Work Permit）<br>
                        3、最新的劳动合同（Labor Contract）<br>
                        4、营业执照和组织机构代码证复印件，如是外资企业还需提供批准证书（Business License）<br>
                        5、3张2寸照片<br>
                        <u>正常办理时限</u>：8个工作日<u></u><u><br>
                        普通加急服务</u>：6个工作日，额外加急费用400元<br>
                        <br>
                        <b><a 
                  name=driver></a>S10服务项目：外国人本地驾驶证申办[<font color=#ff0000> New!</font>]需准备的材料</b><br>
                        1、国外驾驶证<br>
                        2、必须为公安局出具的临时住宿登记表（宾馆出具的无效）<br>
                        3、护照及有效签证（或者台胞证或者回乡证）<br>
                        <u>正常办理时限</u>：1个工作日<u></u><br>
                        <u>*特殊服务时限</u>：10个工作日<br>
                        <br>
                        其间需要进行简单体检及上海交通法规的电脑考试（可选英语或中文），交通法规例题共100道，电脑会从中选取20题，如果能取得80分以上就算通过。交通法规例题可从自行来本公司领取。<br>
                        <br>
                        *特殊服务时限 - 如果外国人不想体检及考试（或者是上海以外无法准备以上材料的），我们也能够提供相应服务，详细情况可来电（021-33011478）咨询！<br>
                        <br>
                        <b>S11服务项目：外国人养犬证申办需准备的材料</b><br>
                        1、犬类健康证<br>
                        2、护照及有效工作签证、居留许可<br>
                        3、护照和工作签证（或者台胞证或者回乡证）<br>
                        4、5张犬照<br>
                        5、5张犬主人照<br>
                        6、价格市区RMB3500；郊区RMB2500<br>
                        <u>正常办理时限</u>：30个工作日<u></u> <br>
                        <br>
                        <b>S12服务项目：外国工作人员家属签证、居留证申办需准备的材料</b><br>
                        1、夫妻需提供结婚证书（未婚同居需提供大使馆出具的同居证明信）<br>
                        2、孩子需提供出生证明<br>
                        3、成人需要做体检，并提供健康证明<br>
                        4、临时住宿登记表（Registration Form Of Temporary Residence）<br>
                        5、家属的有效护照与签证<br>
                        6、外国工作者的护照及有效工作签证、居留许可<br>
                        7、2寸照片各2张<br>
                        <u>正常办理时限</u>：5个工作日<u></u><br>
                        <br>
                        <br>
                        <br>
                        <br>
                        <br>
                      </td>
                      <td width=20><img height=20 src="images/spacer.gif" 
                  width=20></td>
                    </tr>
                    </tbody> 
                  </table>
                </td>
              </tr>
              </tbody> 
            </table>
          </td>
          <td width=171> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td><img height=48 src="images/topcorner.gif" width=149></td>
              </tr>
              <tr> 
                <td> 
                  <table class=a9 cellspacing=1 cellpadding=3 width=149 
            bgcolor=#000000 border=0>
                    <tbody> 
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa3.asp"><font color="#FF0000">在沪外国人签证服务</font></a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa4.asp">台胞证签注加注服务</a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa6.asp">上海居民港澳通行证</a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa5.asp">中国居民出国游签证</a></b></td>
                    </tr>
                    </tbody> 
                  </table>
                </td>
              </tr>
              <tr> 
                <td><img height=141 src="images/pricepic2.jpg" 
width=149></td>
              </tr>
              <tr> 
                <td 
            class=a9><br>
                  <b>公司地址：</b><br>
                  上海市普陀区中山北路2360号510室<br>
                  <b>工作时间：</b><br>
                  星期一至五：8:30AM-10:00PM<br>
                  <b>联系电话：</b><br>
                  国内特价机票 86-21-63018557<br>
                  国际特价机票 86-21-63074026<br>
                  火车票 86-21-29949106<br>
                  <b>电子信箱：</b><br>
                  <a 
            href="mailto:"><u></u></a><br>
                  <br>
                  <img 
            height=120 src="images/pic5.jpg" 
            width=149><br>
                  <br>
                  <b>相关连接：</b><br>
                  <a 
            href="cvisaform.asp"><u>样本文档下载中心</u></a><br>
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
<!--#include file="bottom.asp" --><BR>
</DIV>
</BODY></HTML>
