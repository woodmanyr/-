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
            <a href="#"><img src="images/ap100200.gif" width="194" height="400" border="0"></a></td>
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
                  class=a105>�й�����������Ρ�����ǩ֤�����ȫ����Χ�������и�����Ҫ��Ӧ��ѯ����<br>
                        <br>
                        </span> 
                        <table class=a9 cellspacing=1 cellpadding=0 width="100%" 
                  bgcolor=#000000 border=0>
                          <tbody> 
                          <tr bgcolor=#ffffff> 
                            <td align=middle width="9%">����</td>
                            <td align=middle width="8%">������</td>
                            <td align=middle width="11%">�۸�</td>
                            <td align=middle width="8%">��Ч��</td>
                            <td align=middle width="9%">ͣ����</td>
                            <td align=middle width="6%">��Ƭ</td>
                            <td align=middle width="44%"> 
                              <p style="MARGIN: 8px">׼�����ϼ���ע </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef 
                        rowspan=2><font color=#ff0000><b>�¼���</b></font></td>
                            <td align=middle width="8%" bgcolor=#efefef>3</td>
                            <td align=middle width="11%" bgcolor=#efefef>600</td>
                            <td align=middle width="8%" bgcolor=#efefef>35��</td>
                            <td align=middle width="9%" bgcolor=#efefef>30��/��</td>
                            <td align=middle width="6%" bgcolor=#efefef>4</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">�������������֤ԭ������Ѻ�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle bgcolor=#efefef>5</td>
                            <td align=middle width="11%" bgcolor=#efefef>2500</td>
                            <td align=middle width="8%" bgcolor=#efefef>35��</td>
                            <td align=middle width="9%" bgcolor=#efefef>30��/��</td>
                            <td align=middle width="6%" bgcolor=#efefef>4</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">�������������֤ԭ������Ѻ�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff 
                        rowspan=2><font color=#ff0000>̩��</font></td>
                            <td align=middle bgcolor=#ffffff>3</td>
                            <td align=middle bgcolor=#ffffff>350</td>
                            <td align=middle width="8%" bgcolor=#ffffff>3����</td>
                            <td align=middle bgcolor=#ffffff>30��</td>
                            <td align=middle bgcolor=#ffffff>2</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ������ </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle bgcolor=#ffffff>5</td>
                            <td align=middle bgcolor=#ffffff>1300</td>
                            <td align=middle width="8%" bgcolor=#ffffff>90��</td>
                            <td align=middle bgcolor=#ffffff>90��</td>
                            <td align=middle bgcolor=#ffffff>5</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ�����ա����֤��ӡ�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef><font 
                        color=#ff0000>��������</font></td>
                            <td align=middle bgcolor=#efefef>3</td>
                            <td align=middle bgcolor=#efefef>350</td>
                            <td align=middle width="8%" bgcolor=#efefef>3����</td>
                            <td align=middle bgcolor=#efefef>30��</td>
                            <td align=middle bgcolor=#efefef>2</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ������ </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff 
                      rowspan=2>�ϼ���</td>
                            <td align=middle width="8%" bgcolor=#ffffff>8</td>
                            <td align=middle width="11%" bgcolor=#ffffff>2100</td>
                            <td align=middle width="8%" bgcolor=#ffffff 
                      rowspan=2>3����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>7-14��</td>
                            <td align=middle width="6%" bgcolor=#ffffff>4</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ�����֤��ӡ�������ա���ְ֤�� </p>
                            </td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle width="8%">8</td>
                            <td align=middle width="11%">2200</td>
                            <td align=middle width="9%">30��</td>
                            <td align=middle width="6%">4</td>
                            <td width="44%"> 
                              <p 
                        style="MARGIN: 8px">����ǩ�����֤��ӡ�������ա���ְ֤�����������뺯����ǲ����˫��Ӫҵִ�� 
                              </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef>����</td>
                            <td align=middle bgcolor=#efefef>7</td>
                            <td align=middle bgcolor=#efefef>1000</td>
                            <td align=middle width="8%" bgcolor=#efefef>2����</td>
                            <td align=middle bgcolor=#efefef>30��</td>
                            <td align=middle bgcolor=#efefef>4</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ���������ϱ����ա����֤��ӡ�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff 
                        rowspan=2><font color=#ff0000>Խ��</font></td>
                            <td align=middle bgcolor=#ffffff>7</td>
                            <td align=middle bgcolor=#ffffff>1000</td>
                            <td align=middle width="8%" bgcolor=#ffffff>1����</td>
                            <td align=middle bgcolor=#ffffff>30��</td>
                            <td align=middle bgcolor=#ffffff>2</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">���λ�����ǩ�����գ���������ṩ����֤��ӡ���� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle bgcolor=#ffffff>8</td>
                            <td align=middle bgcolor=#ffffff>3000</td>
                            <td align=middle width="8%" bgcolor=#ffffff>6����</td>
                            <td align=middle bgcolor=#ffffff>6����</td>
                            <td align=middle bgcolor=#ffffff>4</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">6���¶������ǩ֤�����գ���������ṩ����֤��ӡ���� 
                              </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef><font 
                        color=#ff0000>���ɱ�</font></td>
                            <td align=middle width="8%" bgcolor=#efefef>5</td>
                            <td align=middle width="11%" bgcolor=#efefef>1000</td>
                            <td align=middle width="8%" bgcolor=#efefef>3����</td>
                            <td align=middle width="9%" bgcolor=#efefef>14��</td>
                            <td align=middle width="6%" bgcolor=#efefef>2</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ����ְ֤�������� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff 
                        rowspan=2><font color=#ff0000>ӡ��</font></td>
                            <td align=middle width="8%" bgcolor=#ffffff>7</td>
                            <td align=middle width="11%" bgcolor=#ffffff>1000</td>
                            <td align=middle width="8%" bgcolor=#ffffff 
                      rowspan=2>3����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>30��</td>
                            <td align=middle width="6%" bgcolor=#ffffff>2</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p 
                        style="MARGIN: 8px">����ǩ�����ա����֤��ӡ����Ӣ����ְ֤����35������Ů�Զ��300Ԫ 
                              </p>
                            </td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle width="8%">10</td>
                            <td align=middle width="11%">2600[��]<br>
                              3600[Ů]</td>
                            <td align=middle width="9%">60��</td>
                            <td align=middle width="6%">2</td>
                            <td width="44%"> 
                              <p style="MARGIN: 8px">����ǩ�����ա���POA�¼�200�������ڼ�¼�߼�600 
                              </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef>���</td>
                            <td align=middle width="8%" bgcolor=#efefef>7</td>
                            <td align=middle width="11%" bgcolor=#efefef>1000</td>
                            <td align=middle width="8%" bgcolor=#efefef>2����</td>
                            <td align=middle width="9%" bgcolor=#efefef>30��</td>
                            <td align=middle width="6%" bgcolor=#efefef>2</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ�����֤��ӡ�������� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff 
                      rowspan=2>����կ</td>
                            <td align=middle width="8%" bgcolor=#ffffff>7</td>
                            <td align=middle width="11%" bgcolor=#ffffff>900</td>
                            <td align=middle width="8%" bgcolor=#ffffff 
                      rowspan=2>3����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>30��</td>
                            <td align=middle width="6%" bgcolor=#ffffff>2</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ�����֤��ӡ�������� </p>
                            </td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle width="8%">9</td>
                            <td align=middle width="11%">1100</td>
                            <td align=middle width="9%">������</td>
                            <td align=middle width="6%">4</td>
                            <td width="44%"> 
                              <p style="MARGIN: 8px">����ǩ�����֤��ӡ�������� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef>ӡ��</td>
                            <td align=middle width="8%" bgcolor=#efefef>10</td>
                            <td align=middle width="11%" bgcolor=#efefef>1700</td>
                            <td align=middle width="8%" bgcolor=#efefef>3����</td>
                            <td align=middle width="9%" bgcolor=#efefef>30��</td>
                            <td align=middle width="6%" bgcolor=#efefef>3</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ�����ա����֤ </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff>�Ჴ��</td>
                            <td align=middle width="8%" bgcolor=#ffffff>3</td>
                            <td align=middle width="11%" bgcolor=#ffffff>430</td>
                            <td align=middle width="8%" bgcolor=#ffffff>6����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>6����</td>
                            <td align=middle width="6%" bgcolor=#ffffff>2</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ������ </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef>�ɹ�</td>
                            <td align=middle width="8%" bgcolor=#efefef>10</td>
                            <td align=middle width="11%" bgcolor=#efefef>2000</td>
                            <td align=middle width="8%" bgcolor=#efefef>3����</td>
                            <td align=middle width="9%" bgcolor=#efefef>1����</td>
                            <td align=middle width="6%" bgcolor=#efefef>4</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ�����ա����֤��ӡ������ְ֤�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff>������</td>
                            <td align=middle width="8%" bgcolor=#ffffff>10</td>
                            <td align=middle width="11%" bgcolor=#ffffff>2800</td>
                            <td align=middle width="8%" bgcolor=#ffffff>2����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>30��</td>
                            <td align=middle width="6%" bgcolor=#ffffff>4</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">����ǩ����ֽǩ֤�����գ�30������Ů�Բ����� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef 
                      rowspan=2>����˹</td>
                            <td align=middle width="8%" bgcolor=#efefef>10</td>
                            <td align=middle width="11%" bgcolor=#efefef>1900</td>
                            <td align=middle width="8%" bgcolor=#efefef 
                      rowspan=2>1����</td>
                            <td align=middle width="9%" bgcolor=#efefef>14��</td>
                            <td align=middle width="6%" bgcolor=#efefef>2</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ�����֤��ӡ�����绰����ַ�����գ�����ͣ���� 
                              </p>
                            </td>
                          </tr>
                          <tr bgcolor=#ffffff> 
                            <td align=middle width="8%" bgcolor=#efefef>20</td>
                            <td align=middle width="11%" bgcolor=#efefef>2900</td>
                            <td align=middle width="9%" bgcolor=#efefef>1����</td>
                            <td align=middle width="6%" bgcolor=#efefef>2</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p 
                        style="MARGIN: 8px">����ǩ�����ա����֤��ӡ�����绰����ַ����Ƭ2�š����뺯2�š�Ӫҵִ�ո���ԭ����֤�� 
                                ������ͣ���� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#ffffff>�ͻ�˹̹</td>
                            <td align=middle width="8%" bgcolor=#ffffff>8</td>
                            <td align=middle width="11%" bgcolor=#ffffff>2800</td>
                            <td align=middle width="8%" bgcolor=#ffffff>3����</td>
                            <td align=middle width="9%" bgcolor=#ffffff>1����</td>
                            <td align=middle width="6%" bgcolor=#ffffff>4</td>
                            <td width="44%" bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">�Է����뺯�����뺯2�š����ա����֤��ӡ�� </p>
                            </td>
                          </tr>
                          <tr> 
                            <td align=middle width="9%" bgcolor=#efefef>˹������</td>
                            <td align=middle width="8%" bgcolor=#efefef>5</td>
                            <td align=middle width="11%" bgcolor=#efefef>2800</td>
                            <td align=middle width="8%" bgcolor=#efefef>3����</td>
                            <td align=middle width="9%" bgcolor=#efefef>14��</td>
                            <td align=middle width="6%" bgcolor=#efefef>4</td>
                            <td width="44%" bgcolor=#efefef> 
                              <p style="MARGIN: 8px">����ǩ���������ϱ����� </p>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
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
                  href="cvisa3.asp">�ڻ������ǩ֤����</a></b></td>
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
                  href="cvisa5.asp"><font color="#FF0000">�й����������ǩ֤</font></a></b></td>
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
                  ����һ���壺9:30AM-5:00PM<br>
                  <b>��ϵ�绰��</b><br>
                  �����ؼۻ�Ʊ 86-21-63018557<br>
                  �����ؼۻ�Ʊ 86-21-63074026<br>
                  ��Ʊ 86-21-29949106<br>
                  <b>�������䣺</b><br>
                  <a 
            href="mailto:king@chinaunite.cn"><u>king@chinaunite.cn</u></a><br>
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
