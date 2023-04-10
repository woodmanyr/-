<!--#include file="inc/conn.asp"--> 
<!--#include file="cf.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_name%></title>
<link rel="stylesheet" href="images/body.css"  type="text/css">
<%set rs=server.CreateObject("adodb.recordset")
%>
<link href="inc/hht.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:hover {
	color: #FF0000;
}
a:active {
	color: #FFFF00;
}
a:link {
	color: #295E0D;
}
.style1 {font-size: 12px}
.style2 {font-size: 12px}
.style3 {font-size: 12px}
.style5 {font-size: 12px; font-weight: bold; }
a:visited {
	color: #295E0D;
}
-->
</style>
</head>
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
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0" onLoad="MM_preloadImages('images/vip1_2.gif','images/vip2_2.gif','images/vip3_2.gif','images/vip4_2.gif')">
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
</script><div align="center">
<!--#include file="inc/top1.asp" --></div>
<div align="center"> 
  <table border="0" cellpadding="0" cellspacing="0" width="765" id="table7" bgcolor="#848484" height="1">
    <tr> 
      <td><img border="0" src="images/point.gif" width="1" height="1"></td>
    </tr>
  </table>
</div><div align="center">
<div align=center> 
  <center>
  </center>
</div>
<div align=center></div>
<style type=text/css>.style1 {
	COLOR: #ffffff
}
</style>
<table cellspacing=0 cellpadding=0 width=954 align=center border=0>
  <tbody> 
  <tr> 
    <td valign=top align=left><img height=328 src="images/z_left.jpg" 
      width=8> </td>
    <td valign=top align=left> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=65 src="images/left_01.gif" width=239></td>
        </tr>
        <tr> 
          <td align=middle background=images/left_09bg3.gif height=66> 
            <div id=P_1>
              <script language=JavaScript type=text/JavaScript>
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
              <br>
              <table border=0 cellpadding=0 cellspacing=1 class=chinese width=180>
                <tbody> 
                <tr> 
                  <td><a href="user/edit.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image14','','images/vip1_2.gif',1)"><img 
            border=0 name=Image14 src="images/vip1_1.gif" 
            osrc="../images/vip1_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="user/look.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image15','','images/vip2_2.gif',1)"><img 
            border=0 name=Image15 src="images/vip2_1.gif" 
            osrc="../images/vip2_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="user/money.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image16','','images/vip3_2.gif',1)"><img 
            border=0 name=Image16 src="images/vip3_1.gif" 
            osrc="../images/vip3_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="public/logout.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image17','','images/vip4_2.gif',1)"><img 
            border=0 name=Image17 src="images/vip4_1.gif" 
            osrc="../images/vip4_1.gif"></a></td>
                </tr>
                <tr> 
                  <td></td>
                </tr>
                </tbody> 
              </table>
            </div>
          </td>
        </tr>
        <tr> 
          <td align=left background=images/left_09bg.gif>&nbsp;</td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td align=left background=images/left_09bg.gif><img height=38 
            src="images/left_04.gif" width=239></td>
        </tr>
        <tr> 
          <td background=images/left_09bg2.gif><table cellspacing=0 cellpadding=0 border=0 align="center" width="98%">
              <tbody> 
              <tr height=20> 
                <td align=middle width=10 height="20">&nbsp;</td>
                <td height="20">
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
                              <marquee behavior=scroll direction=up width=100% height=120 scrollamount=2 scrolldelay=1 onMouseOver='this.stop()' onMouseOut='this.start()'> 
                              <center>
                                <%=rs_gg("title")%> 
                              </center>
                              <br>
                              &nbsp;&nbsp;&nbsp;&nbsp;<%=rs_gg("content")%> 
                              <%end if%>
                              <%rs_gg.close%>
                              </marquee></td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                    <tr> 
                      <td>　</td>
                    </tr>
                  </table>
                </td>
                <td width="10"></td>
              </tr>
              </tbody> 
            </table>
            <!--<span id=lb_ViewBoard></span>--></td>
        </tr>
        <tr> 
          <td background=images/left_09bg2.gif><img height=17 
            src="images/left_122.gif" width=239></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td align=left><span style="FONT-SIZE: 9pt"><img height=47 
                  src="images/left_06.gif" width=239></span></td>
        </tr>
        <tr> 
          <td background=images/left_09bg.gif height=79> 
            <table cellspacing=0 cellpadding=0 width=200 align=center 
                  border=0>
              <tbody> 
              <tr> 
                <td width=86 height=19><span style="FONT-SIZE: 9pt"><img 
                        height=7 src="images/left_05_tu1.gif" width=7> </span><a 
                        href="#"><span 
                        style="FONT-SIZE: 9pt">亚太航线</span></a></td>
                <td width=122 height=19><span 
                        style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">日韩航线</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7><a 
                        href="http://www.ticket.sh.cn/line_ouzhou.aspx"> </a></span><span style="FONT-SIZE: 9pt"><a 
                        href="#">欧洲航线</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">美加航线</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">澳洲航线</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">港澳台航线</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">中东航线</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">非洲航线</a></span></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td><span style="FONT-SIZE: 9pt"><img height=17 
                  src="images/left_122.gif" 
              width=239></span></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td align=left><img height=45 src="images/left_08.gif" 
            width=239></td>
        </tr>
        <tr> 
          <td background=images/left_09bg.gif height=60> 
            <table width="206"  border="0" align="center" cellpadding="0" cellspacing="0">
              <tr> 
                <td class="textbody"> <span id="lb_ViewBoard"> 
                  <%
