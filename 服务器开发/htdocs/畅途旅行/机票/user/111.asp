<!--#include file="../inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=site_name%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="中国,上海,步步高航空,步步高航空票务中心,步步高商务旅行网, 国内机票, 国际机票, 特价机票,打折机票,上海飞机票,飞机票, 火车票, 酒店预定, 旅游咨询, 商务签证, 航班查询, 预定服务">
<meta name="keywords" content="中国,上海,步步高航空,步步高航空票务中心,步步高商务旅行网, 国内机票, 国际机票, 特价机票,打折机票,上海飞机票,飞机票, 火车票, 酒店预定, 旅游咨询, 商务签证, 航班查询, 预定服务">
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
<LINK href="../images/yide.css" type=text/css rel=stylesheet>

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
<!--#include file="../top.asp" --><table cellspacing=0 cellpadding=0 width=978 align=center border=0>
  <tbody> 
  <tr> 
    <td valign=top align=middle width=200>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="../images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 
            src="../images/tit_u_l.gif" width=9></td>
          <td align=middle><font 
                color=#666666><b>最 新 公 告</b></font></td>
          <td width=9><img height=28 
            src="../images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid; repeat-x: " 
      height=180 cellspacing=3 cellpadding=0 width=200 bgcolor=#a20000 
      background="../images/le_bg1.gif" border=0>
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
      background="../images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=20 
            src="../images/tit_d_l.gif" width=9></td>
          <td align=right><img 
            height=9 
            src="../images/arrow_right(1).gif" 
            width=5 border=0></td>
          <td width=9><img height=20 
            src="../images/tit_d_r.gif" 
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
                        height=9 src="../images/dian%5B1%5D.gif" width=8 vspace="6" align="absmiddle" hspace="3"><a href="../changshi_show.asp?id=<%=rs_gg("id")%>" target="_blank"> 
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
                        <div align="right"><a href="../server_index.asp" target="_blank">更多&gt;&gt;&gt;</a></div>
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
            src="../images/home.htm" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=10><img height=10 alt="" 
            src="../images/home.htm" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="../images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 
            src="../images/tit_u_l.gif" width=9></td>
          <td align=middle><font 
                color=#666666><b>特 价 机 票</b></font></td>
          <td width=9><img height=28 
            src="../images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=200 border=0>
        <tbody> 
        <td background="../images/line_r_b.gif" 
          height=1><img height=1 src="../images/mao.gif" 
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
                        style="FONT-SIZE: 9pt"></span><a href="../stu_show.asp?id=<%=rs("id")%>" target="_blank" class="textbody"> 
                        </a> 
                        <table cellspacing=2 cellpadding=0 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                        style="FONT-SIZE: 9pt"><font color=#ff0000><img 
                        height=9 src="../images/dian%5B1%5D.gif" width=8 hspace="5"></font></span></font></td>
                            <td width=187><span class="textbody"><a href=../dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              </a></span><span class="tab1"><a href=../trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
                              </a><a href="../stu_show.asp?id=<%=rs("id")%>" target="_blank" class="textbody"> 
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
                  <span class="tab1"><a href="../student_index.asp" class="textbody">更多&gt;&gt;&gt;</a></span></td>
              </tr>
            </table>
            <span 
            id=lb_GunGuoji></span></td>
        </tr>
        <tr> 
          <td background="../images/line_r_b.gif" 
          height=1><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=10><img height=10 alt="" 
            src="../images/home.htm" width=1></td>
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
          <td background="../images/line_r_b.gif" 
          height=1><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        <tr> 
          <td><a href="#"><img height=90 
            alt=学生机票 src="../images/index_ad_02.gif" 
            width=194 border=0></a> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=6 src="../images/mao.gif" 
            width=6></td>
              </tr>
              </tbody> 
            </table>
            <a href="#"><img height=93 
            alt=学生机票 src="../images/index_ad_01.jpg" 
            width=194 border=0></a> </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=6 src="../images/mao.gif" 
            width=6></td>
        </tr>
        </tbody> 
      </table>
    </td>
    <td valign=top align=middle width="578"> 
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table width="558" cellspacing="0" cellpadding="0" height="29" background="../images/search_bg.gif" align="center">
        <tr> 
          <td width="1%"><img height=29 
            src="../images/search_l.gif" width=14></td>
          <td width="96%"><marquee onMouseOver=this.stop() onMouseOut=this.start() scrollamount=2 
      scrolldelay=2 width="100%">&nbsp;&nbsp;&nbsp; <font size=2><b>我们的工作时间 8:00--22:00 
            本公司与所有国际,国内50余家航空公司建立了良好的关系,在业界具有良好的口碑,在座位紧张时,我公司可为您申请经济的机票舱位</b></font>&nbsp;&nbsp;&nbsp;&nbsp;</marquee></td>
          <td width="3%"><img height=29 
            src="../images/search_r.gif" 
        width=14></td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table width="100%" cellspacing="0" cellpadding="0">
        <tr> 
          <td> 
            <div align="center"><object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="558" height="111">
                <param name="movie" value="../images/index_top.swf">
                <param name="quality" value="High">
                <param name="wmode" value="transparent">
                <embed src="../images/index_top.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="558" height="111" quality="High" wmode="transparent">
                </embed> 
              </object></div>
          </td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <a 
      href="http://www.yide.com/help/newkid.asp"> </a> 
      <table width="100%" cellspacing="0" cellpadding="0" background="../images/index_form_bj.gif">
        <tr>
          <td>
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5%" valign="top">&nbsp;</td>
                <td width="10%" align="center" valign="top"><span style="FONT-SIZE: 9pt"><img 
                              height=83 src="../images/search_img.gif" 
                              width=94></span></td>
                <td width="85%" align="right" valign="top"> 
                  <table width="100%"  border="0" cellpadding="0" cellspacing="0" class="bkgreen+">
                    <tr> </tr>
                    <tr> 
                      <td> 
                        <table cellspacing="0" cellpadding="3" width="80%" border="0" id="table12">
                          <tr> 
                            <td colspan="5"> 
                              <div align="right" class="f9b style11"> 
                                <p align="left" class="textbody"> ·国际机票搜索 
                              </div>
                            </td>
                          </tr>
                          <form method="POST"   name="regfrom" action="../guoji_hangban_list.asp">
                            <tr> 
                              <td width="53%"> <font color="#444444"> 
                                <%
  set rs_area=Server.CreateObject("AdoDb.RecordSet")
        rs_area.open "select * from area order by area",conn,1,1
	if rs_area.eof and rs_area.bof then
	response.write "请选择大州"
	response.end
	else
