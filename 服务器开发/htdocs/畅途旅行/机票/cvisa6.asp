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
                        <span 
                  class=a105>���۰�ͨ��֤�Ӽ������ռӼ����������и�����Ҫ��Ӧ��ѯ����<br>
                        <br>
                        </span><b>��ѡ��</b>[1] <a 
                  href="cvisa6.asp#txz"><u>�۰�ͨ��֤�Ӽ�����</u></a> [2] <a 
                  href="cvisa6.asp#hz"><u>���ռӼ�����</u></a><br>
                        <br>
                        <font 
                  color=#ff0000><b><font color=#ff0000><a 
                  name=txz></a></font>[1] �۰�ͨ��֤�Ӽ�����</b></font><br>
                        ������������·333���Ϻ��г��뾳����ֵݽ���ز��ϣ������嵥��ο��±��������ʱ��֤�ص��빴ѡ<b>����·333���ܲ���֤</b>���������ǳ�֤���ٶ���죩����˳���ݽ����Ϻ��������ػ��������֤��ִһ�ţ�ֻҪ����֤��ִ�������ǣ����ǾͿ��԰�����Ӽ�ȡ֤��������650Ԫ����������֤ʱ������������ã��˷������ǻ�ƾ������Ʊʵ��ʵ������5�������ճ�֤��<br>
                        <br>
                        ������֤ʱ�����ɸ�����Ҫ�ο��±���Ӧ�Ĳ���׼���嵥���򲦴�������ѯ�绰��021-32031123����ѯ��<br>
                        <table class=a9 cellspacing=1 cellpadding=0 width="100%" 
                  bgcolor=#000000 border=0>
                          <tbody> 
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>���ۡ���Ŀ��</td>
                            <td align=middle bgcolor=#efefef>��������</td>
                            <td align=middle bgcolor=#efefef>��Ƭ</td>
                            <td align=middle bgcolor=#efefef>ͣ������/��Ч��</td>
                            <td align=middle bgcolor=#efefef> 
                              <p style="MARGIN: 8px">׼������ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef rowspan=7>����</td>
                            <td align=middle bgcolor=#ffffff>C01</td>
                            <td align=middle bgcolor=#ffffff>3��</td>
                            <td align=middle bgcolor=#ffffff>14��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">���ڲ������֤��<br>
                                Ӫҵִ�ա�����֤����ǲ�� </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C02</td>
                            <td align=middle bgcolor=#efefef>3��</td>
                            <td align=middle bgcolor=#efefef>14��/3����</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">���ڲ������֤��<br>
                                ��ʡӪҵִ�ա���ǲ��������֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C03</td>
                            <td align=middle bgcolor=#ffffff>1��</td>
                            <td align=middle bgcolor=#ffffff>14��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">ͨ��֤����ǲ�� </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C04</td>
                            <td align=middle bgcolor=#efefef>1��</td>
                            <td align=middle bgcolor=#efefef>14��/3����</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">ͨ��֤����ǲ����Ӫҵִ�ա�����֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C05</td>
                            <td align=middle bgcolor=#ffffff>3��</td>
                            <td align=middle bgcolor=#ffffff>14��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">ͨ��֤����ǲ����Ӫҵִ�ա�����֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C06</td>
                            <td align=middle bgcolor=#efefef>3��</td>
                            <td align=middle bgcolor=#efefef>14��/3����</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">ͨ��֤����ǲ����Ӫҵִ�ա�<br>
                                ���ڲ������֤ ������֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C07</td>
                            <td align=middle bgcolor=#ffffff>3��</td>
                            <td align=middle bgcolor=#ffffff>14��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">ͨ��֤����ǲ����Ӫҵִ�ա�<br>
                                ���ڲ������֤����ʧ֤��������֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef rowspan=4>����</td>
                            <td align=middle bgcolor=#efefef>C08</td>
                            <td align=middle bgcolor=#efefef>3��</td>
                            <td align=middle bgcolor=#efefef>7��/3����</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">���ڲ������֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C09</td>
                            <td align=middle bgcolor=#ffffff>1��</td>
                            <td align=middle bgcolor=#ffffff>7��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">ͨ��֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#efefef>C10</td>
                            <td align=middle bgcolor=#efefef>3��</td>
                            <td align=middle bgcolor=#efefef>7��/3����</td>
                            <td bgcolor=#efefef> 
                              <p style="MARGIN: 8px">ͨ��֤ </p>
                            </td>
                          </tr>
                          <tr valign=center> 
                            <td align=middle bgcolor=#ffffff>C11</td>
                            <td align=middle bgcolor=#ffffff>3��</td>
                            <td align=middle bgcolor=#ffffff>7��/3����</td>
                            <td bgcolor=#ffffff> 
                              <p style="MARGIN: 8px">ͨ��֤�����ڲ������֤ </p>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <br>
                        ���� C01���Ϻ��б��ؾ����״ΰ���<br>
                        ���� C02����ְ����ʡ�е����Ϻ����ڵľ����״ΰ���<br>
                        ���� C03�������������ǩ����ԭ������λ�ޱ䶯<br>
                        ���� C04��A �����������ǩ����ԭ������λ�б䶯 B �����������ǩ C �������̽��ǩ<br>
                        ���� C05���ɰ�ͨ��֤����<br>
                        ���� C06��A �°�ͨ��֤ҳ�����꣨������ B �ɰ�ͨ��֤ʧЧ��������<br>
                        ���� C07��ͨ��֤��ʧ����<br>
                        -------------------------------------------------------------------------------------<br>
                        ���� C08���Ϻ��б��ؾ����״ΰ���<br>
                        ���� C09��A �����������ǩ B �����������ǩ<br>
                        ���� C10���ɰ�ͨ��֤����<br>
                        ���� C11��A �°�ͨ��֤ҳ�����꣨������ B �ɰ�ͨ��֤ʧЧ��������<br>
                        -------------------------------------------------------------------------------------<br>
                        <br>
                        <font 
                  color=#ff0000><b><font color=#ff0000><a name=hz></a></font>[2] 
                        ���ռӼ�����</b></font><br>
                        ������������·333���Ϻ��г��뾳����ֵݽ���ز��ϣ��������ʱ��֤�ص��빴ѡ<b>����·333���ܲ���֤</b>���������ǳ�֤���ٶ���죩����˳���ݽ����Ϻ��������ػ��������֤��ִһ�ţ�ֻҪ����֤��ִ�������ǣ����ǾͿ��԰�����Ӽ�ȡ֤��������650Ԫ����������֤ʱ������������ã��˷������ǻ�ƾ������Ʊʵ��ʵ������5�������ճ�֤��<br>
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
                  href="cvisa6.asp"><font color="#FF0000">�Ϻ�����۰�ͨ��֤</font></a></b></td>
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