sql_gg="select top 10 * from server order by id desc"
rs_gg.Open sql_gg,conn,3,2
for i=1 to  rs_gg.RecordCount
if   rs_gg.Eof then exit for
%>
                  <%title=rs_gg("title")%>
                  <%if len(title)>13 then title=left(title,13)%>
                  </span><span 
                        style="FONT-SIZE: 9pt"><font color=#ff0000><img 
                        height=9 src="images/dian%5B1%5D.gif" width=8 vspace="6" align="absmiddle" hspace="3"></font></span><span id="lb_ViewBoard"><a href="changshi_show.asp?id=<%=rs_gg("id")%>" target="_blank"> 
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
                  <div align="right"><span id="lb_ViewBoard"><a href="server_index.asp" target="_blank">更多&gt;&gt;&gt;</a></span></div>
                </td>
              </tr>
            </table>
            <table cellspacing=0 cellpadding=0 width=206 border=0>
              <tbody> 
              <tr> 
                <td width=20></td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/ditu.htm">电子地图</a></td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> 天气预报</td>
              </tr>
              <tr> 
                <td width=20></td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> 电子客票</td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> 离港到港信息</td>
              </tr>
              <tr> 
                <td width=20>　</td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/shabashi.htm">虹桥机场班车</a></td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/pvgbashi.htm">浦东机场班车</a></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td><img height=17 src="images/left_12.gif" width=239></td>
        </tr>
        </tbody> 
      </table>
      
    </td>
    <td valign=top align=left> 
      <table cellspacing=0 cellpadding=0 width=459 border=0>
        <tbody> 
        <tr> 
          <td><img height=24 src="images/middke_01.gif" width=459></td>
        </tr>
        <tr> 
          <td width=459> 
            <table onKeyDown=sea(); cellspacing=0 cellpadding=0 align=center 
            border=0>
              <tbody> 
              <tr> 
                <td bgcolor=#3bd7ee></td>
              </tr>
              <tr> 
                <td><img height=12 src="images/middke_02.gif" 
              width=459></td>
              </tr>
              <tr> 
                <td align=middle background=images/middke_03bg.gif> 
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
                                      <select name="select" size="1" id="select2" onChange="changelocation(document.all.areaid.options[document.all.areaid.selectedIndex].value)">
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
                                      <select name="select" onChange="changelocationz(document.regfrom.countryid.options[document.regfrom.countryid.selectedIndex].value)">
                                        <option value="0" selected>请选择国家</option>
                                      </select>
                                      </font></td>
                                    <td width="2%"> <font color="#444444"> 
                                      <select name="select">
                                        <option value="0" selected>请选择城市</option>
                                      </select>
                                      </font></td>
                                    <td width="2%"> 
                                      <input name="imageField3" type="image" style="height:18px" src="images/6.gif" onClick="return guoji_check()" width="35" height="18" border="0">
                                    </td>
                                  </tr>
                                  <tr> </tr>
                                </form>
                                <tr> 
                                  <td colspan="5"><span class="textbody">·国内机票搜索</span></td>
                                </tr>
                                <form method="POST"   name="regfrom1" action="guonei_hangban_list.asp">
                                  <tr> 
                                    <td colspan="5"> 
                                      <p> 
                                        <%sql="select * from address order by address asc"