%>
                                <select name="areaid" size="1" id="select2" onChange="changelocation(document.all.areaid.options[document.all.areaid.selectedIndex].value)">
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
                                </font></td>
                              <td width="32%"> <font color="#444444"> 
                                <select name="countryid" onChange="changelocationz(document.regfrom.countryid.options[document.regfrom.countryid.selectedIndex].value)">
                                  <option value="0" selected>请选择国家</option>
                                </select>
                                </font></td>
                              <td width="2%"> <font color="#444444"> 
                                <select name="cityid">
                                  <option value="0" selected>请选择城市</option>
                                </select>
                                </font></td>
                              <td width="2%"> 
                                <input name="imageField2" type="image" style="height:18px" src="../images/6.gif" onClick="return guoji_check()" width="35" height="18" border="0">
                              </td>
                            </tr>
                          </form>
                        </table>
                        <table cellspacing="0" cellpadding="3" width="80%" border="0" id="table12">
                          <tr> 
                            <td colspan="5"><span class="textbody">·国内机票搜索</span></td>
                          </tr>
                          <form method="POST"   name="regfrom1" action="../guonei_hangban_list.asp">
                            <tr> 
                              <td colspan="5"> 
                                <p> 
                                  <%sql="select * from address order by address asc"
rs.Open sql,conn,3,2%>
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
                    rs.close
                        %>
                                  </select>
                                  <font color="#6A6A6A"> 
                                  <input name="imageField2" type="image" style="height:18px" src="../images/6.gif" onClick="return guonei_check()" width="35" height="18" border="0">
                                  </font> 
                              </td>
                            </tr>
                          </form>
                        </table>
                        <table cellspacing=0 cellpadding=0 width="100%" border=0>
                          <tbody> 
                          <tr> 
                            <td height=5><img height=6 src="../images/mao.gif" 
            width=6></td>
                          </tr>
                          </tbody> 
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
            </table>
      </td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=546 border=0 align="center">
        <tbody> 
        <td background="../images/line_r_b.gif" 
          height=1><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="578" border=0>
        <tbody> 
        <tr> 
          <td width=10></td>
          <td> 
            <table border="0" cellpadding="1" cellspacing="1" width="98%" align="center" bordercolor="#C0C2C2" class="textbody">
              <tr height="22"> 
                <td width="15%" height="20" align="center"> 
                  <div align="left"><b>国内机票航程</b></div>
                </td>
                <td width="19%" height="20" align="center"> 
                  <div align="left"><b>航空公司</b></div>
				</td>
                <td width="18%" height="20" align="center"> 
                  <div align="left"><b>航班号</b></div>
                </td>
                <td width="21%" height="20" align="center"> 
                  <div align="left"><b>全价</b></div>
                </td>
                <td width="15%" height="20" align="center"> 
                  <div align="left"><b>特价</b></div>
                </td>
                <td width="12%" align="center"> 
                  <div align="left">详情</div>
                </td>
              </tr>
              <%
             sql="select top 18 id,address,price,minprice from holiday where flag=1 order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount
			if rs.Eof then exit for
			%>
              <tr <%if i mod 2=1 then %> bgcolor="#F2F1EE" <%end if%> onMouseMove="roll(this,'in','#D9F2FF');" 
                          onMouseOut="roll(this,'out')"> 
                <td height="25" width="15%"> <%=rs("address")%> 
                  <div align="left"></div>
                </td>
                <td height="25" width="19%"><%=rs_search("company")%> 
                  <div align="left"></div>
                </td>
                <td height="25" width="18%"><%=rs_search("flycode")%> 
                  <div align="left"></div>
				</td>
                <td height="25" width="21%"> <%=rs("price")%> 
                  <div align="left"></div>
                </td>
                <td height="25" width="15%"> <%=rs("minprice")%> 
                  <div align="left"></div>
                </td>
                <td height="25" width="12%"> 
                  <div align="left"><a href="#"  onClick="window.open('guoneitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">查看</a></div>
                </td>
                <%rs.Movenext
		  next
		  rs.close%>
            </table>
            <span id=lb_View> </span></td>
          <td width=10></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=5 width="578" border=0>
        <tbody> 
        <tr align=middle> 
          <td width="33%"><a 
            href="http://www.yide.com/sale/sale_list.asp?category_id=15"><img 
            height=89 alt="" src="../images/a2.jpg" width=180 
            border=0></a></td>
          <td width="33%"><a 
            href="http://www.yide.com/sale/sale_list.asp?category_id=5"><img 
            height=89 alt="" src="../images/a5.jpg" width=180 
            border=0></a></td>
          <td width="33%"><a 
            href="http://www.yide.com/featuredproducts/Products_spo.asp?category_id=14"><img 
            height=89 alt="" src="../images/a6.jpg" width=180 
            border=0></a></td>
        </tr>
        </tbody> 
      </table>
      <table width="100%" cellspacing="0" cellpadding="0">
        <tr>
          <td>
            <div align="center"><object classid="clsid:D27CDB6E-AE6D-11CF-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,40,0" border="0" width="558" height="117">
                <param name="movie" value="../images/1.swf">
                <param name="quality" value="High">
                <param name="wmode" value="transparent">
                <embed src="../images/1.swf" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="558" height="117" quality="High" wmode="transparent">
                </embed> 
              </object></div>
          </td>
        </tr>
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=546 border=0 align="center">
        <tbody> 
        <td background="../images/line_r_b.gif" 
          height=1><img height=1 src="../images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="578" border=0>
        <tbody> 
        <tr> 
          <td width=10></td>
          <td> 
            <table border="0" cellpadding="1" cellspacing="1" width="98%" align="center" bordercolor="#C0C2C2" class="textbody">
              <tr height="22"> 
                <td width="27%" align="center"  height="20"> 
                  <div align="left"><b>国际机票航程</b></div>
                </td>
                <td width="25%" height="20" align="center"> 
                  <div align="left"><b>航空公司</b></div>
                </td>
                <td width="18%" height="20" align="center"> 
                  <div align="left"><b>单程</b></div>
                </td>
                <td width="20%" height="20" align="center"> 
                  <div align="left"><b>往返</b></div>
                </td>
                <td width="10%" align="center"> 
                  <div align="left">详情</div>
                </td>
              </tr>
              <%'sql="select top 10 address,price,minprice from holiday1 order by id desc"
		  sql="select top 18 id,address,price,company,from_city,content,minprice from holiday1  where flag=1 order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
              <tr <%if i mod 2=1 then %> bgcolor="#F2F1EE" <%end if%>  onMouseMove="roll(this,'in','#D9F2FF');" 
                          onMouseOut="roll(this,'out')"> 
                <td width="27%" height="25"><%=rs("from_city")%> →<%=rs("address")%></td>
                <td width="25%" height="25"> <%=rs("company")%> 
                  <div align="left"></div>
                </td>
                <td width="18%" height="25"> <%=rs("price")%> 
                  <div align="left"></div>
                </td>
                <td width="20%" height="25"> <%=rs("minprice")%> 
                  <div align="left"></div>
                </td>
                <td width="10%" height="25"> 
                  <div align="left"><a href="#"  onClick="window.open('guojitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">查看</a></div>
                </td>
              </tr>
              <%rs.Movenext
		  next
		  rs.close%>
            </table>
            <span id=lb_View> </span></td>
          <td width=10></td>
        </tr>
        </tbody> 
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
          <td height=5><img height=5 src="../images/mao.gif" 
            width=5></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="../images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 
            src="../images/tit_u_l.gif" width=9></td>
          <td align=middle><font 
                color=#666666><b> 在 线 订 票</b></font></td>
          <td width=9><img height=28 
            src="../images/tit_u_r.gif" 
      width=9></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-TOP: #cfcfcf 1px solid; BACKGROUND:  url(../images/ri_bg2.gif) repeat-x 50% top; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=1 cellpadding=0 width=200 border=0>
        <tbody> 
        <tr> 
          <td width=1038 colspan=3 height=2></td>
        </tr>
        </tbody> 
      </table>
      <table style="BACKGROUND:  url(../images/ri_bg2.gif) repeat-x 50% top" 
      cellspacing=0 cellpadding=5 width=200 border=0>
        <tbody> 
        <tr> 
          <td colspan=3 height=2></td>
        </tr>
        <tr> 
          <td style="PADDING-LEFT: 10px" valign=top colspan=3><a 
            href="../content.asp"><font 
            color=#ffffff>国内特价机票 651349091<br>
            国际特价机票 651349092<br>
            火   车   票 651349093<br>
            商务旅游签证 651349094</font></a></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-TOP: #cfcfcf 1px solid; BACKGROUND:  url(../images/ri_bg2.gif) repeat-x 50% top; BORDER-LEFT: #cfcfcf 1px solid" 
      height=100 cellspacing=10 cellpadding=0 width=200 bgcolor=#a20000 
