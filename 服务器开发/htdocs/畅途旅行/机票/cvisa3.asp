<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD><TITLE><%=site_name%></TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="description" content="�й�,�Ϻ�,�Ϻ������Ϻ��Ϻ�������Ʊ��,�Ϻ������Ϻ��Ϻ�������Ʊ��Ʊ������,�Ϻ���������������, ���ڻ�Ʊ, ���ʻ�Ʊ, �ؼۻ�Ʊ,���ۻ�Ʊ,�Ϻ��ɻ�Ʊ,�ɻ�Ʊ, ��Ʊ, �Ƶ�Ԥ��, ������ѯ, ����ǩ֤, �����ѯ, Ԥ������">
<meta name="keywords" content="�й�,�Ϻ�,�Ϻ������Ϻ��Ϻ�������Ʊ��,�Ϻ������Ϻ��Ϻ�������Ʊ��Ʊ������,�Ϻ���������������, ���ڻ�Ʊ, ���ʻ�Ʊ, �ؼۻ�Ʊ,���ۻ�Ʊ,�Ϻ��ɻ�Ʊ,�ɻ�Ʊ, ��Ʊ, �Ƶ�Ԥ��, ������ѯ, ����ǩ֤, �����ѯ, Ԥ������">
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
company="���к��չ�˾"
end if
address=request("address")

if address="" then
address="��ѡ�񺽰ൽ��ص�"
end if


on error resume next
set rs=server.CreateObject("adodb.recordset")
sql="select * from address order by address asc"
rs.Open sql,conn,3,2

set rs_company=server.CreateObject("adodb.recordset")
sql_company="select * from company"
rs_company.Open sql_company,conn,3,2

set rs_search=server.CreateObject("adodb.recordset")

if address="��ѡ�񺽰ൽ��ص�" then
sql_search="select * from holiday " 
else
sql_search="select * from holiday"
end if

