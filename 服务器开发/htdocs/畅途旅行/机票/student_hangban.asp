<!--#include file="inc/conn.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_name%></title>
<link rel="stylesheet" href="inc/css.css"  type="text/css">
 
<%set rs=server.CreateObject("adodb.recordset")
%>
<style type="text/css">
A:link {	COLOR: #666688; TEXT-DECORATION: none; FONT-SIZE:9pt; cursor: hand;}
A:visited {	COLOR: #666688; TEXT-DECORATION: none; FONT-SIZE:9pt; cursor: hand;}
A:active {COLOR: red; TEXT-DECORATION: none}
A:hover {	COLOR: #FFbb99; TEXT-DECORATION: underline; FONT-SIZE:9pt; cursor: hand;}
BODY {FONT-FAMILY: ����; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.style10 {color: #FF0000}
</style>
</head>
 
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

<div align="center">
	<!--#include file="inc/top.asp"-->
</div>
<div align="center">
	 <table width="765" border="0" cellpadding="0" cellspacing="0" class="line_height">
       <tr>
           <td width="389" height="22" bgcolor="#F5F5F5"> ��

 
&gt;��ѡ����ѧ�ؼۻ�Ʊǰ�����Ķ���ѧ�ؼۻ�Ʊ���� <a href="server.htm">��Ʊ��֪ </a>�� </td>
           <td width="376" bgcolor="#F5F5F5"> ��</td>
       </tr>
         <tr>
           <td height="90" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="line_height">
             <tr>
               <td width="4%" height="131" rowspan="2">&nbsp;</td>
               <td width="79%" bgcolor="#9EB6D7"> �� ���˵�� </td>
               <td width="17%" rowspan="2">&nbsp;</td>
             </tr>
             <tr>
               <td>1.��Ԥ����ѧ����Ʊʱ�������ṩѧ��ǩ֤����Чѧ��֤��������������������ṩ¼ȡ֪ͨ��ĸ�ӡ���� <br>
                 <br>
2.��ѧ��ֱϵ����(��ĸ����ż���ֵܽ���)����Ԥ����ѧ�ؼ�ʱ�����ṩֱϵ������ϵ֤��(�Ի��ڱ���ʾΪ׼)���ڱ���ӡ���� <br>
<br>
3.��ѧ��������30KG��������</td>
             </tr>
           </table></td>
           <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="line_height">
             <tr>
               <td height="18" bgcolor="#9EB6D7"> �� 


 �ȵ㺽��</td>
             </tr>
             <tr>
               <td height="66"><table cellspacing="5" cellpadding="5">
                 <tr>
                   <td><img height="10" src="student_hangban_new.gif" width="10"> �ձ� <a href="student_hangban_list.asp?cityid=&#19996;&#20140;">���� </a><a href="student_hangban_list.asp?cityid=&#22823;&#38442;">���� </a><a href="student_hangban_list.asp?cityid=&#31119;&#20872;">���� </a><a href="student_hangban_list.asp?cityid=&#21517;&#21476;&#23627;">������ </a></td>
                 </tr>
               </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ���� <a href="student_hangban_list.asp?cityid=&#27721;&#22478;">���� </a><a href="student_hangban_list.asp?cityid=&#37340;&#23665;">��ɽ </a><a href="student_hangban_list.asp?cityid=&#22823;&#37041;">���� </a><a href="student_hangban_list.asp?cityid=&#28165;&#24030;">���� </a><a href="student_hangban_list.asp?cityid=&#27982;&#24030;">���� </a><a href="student_hangban_list.asp?cityid=&#20809;&#24030;">���� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> �Ĵ����� <a href="student_hangban_list.asp?cityid=&#24713;&#23612;">Ϥ�� </a><a href="student_hangban_list.asp?cityid=&#22696;&#23572;&#26412;">ī���� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ������ <a href="student_hangban_list.asp?cityid=&#22885;&#20811;&#20848;">�¿��� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ���� <a href="student_hangban_list.asp?cityid=&#24052;&#40654;">���� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> Ӣ�� <a href="student_hangban_list.asp?cityid=&#20262;&#25958;">�׶� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> �¹� <a href="student_hangban_list.asp?cityid=&#27861;&#20848;&#20811;&#31119;">�����˸� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ���� <a href="student_hangban_list.asp?cityid=&#36203;&#23572;&#36763;&#22522;">�ն����� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ������ <a href="student_hangban_list.asp?cityid=&#24067;&#36798;&#20329;&#26031;">������˹ </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> �µ��� <a href="student_hangban_list.asp?cityid=&#32500;&#20063;&#32435;">άҲ�� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ����ʱ <a href="student_hangban_list.asp?cityid=&#24067;&#40065;&#22622;&#23572;">��³���� </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> ����� <a href="student_hangban_list.asp?cityid=&#31859;&#20848;">���� </a><a href="student_hangban_list.asp?cityid=&#32599;&#39532;">���� </a></td>
                   </tr>
                 </table></td>
             </tr>
           </table></td>
         </tr>
  </table>
</div>
<div align="center">
	
</div>

<div align="center">
	<table border="0" cellpadding="0" cellspacing="0" width="765" id="table19" height="1" bgcolor="#848684">
		<tr>
			<td><img border="0" src="images/point.gif" width="1" height="1"></td>
		</tr>
	</table>
</div>
<div align="center">
	<!--#include file="inc/bottom.asp"-->
</div>

</body>

</html>