border=0>
        <tbody> 
        <tr> 
          <td><a href="../aboutus.asp"><font 
            color=#ffffff>上海优仕互联航空服务有限公司<br>
            是中国民航华东管理局批准的民航售票点，国际航协运输协会（IATA）会员...</font>. </a></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=200 bgcolor=#e9e9e9 
      background="../images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=20 
            src="../images/tit_d_l(1).gif" 
            width=9></td>
          <td align=right>&nbsp;<img 
            height=9 
            src="../images/arrow_right(1).gif" 
            width=5 border=0></td>
          <td width=9><img height=20 
            src="../images/tit_d_r(1).gif" 
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
            alt=学生机票 src="../images/index_ad_03.gif" 
            width=200 border=0> </a> 
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="../images/tit_u_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=28 src="" width=9></td>
          <td align=middle><font 
                color=#666666><b>旅 游 频 道</b></font></td>
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
                              height=5 src="../images/spacer.gif" 
                              width=1></span></td>
                    </tr>
                  </table>
                  <% 
		  sql="select top 9 title,id from trip where flag=true  order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="20"><span class="tab1"><a href=../trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
                        </a></span> 
                        <table cellspacing=2 cellpadding=0 width=100% 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                  style="FONT-SIZE: 9pt"><img height=7 
                  src="../images/right_04_tu1.gif" width=7></span></font></td>
                            <td width=187><span class="textbody"><a href=../dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              </a></span><span class="tab1"><a href=../trip_show.asp?id=<%=rs("id")%> target="_blank" class="textbody"> 
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
                    <a href="../trip.asp" class="textbody">更多&gt;&gt;&gt;</a></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="../images/tit_u_bg.gif" border=0>
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
                              height=5 src="../images/spacer.gif" 
                              width=1></span></td>
                    </tr>
                  </table>
                  <% 
		  sql="select top 10 title,id from dingfang where flag=true  order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
                  <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                    <tr> 
                      <td height="20"><span class="textbody"><a href=../dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                        </a></span> 
                        <table cellspacing=2 cellpadding=0 width=100% 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                  style="FONT-SIZE: 9pt"><img height=7 
                  src="../images/right_04_tu1.gif" width=7></span></font></td>
                            <td width=187><a href=../dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
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
                    <a href="../dingfang.asp" class="textbody">更多&gt;&gt;&gt;</a></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" bgcolor=#e9e9e9 
      background="../images/tit_d_bg.gif" border=0>
        <tbody> 
        <tr> 
          <td width=9><img height=1 src="" width=1></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width="100%" border=0>
        <tbody> 
        <tr> 
          <td height=5><img height=6 src="../images/mao.gif" 
            width=6></td>
        </tr>
        </tbody> 
      </table>
      
      <table cellspacing=0 cellpadding=0 width=210 border=0>
        <tbody> 
        <tr> 
          <td> 
            <table cellspacing=0 cellpadding=0 width=200 border=0>
              <tbody> 
              <tr> 
                <td width=10>&nbsp;</td>
                <td width=26><img height=23 
                  src="../images/index_r6_c2.gif" width=26></td>
                <td bgcolor=#e7e7e7> 
                  <table height=18 cellspacing=0 cellpadding=0 width="100%" 
                  border=0>
                    <tbody> 
                    <tr> 
                      <td width=10>&nbsp;</td>
                      <td valign=bottom align=left><span class=p9hui><span 
                        class=p9hui><strong>中国人出国旅游签证</strong></span></span></td>
                    </tr>
                    </tbody>
                  </table>
                  <span 
                  class=p9hui><strong></strong></span></td>
              </tr>
              </tbody>
            </table>
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td>&nbsp;</td>
              </tr>
              </tbody>
            </table>
            <table cellspacing=0 cellpadding=0 width=190 border=0>
              <tbody> 
              <tr> 
                <td valign=top align=left width=10 height=110>&nbsp;</td>
                <td valign=top align=left> 
                  <p><img height=50 src="../images/index_r16_c9.jpg" 
                  width=52 align=right><span class=line><span 
                  class=style3>当您需要去国外参加商务活动或者前往自助游时，</span>办理签证是否一件很麻烦的事情？需要咨询多种信息、填写众多表格。咨询我们，将会为您提供协办多国签证的服务。 
                    </span></p>
                </td>
              </tr>
              </tbody>
            </table>
            <table cellspacing=0 cellpadding=0 width=200 border=0>
              <tbody> 
              <tr> 
                <td align=right><a href="#" 
                  target=_self><img height=16 
                  src="../images/index_r12_c7.jpg" width=90 
              border=0></a></td>
              </tr>
              </tbody>
            </table>
            <table cellspacing=0 cellpadding=0 width=200 border=0>
              <tbody> 
              <tr> 
                <td 
              background=../%F7%EB%B0%C2%C9%CC%CE%F1%D7%C9%D1%AF%CD%F8.files/index_r13_c7.gif>&nbsp;</td>
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
            <table cellspacing=0 cellpadding=0 width=210 border=0>
              <tbody> 
              <tr> 
                <td> 
                  <table cellspacing=0 cellpadding=0 width=200 border=0>
                    <tbody> 
                    <tr> 
                      <td width=10>&nbsp;</td>
                      <td width=26><img height=23 
                        src="../images/index_r6_c2.gif" width=26></td>
                      <td bgcolor=#e7e7e7> 
                        <table height=18 cellspacing=0 cellpadding=0 
                        width="100%" border=0>
                          <tbody> 
                          <tr> 
                            <td width=10>&nbsp;</td>
                            <td valign=bottom align=left><span 
                              class=p9hui><span 
                              class=p9hui><strong>上海居民港澳通行证</strong></span></span></td>
                          </tr>
                          </tbody>
                        </table>
                        <span 
                        class=p9hui><strong></strong></span></td>
                    </tr>
                    </tbody>
                  </table>
                  <table cellspacing=0 cellpadding=0 width=210 border=0>
                    <tbody> 
                    <tr> 
                      <td valign=top align=left height=120> 
                        <table cellspacing=0 cellpadding=0 width="100%" 
border=0>
                          <tbody> 
                          <tr> 
                            <td>&nbsp;</td>
                          </tr>
                          </tbody>
                        </table>
                        <table cellspacing=0 cellpadding=0 width="190" 
border=0>
                          <tbody> 
                          <tr> 
                            <td width=10 height=110>&nbsp;</td>
                            <td width="209"><img height=46 
                              src="../images/index_r21_c3.jpg" width=56 
                              align=left><span class=line><span 
                              class=style3>请自行至吴淞路333号上海市出入境管理局递交相</span>关材料， 
                              在顺利递交材料后，政府机关会给于您领证回执一张，只要将领证回执交给我们，我们就可以帮助你加急取证 
                              。</span></td>
                          </tr>
                          </tbody>
                        </table>
                      </td>
                    </tr>
                    </tbody>
                  </table>
                  <table cellspacing=0 cellpadding=0 width=200 border=0>
                    <tbody> 
                    <tr> 
                      <td align=right>
                        <h3><a 
                        href="#" 
                        target=_self><img height=16 
                        src="../images/index_r12_c7.jpg" width=90 
                        border=0></a></h3>
                      </td>
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
<!--#include file="../bottom.asp" --><BR>
</DIV>
</BODY></HTML>
