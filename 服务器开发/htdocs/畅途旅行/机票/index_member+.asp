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
	document.regfrom.countryid.options[document.regfrom.countryid.length] = new Option( "��ѡ�����","0");
    for (i=0;i < <%=count%>; i++)
        {
            if (subcat[i][1] == locationid)
            { //��䲻�Ǻ����
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
	document.regfrom.cityid.options[document.regfrom.cityid.length] = new Option( "��ѡ�����","0");
    for (i=0;i < <%=count%>; i++)
        {
            if (subcatz[i][1] == locationid)
            { //��䲻�Ǻ����
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
	   alert("��ѡ�񵽴����");
	   return false;
	 }
  return true;
}
</script>
<script>
function guonei_check()
{
  if (document.all.address.value=="��ѡ�񺽰ൽ��ص�")
    {
	   alert("��ѡ�񵽴����");
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
                      <td>��</td>
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
                        style="FONT-SIZE: 9pt">��̫����</span></a></td>
                <td width=122 height=19><span 
                        style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">�պ�����</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7><a 
                        href="http://www.ticket.sh.cn/line_ouzhou.aspx"> </a></span><span style="FONT-SIZE: 9pt"><a 
                        href="#">ŷ�޺���</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">���Ӻ���</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">���޺���</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">�۰�̨����</a></span></td>
              </tr>
              <tr> 
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">�ж�����</a></span></td>
                <td height=19><span style="FONT-SIZE: 9pt"><img height=7 
                        src="images/left_05_tu1.gif" width=7> </span><span style="FONT-SIZE: 9pt"><a 
                        href="#">���޺���</a></span></td>
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
                  <div align="right"><span id="lb_ViewBoard"><a href="server_index.asp" target="_blank">����&gt;&gt;&gt;</a></span></div>
                </td>
              </tr>
            </table>
            <table cellspacing=0 cellpadding=0 width=206 border=0>
              <tbody> 
              <tr> 
                <td width=20></td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/ditu.htm">���ӵ�ͼ</a></td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> ����Ԥ��</td>
              </tr>
              <tr> 
                <td width=20></td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> ���ӿ�Ʊ</td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> ��۵�����Ϣ</td>
              </tr>
              <tr> 
                <td width=20>��</td>
                <td width=86 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/shabashi.htm">���Ż����೵</a></td>
                <td width=100 height=20><img height=7 
                  src="images/left_05_tu1.gif" width=7> <a 
                  href="http://www.ticket.sh.cn/bianmin/pvgbashi.htm">�ֶ������೵</a></td>
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
                                      <p align="left" class="textbody"> �����ʻ�Ʊ���� 
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
	response.write "��ѡ�����"
	response.end
	else
%>
                                      <select name="select" size="1" id="select2" onChange="changelocation(document.all.areaid.options[document.all.areaid.selectedIndex].value)">
                                        <option selected value=0>��ѡ�����</option>
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
                                        <option value="0" selected>��ѡ�����</option>
                                      </select>
                                      </font></td>
                                    <td width="2%"> <font color="#444444"> 
                                      <select name="select">
                                        <option value="0" selected>��ѡ�����</option>
                                      </select>
                                      </font></td>
                                    <td width="2%"> 
                                      <input name="imageField3" type="image" style="height:18px" src="images/6.gif" onClick="return guoji_check()" width="35" height="18" border="0">
                                    </td>
                                  </tr>
                                  <tr> </tr>
                                </form>
                                <tr> 
                                  <td colspan="5"><span class="textbody">�����ڻ�Ʊ����</span></td>
                                </tr>
                                <form method="POST"   name="regfrom1" action="guonei_hangban_list.asp">
                                  <tr> 
                                    <td colspan="5"> 
                                      <p> 
                                        <%sql="select * from address order by address asc"
rs.Open sql,conn,3,2%>
                                        <select size="1" name="select">
                                          <option value="��ѡ�񺽰ൽ��ص�">��ѡ�񺽰ൽ��ص�</option>
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
                        <div align="left"><b>���ڻ�Ʊ����</b></div>
                      </td>
                      <td width="30%" height="20" align="center"> 
                        <div align="left"><b>ȫ��</b></div>
                      </td>
                      <td width="29%" height="20" align="center"> 
                        <div align="left"><b>�ؼ�</b></div>
                      </td>
                      <td width="11%" align="center"> 
                        <div align="left">����</div>
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
                        <div align="left"><a href="#"  onClick="window.open('guoneitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">�鿴</a></div>
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
                        <div align="left"><b>���ʻ�Ʊ����</b></div>
                      </td>
                      <td width="25%" height="20" align="center"> 
                        <div align="left"><b>���չ�˾</b></div>
                      </td>
                      <td width="18%" height="20" align="center"> 
                        <div align="left"><b>����</b></div>
                      </td>
                      <td width="20%" height="20" align="center"> 
                        <div align="left"><b>����</b></div>
                      </td>
                      <td width="10%" align="center"> 
                        <div align="left">����</div>
                      </td>
                    </tr>
                    <%'sql="select top 10 address,price,minprice from holiday1 order by id desc"
		  sql="select top 18 id,address,price,company,from_city,content,minprice from holiday1  where flag=1 order by id desc "
             rs.Open sql,conn,3,2
			for i=1 to rs.recordcount%>
                    <tr <%if i mod 2=1 then %> bgcolor="#F2F1EE" <%end if%>  onMouseMove="roll(this,'in','#D9F2FF');" 
                          onMouseOut="roll(this,'out')"> 
                      <td width="27%"> <%=rs("from_city")%> ��<%=rs("address")%></td>
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
                        <div align="left"><a href="#"  onClick="window.open('guojitejia_show.asp?id=<%=rs("id")%>&cityid=<%=rs("address")%>','','500,600')">�鿴</a></div>
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
                <td valign=top align=right width=52>���ʲ�:</td>
                <td class=style8 align=left width=100>86-21-29949106_01</td>
              </tr>
              <tr valign=center align=middle> 
                <td valign=top align=right></td>
                <td valign=top align=right>���ڲ�:</td>
                <td align=left>86-21-29949106_02</td>
              </tr>
              <tr valign=center align=middle> 
                <td align=right></td>
                <td align=right>��&nbsp; ��:</td>
                <td align=left>86-21-29949106_03</td>
              </tr>
              <tr valign=center align=middle> 
                <td colspan=3 height=30>��ӭ�绰��ѯ</td>
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
                  <span class="tab1"><a href="student_index.asp" class="textbody">����...</a></span></td>
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
                    <a href="trip.asp" class="textbody">����...</a></span></div>
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
                    <a href="dingfang.asp" class="textbody">����...</a></span></div>
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
                <td><a title=�Ƶ�Ԥ�� href="http://www.fjs.com.cn/">�Ƶ�Ԥ��</a></td>
              </tr>
              <tr height=20> 
                <td><a title=google���� 
                  href="http://www.shanghaiseo.com/">google����</a></td>
              </tr>
              <tr height=20> 
                <td><a title=google���� 
                  href="http://www.googlex.org/">google����</a></td>
              </tr>
              <tr height=20> 
                <td><a title=�к���У href="http://www.kaiche.cn/">�к���У</a></td>
              </tr>
              <tr height=20> 
                <td><a title=������ʻ��ѵ 
              href="http://www.kaiche.cn/">������ʻ��ѵ</a></td>
              </tr>
              <tr height=20> 
                <td><a title=��ŷ� href="http://www.sh516.com/">��ŷ�</a></td>
              </tr>
              <tr height=20> 
                <td><a title=��Ƹ href="http://www.u456.com/">��Ƹ</a></td>
              </tr>
              <tr height=20> 
                <td><a title=��Ʊ href="http://www.2piao.com/">��Ʊ</a></td>
              </tr>
              <tr height=20> 
                <td><a title=�Ϻ�ѧ���� 
              href="http://www.kaiche.cn/">�Ϻ�ѧ����</a></td>
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
                  color=#ff0033>�Ϻ�������������ѯ�������޹�˾�ṩ���ʻ�Ʊ�����ڻ�Ʊ�ĺ����ѯ�����ڵ����ʡ���ƱԤ�����񣺻�Ʊ���綩��Ʊ���й����ۻ�Ʊ�����й���Ʊ������ۻ�Ʊ����Ʊ���϶�������ƱԤ��������Ʊ����,���ϴ��ۻ�Ʊ�����ۻ�Ʊ�����ؼۻ�Ʊ���й����ϴ��ۻ�Ʊ����Ʊ�ٵݣ������ؼۻ�Ʊ�������ؼۻ�Ʊ���й����ʻ�Ʊ�����ʻ�Ʊ 
                  ���ڴ��ۻ�Ʊ,���ڹ��ʻ�Ʊ�������ؼۻ�Ʊ�� ���ڶ���Ʊ�����ڻ�Ʊ������������ۻ�Ʊ���Ϻ���Ʊ���Ϻ����ۻ�Ʊ,�Ϻ����ʻ�Ʊ���Ϻ�����Ʊ���Ϻ��ؼۻ�Ʊ��������Ʊ���Ϻ�������ۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ�������ؼۻ�Ʊ����������Ʊ������������ۻ�Ʊ�����ݻ�Ʊ�����ݴ��ۻ�Ʊ,���ݹ��ʻ�Ʊ,���ݶ���Ʊ�������ؼۻ�Ʊ������������ۻ�Ʊ�������˸����ۻ�Ʊ,�׶ػ�Ʊ���׶ش��ۻ�Ʊ,�׶ض���Ʊ���׶��ؼۻ�Ʊ��Ϥ����ۻ�Ʊ,Ϥ���Ʊ��Ϥ�ᶩ��Ʊ��Ϥ���ؼۻ�Ʊ��Ϥ�����ϴ��ۻ�Ʊ���ɶ����ۻ�Ʊ,�ɶ�����Ʊ�� 
                  �ɶ��ؼۻ�Ʊ�� �ɶ����ϴ��ۻ�Ʊ���������ۻ�Ʊ,�ؼۻ�Ʊ�������ۻ�Ʊ,���ڶ���Ʊ����������Ʊ���Ϻ�����Ʊ�����ݶ���Ʊ���������϶���Ʊ���Ϻ����϶���Ʊ���������϶���Ʊ���������϶���Ʊ����ɳ���϶���Ʊ���������϶���Ʊ�����϶���Ʊ���������϶���Ʊ���人���϶���Ʊ&nbsp; 
                  �����˸����ۻ�Ʊ,�����˸��ؼۻ�Ʊ�� �����˸�����Ʊ�������˸����ʻ�Ʊ�����׶���ۻ�Ʊ,���׶ඩ��Ʊ�����׶��ؼۻ�Ʊ�����ݴ��ۻ�Ʊ,�����ؼۻ�Ʊ�����ݶ���Ʊ���¸绪���ۻ�Ʊ,�¸绪��Ʊ���������ۻ�Ʊ,������Ʊ����������Ʊ�������ؼۻ�Ʊ��������ۻ�Ʊ�������Ʊ�������ؼۻ�Ʊ�� 
                  ���趩��Ʊ�����ݴ��ۻ�Ʊ,���ݶ���Ʊ�������ؼۻ�Ʊ�����ݹ��ʻ�Ʊ��Ϥ����ۻ�Ʊ,Ϥ�ᶩ��Ʊ�� Ϥ���ؼۻ�Ʊ�� Ϥ����ʻ�Ʊ���ɶ����ۻ�Ʊ,�ɶ����ʻ�Ʊ���ɶ�����Ʊ���ɶ��ؼۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�������ؼۻ�Ʊ�������ۻ�Ʊ,��򶩻�Ʊ������ؼۻ�Ʊ�������ʻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�� 
                  �����ؼۻ�Ʊ��������ۻ�Ʊ,���충��Ʊ�������ؼۻ�Ʊ�� ������ʻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�������ؼۻ�Ʊ�����������ۻ�Ʊ,����������Ʊ���ϲ����ۻ�Ʊ,�ϲ����ʻ�Ʊ�� 
                  �ϲ�����Ʊ�� �ϲ��ؼۻ�Ʊ��֣�ݴ��ۻ�Ʊ,֣�ݻ�Ʊ��֣�ݶ���Ʊ��֣���ؼۻ�Ʊ�� �人���ۻ�Ʊ,�人���ʻ�Ʊ���人����Ʊ�� 
                  �人�ؼۻ�Ʊ���Ϸʴ��ۻ�Ʊ,�Ϸʹ��ʻ�Ʊ���Ϸ��ؼۻ�Ʊ�� �Ϸʶ���Ʊ��̫ԭ���ۻ�Ʊ,̫ԭ���ʻ�Ʊ��̫ԭ����Ʊ�� ̫ԭ�ؼۻ�Ʊ�����ݴ��ۻ�Ʊ,�����ؼۻ�Ʊ�� 
                  ���ݶ���Ʊ�����ݹ��ʻ�Ʊ�����Ŵ��ۻ�Ʊ,���Ź��ʻ�Ʊ�����Ŷ���Ʊ�������ؼۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�������ؼۻ�Ʊ����³ľ����ۻ�Ʊ,��³ľ����ʻ�Ʊ����³ľ�붩��Ʊ����³ľ���ؼۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�� 
                  �����ؼۻ�Ʊ���ൺ���ۻ�Ʊ,�ൺ����Ʊ���ൺ�ؼۻ�Ʊ���ൺ���ʻ�Ʊ�����ϴ��ۻ�Ʊ,���Ϲ��ʻ�Ʊ�����϶���Ʊ�� �����ؼۻ�Ʊ����۴��ۻ�Ʊ,��۹��ʻ�Ʊ����۶���Ʊ������ؼۻ�Ʊ��̨�����ۻ�Ʊ�� 
                  ̨����Ʊ��̨���ؼۻ�Ʊ�� ̨������Ʊ�����ڴ��ۻ�Ʊ,���ڹ��ʻ�Ʊ�����ڶ���Ʊ�������ؼۻ�Ʊ�����۴��ۻ�Ʊ,���۹��ʻ�Ʊ�����۶���Ʊ�������ؼۻ�Ʊ��ʯ��ׯ���ۻ�Ʊ,ʯ��ׯ����Ʊ��ʯ��ׯ��Ʊ���������ۻ�Ʊ,��������Ʊ�������ؼۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�������ؼۻ�Ʊ���������ۻ�Ʊ,�������ʻ�Ʊ����������Ʊ�������ؼۻ�Ʊ��ī�������ۻ�Ʊ��ī�������ʻ�Ʊ��ī��������Ʊ�� 
                  ī�����ؼۻ�Ʊ��,�¿������ۻ�Ʊ,�¿������ʻ�Ʊ���¿�������Ʊ���¿����ؼۻ�Ʊ����ɳ���ۻ�Ʊ,��ɳ����Ʊ����ɳ�ؼۻ�Ʊ�����ݴ��ۻ�Ʊ�����ݶ���Ʊ�������ؼۻ�Ʊ, 
                  �������Ϻ��չ�˾��ά�亽�չ�˾�����ô󺽿չ�˾���������չ�˾���������չ�˾���й����ʺ��չ�˾���Ϸ����չ�˾�����������չ�˾���Ϻ����չ�˾���ձ����չ�˾���������չ�˾���󺫺��չ�˾�������ʼҺ��չ�˾���¹���ɯ���չ�˾���������Ǻ��չ�˾���������չ�˾ 
                  ��ȫ�տպ��չ�˾ �����������չ�˾�����ź��չ�˾���µ�������˾�����Ǻ��չ�˾�����ɱ����չ�˾����ŷ���չ�˾�����������չ�˾���¼��º��չ�˾��̩�����չ�˾�������亽�չ�˾����������չ�˾��Ӣ�����չ�˾����ʿ���չ�˾����ɫ�к��չ�˾���Ĵ����Ǻ��չ�˾���ͻ�˹̹���չ�˾��ӡ�Ⱥ��չ�˾ 
                  ��Խ�Ϻ��չ�˾����̩���չ�˾</font></marquee></span></td>
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