rs.Open sql,conn,3,2%>
                                        <select size="1" name="select">
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
                                        <input name="imageField22" type="image" style="height:18px" src="images/6.gif" onClick="return guonei_check()" width="35" height="18" border="0">
                                        </font> 
                                    </td>
                                  </tr>
                                  <tr> </tr>
                                </form>
                              </table>
                            </td>
                          </tr>
                        </table>
                      </td>
                    </tr>
                  </table>
                </td>
              </tr>
              <tr> 
                <td><img height=11 src="images/middke_10.gif" 
              width=459></td>
              </tr>
              </tbody> 
            </table>
            <span id=tickettext style="DISPLAY: none"></span></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=459 border=0>
        <tbody> 
        <tr> 
          <td><img height=12 src="images/middke_02.gif" width=459></td>
        </tr>
        <tr> 
          <td background=images/middke_03bg.gif> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td width=18 height=21></td>
                <td width=430> 
                  <table border="0" cellpadding="1" cellspacing="1" width="96%" align="center" bordercolor="#C0C2C2" class="textbody">
                    <tr height="22"> 
                      <td width="30%" height="20" align="center"> 
                        <div align="left"><b>国内机票航程</b></div>
                      </td>
                      <td width="30%" height="20" align="center"> 
                        <div align="left"><b>全价</b></div>
                      </td>
                      <td width="29%" height="20" align="center"> 
                        <div align="left"><b>特价</b></div>
                      </td>
                      <td width="11%" align="center"> 
                        <div align="left">详情</div>
                      </td>
                    </tr>
                    <%'sql="select top 10 address,price,minprice from holiday1 order by id desc"
		  'sql="select * from(select top 5 id,address,price,minprice from holiday where flag=1 order by id desc union all select top 5 id,address,price,minprice from holiday1  where flag=1 order by id desc)a "
             sql="select top 18 id,address,price,minprice from holiday where flag=1 order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount
			if rs.Eof then exit for
			%>
                    <tr <%if i mod 2=1 then %> bgcolor="#F2F1EE" <%end if%> onMouseMove="roll(this,'in','#D9F2FF');" 
                          onMouseOut="roll(this,'out')"> 
                      <td> <%=rs("address")%> 
                        <div align="left"></div>
                      </td>
                      <td> <%=rs("price")%> 
                        <div align="left"></div>
                      </td>
                      <td> <%=rs("minprice")%> 
                        <div align="left"></div>
                      </td>
                      <td> 
                        <div align="left"><a href="#"  onClick="window.open('guoneitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">查看</a></div>
                      </td>
                      <%rs.Movenext
		  next
		  rs.close%>
                  </table>
                  <span id=lb_View> </span></td>
                <td width=11></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td><img height=11 src="images/middke_10.gif" 
        width=459></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 width=459 border=0>
        <tbody> 
        <tr> 
          <td><img height=12 src="images/middke_02.gif" width=459></td>
        </tr>
        <tr> 
          <td background=images/middke_03bg.gif> 
            <table cellspacing=0 cellpadding=0 width="100%" border=0>
              <tbody> 
              <tr> 
                <td width=18 height=21></td>
                <td width=430> 
                  <table border="0" cellpadding="1" cellspacing="1" width="96%" align="center" bordercolor="#C0C2C2" class="textbody">
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
                      <td width="27%"> <%=rs("from_city")%> →<%=rs("address")%></td>
                      <td width="25%"> <%=rs("company")%> 
                        <div align="left"></div>
                      </td>
                      <td width="18%"> <%=rs("price")%> 
                        <div align="left"></div>
                      </td>
                      <td width="20%"> <%=rs("minprice")%> 
                        <div align="left"></div>
                      </td>
                      <td width="10%"> 
                        <div align="left"><a href="#"  onClick="window.open('guojitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">查看</a></div>
                      </td>
                    </tr>
                    <%rs.Movenext
		  next
		  rs.close%>
                  </table>
                  <span id=lb_View> </span></td>
                <td width=11></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td><img height=11 src="images/middke_10.gif" 
        width=459></td>
        </tr>
        </tbody> 
      </table>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td>&nbsp; </td>
        </tr>
      </table>
    </td>
    <td valign=top align=left> 
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=65 src="images/lxfs.gif" width=240></td>
        </tr>
        <tr> 
          <td background=images/rig_top.gif><br>
            <table cellspacing=1 cellpadding=0 width="75%" border=0>
              <tbody> 
              <tr valign=center align=middle> 
                <td valign=top align=right width=24></td>
                <td valign=top align=right width=52>国际部:</td>
                <td class=style8 align=left width=100>86-21-29949106_01</td>
              </tr>
              <tr valign=center align=middle> 
                <td valign=top align=right></td>
                <td valign=top align=right>国内部:</td>
                <td align=left>86-21-29949106_02</td>
              </tr>
              <tr valign=center align=middle> 
                <td align=right></td>
                <td align=right>传&nbsp; 真:</td>
                <td align=left>86-21-29949106_03</td>
              </tr>
              <tr valign=center align=middle> 
                <td colspan=3 height=30>欢迎电话咨询</td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=52 src="images/right_03.gif" width=240></td>
        </tr>
        <tr> 
          <td valign=top align=middle width=248 
          background=images/right_04bg.gif height=160> 
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
                        <table cellspacing=2 cellpadding=0 width=220 
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
                  <span class="tab1"><a href="student_index.asp" class="textbody">更多...</a></span></td>
              </tr>
            </table>
            <span 
            id=lb_GunGuoji> </span> </td>
        </tr>
        <tr> 
          <td><img height=12 src="images/right_07.gif" width=240></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=52 src="images/right_03.gif" width=240></td>
        </tr>
        <tr> 
          <td valign=top align=middle width=248 
          background=images/right_04bg.gif height=160> <span 
            id=lb_GunGuoji> </span> 
            <table width="230" border="0" cellpadding="0" cellspacing="0" >
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
                        <table cellspacing=2 cellpadding=0 width=220 
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
                  <div align="right"><span class="tab1"> 
                    <%rs.Movenext
		  next
		  rs.close%>
                    <a href="trip.asp" class="textbody">更多...</a></span></div>
                </td>
              </tr>
            </table>
          </td>
        </tr>
        <tr> 
          <td><img height=12 src="images/right_07.gif" width=240></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=48 src="images/right_05.gif" width=240></td>
        </tr>
        <tr> 
          <td valign=top align=middle width=248 
          background=images/right_04bg.gif height=160> <marquee onMouseMove=this.stop(); onMouseOut=this.start(); 
            scrollamount=2 direction=up width=220 height=150><span 
            id=lb_Gunxuesheng> </span> 
            <table width="230" border="0" cellpadding="0" cellspacing="0" >
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
                        <table cellspacing=2 cellpadding=0 width=220 
