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
                        <span 
                  class=a105>赴港澳通行证加急及护照加急服务（请自行根据需要对应查询）：<br>
                        <br>
                        </span><b>请选择：</b>[1] <a 
                  href="cvisa6.asp#txz"><u>港澳通行证加急服务</u></a> [2] <a 
                  href="cvisa6.asp#hz"><u>护照加急服务</u></a><br>
                        <br>
                        <font 
                  color=#ff0000><b><font color=#ff0000><a 
                  name=txz></a></font>[1] 港澳通行证加急服务：</b></font><br>
                        请自行至吴淞路333号上海市出入境管理局递交相关材料（材料清单请参考下表，并在填表时领证地点请勾选<b>吴淞路333号总部领证</b>，这样我们出证的速度最快），在顺利递交材料后，政府机关会给于您领证回执一张，只要将领证回执交给我们，我们就可以帮助你加急取证，费用是650元（不包括领证时所需的政府费用，此费用我们会凭政府发票实报实销），5个工作日出证。<br>
                        <br>
                        自行送证时，您可根据需要参考下表相应的材料准备清单，或拨打政府咨询电话（021-32031123）查询：<br>
                        <table class=a9 cellspacing=1 cellpadding=0 width="100%" 
                  bgcolor=#000000 border=0>
                          <tbody> 
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>赴港、澳目的</td>
                            <td align=middle bgcolor=#efefef>服务内容</td>
                            <td align=middle bgcolor=#efefef>照片</td>
                            <td align=middle bgcolor=#efefef>停留天数/有效期</td>
                            <td align=middle bgcolor=#efefef> 
                              <p style="MARGIN: 8px">准备材料 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef rowspan=7>商务</td>
                            <td align=middle bgcolor=#ffffff>C01</td>
                            <td align=middle bgcolor=#ffffff>3张</td>
                            <td align=middle bgcolor=#ffffff>14天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">户口簿、身份证、<br>
                                营业执照、代码证、派遣函 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C02</td>
                            <td align=middle bgcolor=#efefef>3张</td>
                            <td align=middle bgcolor=#efefef>14天/3个月</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">户口簿、身份证、<br>
                                外省营业执照、派遣函、代码证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C03</td>
                            <td align=middle bgcolor=#ffffff>1张</td>
                            <td align=middle bgcolor=#ffffff>14天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">通行证、派遣函 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C04</td>
                            <td align=middle bgcolor=#efefef>1张</td>
                            <td align=middle bgcolor=#efefef>14天/3个月</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">通行证、派遣函、营业执照、代码证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C05</td>
                            <td align=middle bgcolor=#ffffff>3张</td>
                            <td align=middle bgcolor=#ffffff>14天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">通行证、派遣函、营业执照、代码证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C06</td>
                            <td align=middle bgcolor=#efefef>3张</td>
                            <td align=middle bgcolor=#efefef>14天/3个月</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">通行证、派遣函、营业执照、<br>
                                户口簿、身份证 、代码证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C07</td>
                            <td align=middle bgcolor=#ffffff>3张</td>
                            <td align=middle bgcolor=#ffffff>14天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">通行证、派遣函、营业执照、<br>
                                户口簿、身份证、遗失证明、代码证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef rowspan=4>旅游</td>
                            <td align=middle bgcolor=#efefef>C08</td>
                            <td align=middle bgcolor=#efefef>3张</td>
                            <td align=middle bgcolor=#efefef>7天/3个月</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">户口簿、身份证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C09</td>
                            <td align=middle bgcolor=#ffffff>1张</td>
                            <td align=middle bgcolor=#ffffff>7天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">通行证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C10</td>
                            <td align=middle bgcolor=#efefef>3张</td>
                            <td align=middle bgcolor=#efefef>7天/3个月</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">通行证 </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C11</td>
                            <td align=middle bgcolor=#ffffff>3张</td>
                            <td align=middle bgcolor=#ffffff>7天/3个月</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">通行证、户口簿、身份证 </p>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <br>
                        商务 C01、上海市本地居民首次办理<br>
                        商务 C02、就职于外省市的有上海户口的居民，首次办理<br>
                        商务 C03、曾办理过商务签，且原工作单位无变动<br>
                        商务 C04、A 曾办理过商务签，但原工作单位有变动 B 曾办理过旅游签 C 曾办理过探亲签<br>
                        商务 C05、旧版通行证换发<br>
                        商务 C06、A 新版通行证页数用完（换发） B 旧版通行证失效（换发）<br>
                        商务 C07、通行证遗失补发<br>
                        -------------------------------------------------------------------------------------<br>
                        旅游 C08、上海市本地居民首次办理<br>
                        旅游 C09、A 曾办理过旅游签 B 曾办理过商务签<br>
                        旅游 C10、旧版通行证换发<br>
                        旅游 C11、A 新版通行证页数用完（换发） B 旧版通行证失效（换发）<br>
                        -------------------------------------------------------------------------------------<br>
                        <br>
                        <font 
                  color=#ff0000><b><font color=#ff0000><a name=hz></a></font>[2] 
                        护照加急服务：</b></font><br>
                        请自行至吴淞路333号上海市出入境管理局递交相关材料（并在填表时领证地点请勾选<b>吴淞路333号总部领证</b>，这样我们出证的速度最快），在顺利递交材料后，政府机关会给于您领证回执一张，只要将领证回执交给我们，我们就可以帮助你加急取证，费用是650元（不包括领证时所需的政府费用，此费用我们会凭政府发票实报实销），5个工作日出证。<br>
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
                  href="cvisa3.asp">在沪外国人签证服务</a></b></td>
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
                  href="cvisa6.asp"><font color="#FF0000">上海居民港澳通行证</font></a></b></td>
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
