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
                                    <div align=center><strong>�ֶ��������ר�� </strong></div>
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
                                    <div align=center>����һ�� : ���Ż��� - �ֶ����� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td width=70> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>���Ż��� </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>��һƱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>���պ������ </div>
                                  </td>
                                  <td> 
                                    <div align=center>30 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 :021 -6834 6612 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>�������� : <br>
                                      ���ӱ��� - ��һ� - ������ - ����·վ - �ֶ����� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>����· </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>�༶Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>ȫ�� 20 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 :021 - 6834 6645 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5 height=62> 
                                    <div align=center>�������� : <br>
                                      �Ϻ���վ - ����㳡 - ����ҽԺ - ��ɽ· - �ֶ����� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�Ϻ���վ </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>�༶Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>ȫ�� 18 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 : 021 - 6834 6830 </div>
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
                                    <div align=center>�������� : �����º�վ¥ - �ֶ����� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td width=70> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td width=70> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�����º�վ¥ </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:30 </div>
                                  </td>
                                  <td> 
                                    <div align=center>��һƱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>���պ������ </div>
                                  </td>
                                  <td> 
                                    <div align=center>19 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 :021- 6834 6612 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>�������� : ³Ѹ��԰ - ����� - ��ǳ� 
                                      - ��ƽ· - �ֶ����� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>������· </div>
                                  </td>
                                  <td> 
                                    <div align=center>5:40 </div>
                                  </td>
                                  <td> 
                                    <div align=center>21:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>�༶Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>7:20 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>ȫ�� 18 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 : 021 - 6834 6830 </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>�������� : <br>
                                      ��ɽ��԰ - ������ - ����ҽԺ - �Ͻ�ɽ��Ƶ� - �Ž��߿Ƽ�԰�� - �ֶ����� 
                                    </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>��� </div>
                                  </td>
                                  <td> 
                                    <div align=center>�װ�ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>ĩ��ʱ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>Ʊ�� </div>
                                  </td>
                                  <td> 
                                    <div align=center>���ʱ�� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>����· </div>
                                  </td>
                                  <td> 
                                    <div align=center>6:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td> 
                                    <div align=center>�ֶ����� </div>
                                  </td>
                                  <td> 
                                    <div align=center>8:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>23:00 </div>
                                  </td>
                                  <td> 
                                    <div align=center>20 Ԫ </div>
                                  </td>
                                  <td> 
                                    <div align=center>20-30 ���� </div>
                                  </td>
                                </tr>
                                <tr bgcolor=#ffffff> 
                                  <td colspan=5> 
                                    <div align=center>��ѯ�绰 : 021 - 6834 6830 </div>
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
                              <p align=center><font size="4" face="����_GB2312">�� 
                                �� �� �� �� �� �� ��</font></p>
                              <p><font size=2>A�ߣ���԰���ꡢ�������ꡢ�½�������<br>
                                B�ߣ��������ݡ����ʹ󶼡�����ϣ���١��Ϻ�����<br>
                                C�ߣ��Ϻ����á���ƽ���ꡢ���ױ��ݡ��³Ƿ��ꡢ�����ʹ�Ƶ�<br>
                                D�ߣ��������ǡ�����ƥ�ˡ���ͤ���ݡ���������<br>
                                E1�ߣ����ط��ꡢ������Ƶꡢ�պ�����<br>
                                E2�ߣ���˹̫͡ƽ��Ƶꡢ���ű���<br>
                                F�ߣ����Ŵ�Ƶꡢ���ʷ��ꡢ��������<br>
                                �ֶ�A�ߣ����ʻ������ġ����������Ƶꡢ��ó���ô�Ƶꡢ�����Ƶ�<br>
                                �ֶ�B�ߣ�ͨó��Ƶꡢ�Ͻ�ɽ��Ƶꡢ����������Ƶ�</font></p>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <table cellspacing=0 cellpadding=0 width="100%">
                          <tbody> 
                          <tr> 
                            <td valign=center height=28> 
                              <div align=center><strong>���Ż������ר�� </strong></div>
                            </td>
                          </tr>
                          </tbody> 
                        </table>
                        <table class=ourfont cellspacing=0 bordercolordark=#ffffff cellpadding=0 width=100% bordercolorlight=#000000 border=1>
                          <tbody> 
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54>��·</td>
                            <td width=90>��ʼվ�� </td>
                            <td width=86>��ʼվ�� </td>
                            <td width=242>����ʱ�� </td>
                            <td width=342>��;ͣ��վ�� </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>����һ�� </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ���� <br>
                                �ֶ����� </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6�� <br>
                                ĩ�ࣺ20��30 <br>
                                �װࣺ8�� <br>
                                ĩ�ࣺ�������</p>
                            </td>
                            <td width=242> 
                              <p align=center>�糿����Ϊ45���Ӽ������ÿ20���ӷ�һ�� </p>
                            </td>
                            <td width=342> 
                              <p align=center>�� </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>��ר�� </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ����<br>
                                ����·������· </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6�� <br>
                                ĩ�ࣺ22��50<br>
                                �װࣺ6�� <br>
                                ĩ�ࣺ20��30</p>
                            </td>
                            <td style=width=242> 
                              <p align=center>20���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>�� </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>941 </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż���<br>
                                ���� <br>
                                �Ϻ���վ </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6��<br>
                                ĩ�ࣺ20��15<br>
                                �װࣺ6�� <br>
                                ĩ�ࣺ20��25 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>���Ż���һ�羮·һ�Ϻ�����԰һ��÷·һ����·һ���·һ ��ϼ·һ��ɽ��ӰԺһ����·һ��ɽ��·һ��ɽ��԰һ����· 
                                һ�ܼҶ�һ��������һ����·һ����·һ�Ϻ���վ </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>925 </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ���� <br>
                                ����㳡 </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6�� <br>
                                ĩ�ࣺ21��<br>
                                �װࣺ6�� <br>
                                ĩ�ࣺ22�� </p>
                            </td>
                            <td width=242> 
                              <p align=center>10���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>���Ż���һ�����´�һ�Ϻ�����԰һ�̼���һ��÷·һ����· һ���ſ�����һ��ɽ��·һ����·һ����·һ����԰һ����· 
                                һʯ��·һ����㳡 </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>938 </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ���� <br>
                                �̳�· ���ֶ��� </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6�� <br>
                                ĩ�ࣺ21��30 <br>
                                �װࣺ6�� <br>
                                ĩ�ࣺ21��30 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>���Ż���һ�����´�һ�Ϻ�����԰һ�̼���һ��÷·һ����· һˮ��·һ���ſ�����һ��˳·һ��ɽ��·һ�ڶ���˲�Ժһ 
                                ����·һֱɽ·һ��ͤ����һ��Կ��·һ��ƽ·һ����·һ�� ����ѧһ����·һ³��·һ������·һ�ϳ�վ·һ����һ���� 
                                ·һ����լ�ֵ�·һΫ��·һ�˰۰�һ�̳�· </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>806 </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ���� <br>
                                ��ɽ��һ· </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6�� <br>
                                ĩ�ࣺ21��30 <br>
                                �װࣺ6��<br>
                                ĩ�ࣺ21��30 </p>
                            </td>
                            <td width=242> 
                              <p align=center>10���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>���Ż���һ�����´�һ�Ϻ�����԰һ�̼���һ��÷·һ����· һˮ��·һ�߼���Ժһ��˳·һ����·һ����·һ�㻨��һ�� 
                                ͨ��ѧһ��һ�һ��ƽ·һ����·һ����·һ��ľ��·һ������ һб��·һ��Ϫ·һ��ɽ��һ·һ³��· 
                              </p>
                            </td>
                          </tr>
                          <tr bgcolor="#FFFFFF"> 
                            <td width=54> 
                              <p align=center>807 </p>
                            </td>
                            <td width=90> 
                              <p align=center>���Ż��� <br>
                                ���� <br>
                                ����´� </p>
                            </td>
                            <td width=86> 
                              <p align=center>�װࣺ6��<br>
                                ĩ�ࣺ21�� <br>
                                �װࣺ6�� <br>
                                ĩ�ࣺ21�� </p>
                            </td>
                            <td width=242> 
                              <p align=center>10���� </p>
                            </td>
                            <td width=342> 
                              <p align=center>���Ż���һ�����´�һ�Ϻ�����԰һ�̼���һ�������� һ���¾�һ��ϼ·һ�����һ���¾�һ����·һ��ɳ��·һ÷ 
                                ��·һ�ܰ�·һ��ʯ·һͭ��·һ�Ϻ���վһ����´� ���Ż������ڵ�����ʵ�����г��⳵վ�㣬������� 
                                ���˶�;���⳵վ�㡣���࿪ʼ���������г��⳵��͡�</p>
                            </td>
                          </tr>
                          </tbody>
                        </table>
                        <table width=100% border=0>
                          <tbody> 
                          <tr> 
                            <td style=bgcolor="#FFFFFF" bgcolor="#FFFFFF"> 
                              <p align=center><font face=����_GB2312 size=4><em><u>�� 
                                �� �� �� �� �� �� ʡ �� �� �� �� </u></em></font></p>
                              <p><font size=2>����10��30��12��00��13��30��15��00��16��30��18��00������85Ԫ<br>
                                �Ͼ�13��30��15��30��18��00������95Ԫ<br>
                                ����12��50��17��15�����żҸۣ�80Ԫ<br>
                                ����12��30��15��30������80Ԫ<br>
                                ����11��30��13��30��15��30��17��30��65Ԫ<br>
                                ��ɽ7��30-20��30��ÿСʱһ�࣬����90Ԫ<br>
                                ����10��00-19��00��ÿСʱһ�࣬50Ԫ<br>
                                ����10��30-19��00��ÿСʱһ�࣬����75Ԫ</font></p>
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
