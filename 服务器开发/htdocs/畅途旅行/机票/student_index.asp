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
                  <%set rs=server.CreateObject("adodb.recordset")
%>
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
                color=#666666><b>酒 店 预 订</b></font></td>
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
      <table width="100%" cellspacing="0" cellpadding="0" background="images/index_form_bj.gif">
        <tr> 
          <td> 
            <table width="100%"  border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td width="5%" valign="top">&nbsp;</td>
                <td width="10%" align="center" valign="top"><span style="FONT-SIZE: 9pt"><img 
                              height=83 src="images/search_img.gif" 
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
                          <form method="POST"   name="regfrom" action="guoji_hangban_list.asp">
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
                                <input name="imageField2" type="image" style="height:18px" src="images/6.gif" onClick="return guoji_check()" width="35" height="18" border="0">
                              </td>
                            </tr>
                          </form>
                        </table>
                        <table cellspacing="0" cellpadding="3" width="80%" border="0" id="table12">
                          <tr> 
                            <td colspan="5"><span class="textbody">·国内机票搜索</span></td>
                          </tr>
                          <form method="POST"   name="regfrom1" action="guonei_hangban_list.asp">
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
                                  <input name="imageField2" type="image" style="height:18px" src="images/6.gif" onClick="return guonei_check()" width="35" height="18" border="0">
                                  </font> 
                              </td>
                            </tr>
                          </form>
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
          <td height=5><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <table 
      style="BORDER-RIGHT: #cfcfcf 1px solid; BORDER-LEFT: #cfcfcf 1px solid" 
      cellspacing=2 cellpadding=0 width=546 border=0 align="center">
        <tbody> 
        <td background="images/line_r_b.gif" 
          height=1><img height=1 src="images/mao.gif" 
            width=1></td>
        </tr>
        </tbody> 
      </table>
      <a 
      href="http://www.yide.com/help/newkid.asp"> </a> 
      <%

on error resume next
set rs=server.CreateObject("adodb.recordset")
sql="select * from student order by id desc"
rs.Open sql,conn,3,2
page=request("page")
if page="" then
page=1
end if

%>
      <table border="0" cellpadding="0" cellspacing="0" width="558" align="center">
        <tr> 
          <td width="100%" height="10"> 
            <div align="center"> 
              <table border="0" cellspacing="0" width="100%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" cellpadding="5">
                <%
rs.pagesize=20    
page=clng(page)    
if page>rs.pagecount then    
page=rs.pagecount    
end if    
if page<1 then    
page=1    
end if    
rs.absolutePage=page    
for ipage=1 to rs.pagesize  


%>
                <tr> 
                  <td width="85%"><a href="stu_show.asp?id=<%=rs("id")%>" target="_blank"> 
                    <font style="font-size:9pt"><%=rs("title")%></font></a></td>
                  <td width="15%"> 
                    <p>&nbsp;&nbsp;<%=rs("date")%> 
                  </td>
                </tr>
                <%
rs.movenext
If rs.eof then exit for
next
%>
                <tr> 
                  <td colspan="2"> 
                    <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs.pagecount%></font> 
                      页 </b>&nbsp;<font face="webdings"><a href="index.asp?page=1"><font color="#484848">9</font></a></font> 
                      <font face="webdings"> <a href="index.asp?page=<%=page-1%>"> 
                      <font color="#484848">7</font></a></font>[ 
                      <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=index.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
      %>
                      ]<font face="webdings"><a href="index.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font> 
                      <font face="webdings"> <a href="index.asp?page=<%=rs.PageCount%>"> 
                      <font color="#484848">:</font></a> </font><b>&nbsp; 当前第 
                      <font color="#990000"><%=page%></font> 页</b></font> 
                  </td>
                </tr>
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td width="100%"> </td>
        </tr>
        <tr> 
          <td width="100%" height="10"></td>
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
            href="contact.asp" class="mainzi">国内特价机票 51099317<br>
            国际特价机票 32031252<br>
            火 车 票 32031251<br>
            商务旅游签证 32031123<br>
            酒店预订 32010042<br>
            旅游咨询 51082959 </a> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td height=5><img height=5 src="images/mao.gif" 
            width=5></td>
              </tr>
              </tbody> 
            </table>
            <a href="aboutus.asp">中国民航华东管理局批准的民航售票点，国际航协运输协会（IATA）会员...</a></td>
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