align=center>
                          <tbody> 
                          <tr> 
                            <td align=middle width=15 height=15><font color=#ff6600><span 
                  style="FONT-SIZE: 9pt"><img height=7 
                  src="images/right_04_tu1.gif" width=7></span></font></td>
                            <td width=187><span class="textbody"><a href=dingfang_show.asp?id=<%=rs("id")%> target="_blank"> 
                              <%response.write left(rs("title"),13)%>
                              <%
                                if len(rs("title"))>13 then
                                response.write "..."
                                end if
                                %>
                              </a></span><span class=style9></span></td>
                          </tr>
                          </tbody> 
                        </table>
                      </td>
                    </tr>
                  </table>
                  <div align="right"><span class="tab1"> 
                    <%rs.Movenext
		  next
		  rs.close%>
                    <a href="dingfang.asp" class="textbody">更多...</a></span></div>
                </td>
              </tr>
            </table>
            </marquee></td>
        </tr>
        <tr> 
          <td><img height=12 src="images/right_07.gif" width=240></td>
        </tr>
        </tbody> 
      </table>
      <table cellspacing=0 cellpadding=0 border=0>
        <tbody> 
        <tr> 
          <td><img height=48 src="images/links.gif" width=240></td>
        </tr>
        <tr> 
          <td align=middle background=images/right_04bg.gif><span 
            id=lb_Link> 
            <table cellspacing=0 cellpadding=0 width=220 border=0>
              <tbody> 
              <tr height=20> 
                <td><a title=酒店预订 href="http://www.fjs.com.cn/">酒店预订</a></td>
              </tr>
              <tr height=20> 
                <td><a title=google代理 
                  href="http://www.shanghaiseo.com/">google代理</a></td>
              </tr>
              <tr height=20> 
                <td><a title=google代理 
                  href="http://www.googlex.org/">google代理</a></td>
              </tr>
              <tr height=20> 
                <td><a title=中航驾校 href="http://www.kaiche.cn/">中航驾校</a></td>
              </tr>
              <tr height=20> 
                <td><a title=汽车驾驶培训 
              href="http://www.kaiche.cn/">汽车驾驶培训</a></td>
              </tr>
              <tr height=20> 
                <td><a title=电磁阀 href="http://www.sh516.com/">电磁阀</a></td>
              </tr>
              <tr height=20> 
                <td><a title=招聘 href="http://www.u456.com/">招聘</a></td>
              </tr>
              <tr height=20> 
                <td><a title=火车票 href="http://www.2piao.com/">火车票</a></td>
              </tr>
              <tr height=20> 
                <td><a title=上海学车网 
              href="http://www.kaiche.cn/">上海学车网</a></td>
              </tr>
              </tbody> 
            </table>
            </span> 
            <table cellspacing=0 cellpadding=0 width=237 border=0>
              <tbody> 
              <tr> 
                <td align=middle height=18></td>
              </tr>
              <tr> 
                <td align=middle height=50><span style="FONT-SIZE: 9pt"> <marquee trueSpeed scrollamount=1 scrolldelay=30 width=154 
                  border="0"><font 
                  color=#ff0033>上海市星云旅游咨询服务有限公司提供国际机票、国内机票的航班查询、国内到国际、机票预定服务：机票网络订机票，中国打折机票网，中国机票网络打折机票，机票网上订购，机票预订，订机票热线,网上打折机票，打折机票网上特价机票，中国网上打折机票，机票速递，国际特价机票，网络特价机票，中国国际机票，国际机票 
                  深圳打折机票,深圳国际机票，深圳特价机票， 深圳订机票，深圳机票，深圳网络打折机票，上海机票，上海打折机票,上海国际机票，上海订机票，上海特价机票，北京机票，上海网络打折机票，北京打折机票,北京国际机票，北京特价机票，北京订机票，北京网络打折机票，广州机票，广州打折机票,广州国际机票,广州订机票，广州特价机票。广州网络打折机票，法兰克福打折机票,伦敦机票，伦敦打折机票,伦敦订机票，伦敦特价机票，悉尼打折机票,悉尼机票，悉尼订机票，悉尼特价机票，悉尼网上打折机票，成都打折机票,成都订机票， 
                  成都特价机票， 成都网上打折机票，西安打折机票,特价机票连锁打折机票,深圳订机票，北京订机票，上海订机票，广州订机票，深圳网上订机票，上海网上订机票，北京网上订机票，广州网上订机票，长沙网上订机票，福州网上订机票，网上订机票，大连网上订机票，武汉网上订机票&nbsp; 
                  法兰克福打折机票,法兰克福特价机票， 法兰克福订机票，法兰克福国际机票，多伦多打折机票,多伦多订机票，多伦多特价机票，温州打折机票,温州特价机票，温州订机票，温哥华打折机票,温哥华机票，绵阳打折机票,绵阳机票，绵阳订机票，绵阳特价机票，巴黎打折机票，巴黎机票，巴黎特价机票， 
                  巴黎订机票，杭州打折机票,杭州订机票，杭州特价机票，杭州国际机票，悉尼打折机票,悉尼订机票， 悉尼特价机票， 悉尼国际机票，成都打折机票,成都国际机票，成都订机票，成都特价机票，西安打折机票,西安国际机票，西安订机票，西安特价机票，天津打折机票,天津订机票，天津特价机票，天津国际机票，长春打折机票,长春国际机票，长春订机票， 
                  长春特价机票，重庆打折机票,重庆订机票，重庆特价机票， 重庆国际机票，沈阳打折机票,沈阳国际机票，沈阳订机票，沈阳特价机票，哈尔滨打折机票,哈尔滨订机票，南昌打折机票,南昌国际机票， 
                  南昌订机票， 南昌特价机票，郑州打折机票,郑州机票，郑州订机票，郑州特价机票， 武汉打折机票,武汉国际机票，武汉订机票， 
                  武汉特价机票，合肥打折机票,合肥国际机票，合肥特价机票， 合肥订机票，太原打折机票,太原国际机票，太原订机票， 太原特价机票，兰州打折机票,兰州特价机票， 
                  兰州订机票，兰州国际机票，厦门打折机票,厦门国际机票，厦门订机票，厦门特价机票，大连打折机票,大连国际机票，大连订机票，大连特价机票，乌鲁木齐打折机票,乌鲁木齐国际机票，乌鲁木齐订机票，乌鲁木齐特价机票，南宁打折机票,南宁国际机票，南宁订机票， 
                  南宁特价机票，青岛打折机票,青岛订机票，青岛特价机票，青岛国际机票，济南打折机票,济南国际机票，济南订机票， 济南特价机票，香港打折机票,香港国际机票，香港订机票，香港特价机票，台北打折机票， 
                  台北机票，台北特价机票， 台北订机票，海口打折机票,海口国际机票，海口订机票，海口特价机票，高雄打折机票,高雄国际机票，高雄订机票，高雄特价机票，石家庄打折机票,石家庄订机票，石家庄机票，银川打折机票,银川订机票，银川特价机票，贵阳打折机票,贵阳国际机票，贵阳订机票，贵阳特价机票，昆明打折机票,昆明国际机票，昆明订机票，昆明特价机票，墨尔本打折机票，墨尔本国际机票，墨尔本订机票， 
                  墨尔本特价机票，,奥克兰打折机票,奥克兰国际机票，奥克兰订机票，奥克兰特价机票，长沙打折机票,长沙订机票，长沙特价机票，福州打折机票，福州订机票，福州特价机票, 
                  美国联合航空公司，维珍航空公司，加拿大航空公司，东方航空公司，芬兰航空公司，中国国际航空公司，南方航空公司，阿联酋航空公司，上海航空公司，日本航空公司，港龙航空公司，大韩航空公司，荷兰皇家航空公司，德国汉莎航空公司，马来西亚航空公司，法国航空公司 
                  ，全日空航空公司 美国西北航空公司，澳门航空公司，奥地利航公司，韩亚航空公司，菲律宾航空公司，北欧航空公司，卡塔尔航空公司，新加坡航空公司，泰国航空公司，土耳其航空公司，意大利航空公司，英国航空公司，瑞士航空公司，以色列航空公司，澳大利亚航空公司，巴基斯坦航空公司，印度航空公司 
                  ，越南航空公司，国泰航空公司</font></marquee></span></td>
              </tr>
              </tbody> 
            </table>
          </td>
        </tr>
        <tr> 
          <td><img height=12 src="images/right_07.gif" 
        width=240></td>
        </tr>
        </tbody> 
      </table>
    </td>
    <td valign=top align=left><img height=327 src="images/z_right.jpg" 
      width=8></td>
  </tr>
  </tbody>
</table>
<div align=center> 
  <center>
  </center>
</div>
<!--#include file="inc/bottom1.asp" --></div>
<div align="center"> 
  <table border="0" cellpadding="0" cellspacing="0" width="765" id="table19" height="1" bgcolor="#848684">
    <tr> 
      <td><img border="0" src="images/point.gif" width="1" height="1"></td>
    </tr>
  </table>
</div>
<div align="center"> </div>
</BODY>
</HTML>

