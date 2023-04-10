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
BODY {FONT-FAMILY: 宋体; FONT-SIZE: 9pt}
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

<div align="center">
	<!--#include file="inc/top.asp"-->
</div>
<div align="center">
	 <table width="765" border="0" cellpadding="0" cellspacing="0" class="line_height">
       <tr>
           <td width="389" height="22" bgcolor="#F5F5F5"> 　

 
&gt;在选择留学特价机票前，请阅读留学特价机票网上 <a href="server.htm">订票须知 </a>。 </td>
           <td width="376" bgcolor="#F5F5F5"> 　</td>
       </tr>
         <tr>
           <td height="90" valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="line_height">
             <tr>
               <td width="4%" height="131" rowspan="2">&nbsp;</td>
               <td width="79%" bgcolor="#9EB6D7"> ※ 相关说明 </td>
               <td width="17%" rowspan="2">&nbsp;</td>
             </tr>
             <tr>
               <td>1.在预定留学生机票时，必须提供学生签证和有效学生证件，如果是新生，还需提供录取通知书的复印件。 <br>
                 <br>
2.留学生直系亲属(父母、配偶、兄弟姐妹)，在预定留学特价时，需提供直系亲属关系证明(以户口本显示为准)户口本复印件。 <br>
<br>
3.留学生可享受30KG的免费行李。</td>
             </tr>
           </table></td>
           <td valign="top"><table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" class="line_height">
             <tr>
               <td height="18" bgcolor="#9EB6D7"> ※ 


 热点航线</td>
             </tr>
             <tr>
               <td height="66"><table cellspacing="5" cellpadding="5">
                 <tr>
                   <td><img height="10" src="student_hangban_new.gif" width="10"> 日本 <a href="student_hangban_list.asp?cityid=&#19996;&#20140;">东京 </a><a href="student_hangban_list.asp?cityid=&#22823;&#38442;">大阪 </a><a href="student_hangban_list.asp?cityid=&#31119;&#20872;">福冈 </a><a href="student_hangban_list.asp?cityid=&#21517;&#21476;&#23627;">名古屋 </a></td>
                 </tr>
               </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 韩国 <a href="student_hangban_list.asp?cityid=&#27721;&#22478;">汉城 </a><a href="student_hangban_list.asp?cityid=&#37340;&#23665;">釜山 </a><a href="student_hangban_list.asp?cityid=&#22823;&#37041;">大邱 </a><a href="student_hangban_list.asp?cityid=&#28165;&#24030;">清州 </a><a href="student_hangban_list.asp?cityid=&#27982;&#24030;">济州 </a><a href="student_hangban_list.asp?cityid=&#20809;&#24030;">光州 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 澳大利亚 <a href="student_hangban_list.asp?cityid=&#24713;&#23612;">悉尼 </a><a href="student_hangban_list.asp?cityid=&#22696;&#23572;&#26412;">墨尔本 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 新西兰 <a href="student_hangban_list.asp?cityid=&#22885;&#20811;&#20848;">奥克兰 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 法国 <a href="student_hangban_list.asp?cityid=&#24052;&#40654;">巴黎 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 英国 <a href="student_hangban_list.asp?cityid=&#20262;&#25958;">伦敦 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 德国 <a href="student_hangban_list.asp?cityid=&#27861;&#20848;&#20811;&#31119;">法兰克福 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 芬兰 <a href="student_hangban_list.asp?cityid=&#36203;&#23572;&#36763;&#22522;">赫尔辛基 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 匈牙利 <a href="student_hangban_list.asp?cityid=&#24067;&#36798;&#20329;&#26031;">布达佩斯 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 奥地利 <a href="student_hangban_list.asp?cityid=&#32500;&#20063;&#32435;">维也纳 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 比利时 <a href="student_hangban_list.asp?cityid=&#24067;&#40065;&#22622;&#23572;">布鲁塞尔 </a></td>
                   </tr>
                 </table>
                 <table cellspacing="5" cellpadding="5">
                   <tr>
                     <td><img height="10" src="student_hangban_new.gif" width="10"> 意大利 <a href="student_hangban_list.asp?cityid=&#31859;&#20848;">米兰 </a><a href="student_hangban_list.asp?cityid=&#32599;&#39532;">罗马 </a></td>
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