if company<>"���к��չ�˾" then
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
<body topmargin="0" leftmargin="0" rightmargin="0" bottommargin="0" marginwidth="0" marginheight="0">
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
                color=#666666><b>ǩ ֤ �� Ϣ</b></font></td>
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
                  <td>��</td>
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
                color=#666666><b>�� �� �� Ʊ</b></font></td>
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
                  <span class="tab1"><a href="student_index.asp" class="textbody">����&gt;&gt;&gt;</a></span></td>
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
            alt=ѧ����Ʊ src="images/index_ad_02.gif" 
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
            alt=ѧ����Ʊ src="images/index_ad_01.jpg" 
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
                        ��ҳ�������з���ļ۸���������嵥����ϸ��Ϣ�����µ�һ����Ϊ�۸񣬵ڶ�����Ϊ�����嵥��<br>
                        <br>
                        <span 
                  class=a105>��������й����Ρ����񡢹���ǩ֤������֤��������ط�����챨�ۣ�<br>
                        <br>
                        </span>����������һ��ѡ���⼮��ʿ�Ĺ�����δ�г��Ķ���������������һ������������һ��ѡ���������ǩ֤����E1-S12�����Ӧ���ַ���ɴӱ�������ã������ý�������־�Ϊ���������Ըù�����ʿ�ķ��ã�<font 
                  color=#ff0000>2005��6��1�������±���</font>�������з�����������˳�����������������ԡ������з������ѡ��Ӽ������̶Ƚ�Լ�⼮��ʿ��ʱ�䡣<br>
                        <span 
                  class=a105></span><font color=#ff0000>&nbsp;</font> 
                        <table class=a9 cellspacing=1 cellpadding=0 width="100%" 
                  bgcolor=#000000 border=0>
                          <tbody> 
                          <tr bgcolor=#d54a25> 
                            <td bgcolor=#d54a25> 
                              <div align=center><font 
                        color=#ffffff><b>����</b></font></div>
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
                            <td align=middle bgcolor=#eeeeee>������˹̹</td>
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
                            <td align=middle bgcolor=#eeeeee>���ȱ��˹̹</td>
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
                            <td align=middle bgcolor=#eeeeee>��������</td>
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
                            <td bgcolor=#eeeeee>����</td>
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
                            <td align=middle bgcolor=#eeeeee>���������</td>
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
                            <td align=middle bgcolor=#eeeeee>������</td>
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
                            <td align=middle bgcolor=#eeeeee>�չ�����</td>
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
                            <td align=middle bgcolor=#eeeeee>����</td>
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
                            <td align=middle bgcolor=#eeeeee>����¡</td>
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
                            <td bgcolor=#eeeeee>���ص���</td>
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
                            <td align=middle bgcolor=#eeeeee>�׶���˹</td>
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
                        color=#ff0000>����</font></td>
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
                            <td align=middle bgcolor=#eeeeee>Ħ������</td>
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
                            <td align=middle bgcolor=#eeeeee>�ڿ���</td>
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
                            <td bgcolor=#eeeeee><font color=#ff0000>Ӣ��</font></td>
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
                            <td bgcolor=#eeeeee>������</td>
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
                            <td align=middle bgcolor=#eeeeee>����</td>
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
                            <td align=middle bgcolor=#eeeeee>����ά��</td>
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
                            <td align=middle bgcolor=#eeeeee>��϶��</td>
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
                        color=#ff0000>����</font></td>
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
                            <td align=middle bgcolor=#eeeeee>ί������</td>
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
                            <td align=middle bgcolor=#eeeeee>����</td>
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
                            <td align=middle bgcolor=#eeeeee>��ۺͰ���</td>
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
                            <td align=middle bgcolor=#eeeeee>̨��</td>
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
                            <td align=middle bgcolor=#eeeeee>��������</td>
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
                              <div align=right>[ �۸�λ��RMBԪ | ���� E1��S1-S7��S10��S11�����<u>��ʾ�۸�Ϊȫ�������ܺ�</u> 
                                ]<br>
                                [ S8��S9��S12�����<u>��ʾ�۸��ָ�����</u>��������������ƾ������Ʊʵ��ʵ�� 
                                ]</div>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <br>
                        E1��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���1����ǩ֤<br>
                        S1��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���6���¶��ǩ֤<br>
                        S2��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���6����0��ǩ֤ [<font color=#ff0000> 
                        New!</font>]<br>
                        S3��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���6����1��ǩ֤ [<font 
                  color=#ff0000> New!</font>]<br>
                        S4��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���6����2��ǩ֤ [<font 
                  color=#ff0000> New!</font>]<br>
                        S5��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���3����0��ǩ֤<br>
                        S6��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���3����1��ǩ֤<br>
                        S7��Ŀǰ����ͨ���Σ�L����������F��ǩ֤��ϣ���õ���3����2��ǩ֤<br>
                        S8��Ŀǰ���κ�����ǩ֤����һ�ΰ���1���Σ�̨��Ϊ2�꣩��ҵ֤������ǩ֤��������ɣ��������ԣ�<br>
                        S9��Ŀǰ�ֹ�����Z��ǩ֤��ϣ������1���ξ�ҵ֤������ǩ֤��������ɣ�������죩<br>
                        S10��Ŀǰ���κ�����ǩ֤��ϣ���õ����Ϻ���������˼�ʻ֤����Ч��6�꣩ [<font color=#ff0000> 
                        New!</font>]<br>
                        S11��Ŀǰ�ֹ�����Z��ǩ֤��ϣ���õ����������Ȯ֤����Ч��1�꣩<br>
                        S12�����������������Ա�������ҵ�˰�����ǩ֤��������ɣ�500Ԫ/��Ϊ����ѣ������������ã�<br>
                        <font 
                  color=#ff0000>*�������з����ܹ����Ϻ���ɣ���������˳�����������������ԣ��ɼӼ���<br>
                        </font><font 
                  color=#ff0000>*�������з����ҹ�˾�ṩ��ѵ��ͣ����ʽΪ���󸶿</font><br>
                        <br>
                        <span 
                  class=a105>���Ϸ�����Ŀ��Ӧ�Ĳ��������嵥��<br>
                        </span><br>
                        <b>E1������Ŀ��1����ǩ֤���[<font 
                  color=#ff0000> New!</font>]��׼���Ĳ���</b><br>
                        ���ϣ����ա�1��2����Ƭ<br>
                        <u>��������ʱ��</u>��10�������� <br>
                        <br>
                        ע������ǩ֤���ǻ�����ɽ���ֲ�ǩ�����������ߵ�ԭ��ǩ������ʱ���ܵõ���֤����ʵ���ǻ���<b><font 
                  color=#ff0000>ǿ�ҽ���</font></b>������3-6���µ�ǩ֤����Ϊ3-6���µ�ǩ֤��S1-S7�ķ������Ϻ���ǩ����100%���۸���Ա��˶��ҳ�֤ʱ��̡������ȷʵ�ر���ҪE1����Ļ������ǽ����Ƚ����ռ�Ŀǰǩ֤��ӡ���������ҹ�˾��Ȼ�������Ǻ�ɽ���ֲ�ȷ��������ٽ��в�����<br>
                        <br>
                        <b>S1-S7������Ŀ��ǩ֤������׼���Ĳ���</b><br>
                        ���ϣ����գ���ʱס�޵ǼǱ�<a 
                  href="http://www.visainchina.com/images/regform.jpg" 
                  target=_blank><u>����鿴����</u></a>����1��2����Ƭ<br>
                        <u>��������ʱ��</u>��5��������<br>
                        <br>
                        ע����ʱס�޵ǼǱ�������ַ������ɹ�ѡ��<br>
                        1�������ȥ��ס�������ɳ������а����Ƽ���ÿ�γ��뾳��Ǩַ���������µǼǣ�<br>
                        2����ס�������1���ڱ���ǰ̨�ɵǼǰ�����������������£���д�������ʱ�����δ����<br>
                        <br>
                        <b><span 
                  class=a105><a 
                  name=express></a></span>S8������Ŀ��1���ι���ǩ֤/������������׼���Ĳ���</b><br>
                        1�����գ�Passport��<br>
                        2��������Resume or C.V. Written by yourself��<br>
                        3����ʱס�޵ǼǱ�Registration Form Of Temporary Residence��*<br>
                        4������֤����Health Certificated��<br>
                        5���ʸ�֤����Qualification Document��<br>
                        6���Ͷ���ͬ��Labor Contract��<br>
                        7��Ӫҵִ�պ���֯��������֤��ӡ��������������ҵ�����ṩ��׼֤�飨Business License��<br>
                        8��8��2����Ƭ<br>
                        <u>��������ʱ��</u>��10��������<u></u><u><br>
                        ��ͨ�Ӽ�����</u>��7�������գ�����Ӽ�����400Ԫ<br>
                        <br>
                        <font 
                  color=#ff0000><b>*������Ϣ��</b></font>��2005��8��22���𣬷�����L��F��Xǩ֤�⼮��ʿ�����ڣ�1����˾ע���ʽ�С��300���������2��ְλ���ڸ��ܾ���ְλ�ģ��޷�ֱ������ҵ֤�������ڼ�������һ�ΰ���Zǩ֤�뾳�󣬷��ɼ��������ҵ֤�;�����ɡ���ϸ��Ϣ������33011478��ѯ��<br>
                        <br>
                        <b>S9������Ŀ��1���ι���ǩ֤���������������׼���Ĳ���</b><br>
                        1�����ռ���Ч����ǩ֤���������<br>
                        2����ҵ֤��Work Permit��<br>
                        3�����µ��Ͷ���ͬ��Labor Contract��<br>
                        4��Ӫҵִ�պ���֯��������֤��ӡ��������������ҵ�����ṩ��׼֤�飨Business License��<br>
                        5��3��2����Ƭ<br>
                        <u>��������ʱ��</u>��8��������<u></u><u><br>
                        ��ͨ�Ӽ�����</u>��6�������գ�����Ӽ�����400Ԫ<br>
                        <br>
                        <b><a 
                  name=driver></a>S10������Ŀ������˱��ؼ�ʻ֤���[<font color=#ff0000> New!</font>]��׼���Ĳ���</b><br>
                        1�������ʻ֤<br>
                        2������Ϊ�����ֳ��ߵ���ʱס�޵ǼǱ����ݳ��ߵ���Ч��<br>
                        3�����ռ���Чǩ֤������̨��֤���߻���֤��<br>
                        <u>��������ʱ��</u>��1��������<u></u><br>
                        <u>*�������ʱ��</u>��10��������<br>
                        <br>
                        �����Ҫ���м���켰�Ϻ���ͨ����ĵ��Կ��ԣ���ѡӢ������ģ�����ͨ�������⹲100�������Ի����ѡȡ20�⣬�����ȡ��80�����Ͼ���ͨ������ͨ��������ɴ�����������˾��ȡ��<br>
                        <br>
                        *�������ʱ�� - �������˲�����켰���ԣ��������Ϻ������޷�׼�����ϲ��ϵģ�������Ҳ�ܹ��ṩ��Ӧ������ϸ��������磨021-33011478����ѯ��<br>
                        <br>
                        <b>S11������Ŀ���������Ȯ֤�����׼���Ĳ���</b><br>
                        1��Ȯ�ཡ��֤<br>
                        2�����ռ���Ч����ǩ֤���������<br>
                        3�����պ͹���ǩ֤������̨��֤���߻���֤��<br>
                        4��5��Ȯ��<br>
                        5��5��Ȯ������<br>
                        6���۸�����RMB3500������RMB2500<br>
                        <u>��������ʱ��</u>��30��������<u></u> <br>
                        <br>
                        <b>S12������Ŀ�����������Ա����ǩ֤������֤�����׼���Ĳ���</b><br>
                        1���������ṩ���֤�飨δ��ͬ�����ṩ��ʹ�ݳ��ߵ�ͬ��֤���ţ�<br>
                        2���������ṩ����֤��<br>
                        3��������Ҫ����죬���ṩ����֤��<br>
                        4����ʱס�޵ǼǱ�Registration Form Of Temporary Residence��<br>
                        5����������Ч������ǩ֤<br>
                        6����������ߵĻ��ռ���Ч����ǩ֤���������<br>
                        7��2����Ƭ��2��<br>
                        <u>��������ʱ��</u>��5��������<u></u><br>
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
                  href="cvisa3.asp"><font color="#FF0000">�ڻ������ǩ֤����</font></a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa4.asp">̨��֤ǩע��ע����</a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa6.asp">�Ϻ�����۰�ͨ��֤</a></b></td>
                    </tr>
                    <tr> 
                      <td valign=center align=middle bgcolor=#ffffff height=22><img 
                  height=11 src="images/companysbt.gif" width=11 
                  align=absMiddle><b> <a 
                  href="cvisa5.asp">�й����������ǩ֤</a></b></td>
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
                  <b>��˾��ַ��</b><br>
                  �Ϻ�����������ɽ��·2360��510��<br>
                  <b>����ʱ�䣺</b><br>
                  ����һ���壺8:30AM-10:00PM<br>
                  <b>��ϵ�绰��</b><br>
                  �����ؼۻ�Ʊ 86-21-63018557<br>
                  �����ؼۻ�Ʊ 86-21-63074026<br>
                  ��Ʊ 86-21-29949106<br>
                  <b>�������䣺</b><br>
                  <a 
            href="mailto:"><u></u></a><br>
                  <br>
                  <img 
            height=120 src="images/pic5.jpg" 
            width=149><br>
                  <br>
                  <b>������ӣ�</b><br>
                  <a 
            href="cvisaform.asp"><u>�����ĵ���������</u></a><br>
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
