<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="inc/conn.asp"-->
<!--#include file="cf.asp"-->
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from holiday where id="&id&""
rs.Open sql,conn,3,2
%>

<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<meta name="ProgId" content="FrontPage.Editor.Document">
<script language="javascript">
function MakeArray(n)
{
	this.length = n
	for (var i = 1; i <= n; i++) 
		this[i] = 0 
	return this
}
function isnumber(c)
{
	if ((c>='0') && (c<='9'))
		return true;
	else
		return false;
}
function ischar(c)
{
	if (((c>='a') && (c<='z')) || ((c>='A') && (c<='Z')))
		return true;
	else
		return false;
}
/*��������email*/
function checknumber(s)
{
	for (i=0; i<s.length; i++)
	{
		n = s.substr(i, 1)
		if (!(isnumber(n)))
		{
			return false;
		}
	}
	return true;
}
function checkphone(s)
{
        for (i=0; i<s.length; i++)
        {
                n = s.substr(i, 1)
                if ( !(isnumber(n) || n=='-'))
                {
                        return false;
                }
        }
        return true;
}

function checkemail(s)
{
	var nAtPos;
	nAtPos = 0;
        for (i=0; i<s.length; i++)
        {
                n = s.substr(i, 1)
                if (!(isnumber(n)||ischar(n)||n=='_'||n=='.'||n=='@'||n=='-'))
                {
                	return false;
                }
                if ( n == '@')
                {
                	nAtPos = i;
                }
        }
        
        if ((nAtPos == 0) || (nAtPos == s.length-1))
        {
        	return false;
        }
        else
        {
        	return true;
        }
}

function validateDay(yearStr, monthStr, dayStr)
{
        var yearInt = parseInt(yearStr);
	var monthInt = parseInt(monthStr) - 1;
        var dayInt = parseInt(dayStr);
	if (monthInt > 11)
	{
		return false;
	}
        monthDays = new MakeArray(12)
        monthDays [0] = 31;
        monthDays [1] = 28;
        monthDays [2] = 31;
        monthDays [3] = 30;
        monthDays [4] = 31;
        monthDays [5] = 30;
        monthDays [6] = 31;
        monthDays [7] = 31;
        monthDays [8] = 30;
        monthDays [9] = 31;
        monthDays [10] = 30;
        monthDays [11] = 31;

        if (yearInt % 100 == 0)
        {
          if (yearInt % 400 == 0)
          {
            monthDays[1] = 29;
          }
        }
        else
        {
          if (yearInt % 4 == 0)
          {
            monthDays[1] = 29;
          }
        }

        if (dayInt > monthDays[monthInt])
        {
          return false;
        }
        return true;
}
var Date1=new Date()
var TimeLast=Date1.getYear()


MSIEIndex = navigator.userAgent.indexOf("MSIE");
ns = ((MSIEIndex) == -1);
if (ns) 
{
	document.onkeypress = keysubmit;
	document.captureEvents(Event.KEYPRESS);
}

function validate()
{
	if (document.regform.name.value == "")
        {
                alert("����д����!");
                document.regform.name.focus();
                return;
        }



	if (document.regform.phone.value == "")
        {
                alert("����д��ϵ�绰!");
                document.regform.phone.focus();
                return;
        }


	if (document.regform.address.value == "")
        {
                alert("����д��Ʊ��ַ!");
                document.regform.address.focus();
                return;
        }
 

        document.regform.submit();
}

        
function keysubmit(e)
{
	if (ns)
	{
		if (e.which == 13){validate();}
	}
	else
	{
		if (event.keyCode == 13){validate();}
	}
}


</script>


<style type="text/css">
A:link {COLOR: blue; TEXT-DECORATION: none}
A:visited {COLOR: red;TEXT-DECORATION: none}
A:active {COLOR: red; TEXT-DECORATION: none}
A:hover {COLOR: #ff0000; TEXT-DECORATION: none}
A:hover {color:#ff0000;}
a:link.a01 {text-decoration:none;color:#FFFFFF;}
a:visited.a01 {text-decoration:none;color:#FFFFFF;}
a:active.a01 {text-decoration:none;color:#FFFFFF;}
a:hover.a01 {text-decoration:none;color:#505050;}
BODY {FONT-FAMILY: ����; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.l15{line-height:150%}
</style>
<title><%=site_name%></title>
</head>

<body topmargin="0" leftmargin="0">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="500">
    <tr>
      <td width="100%">

<table width="500" height="57" border="1" align="center" cellpadding="0" cellspacing="0" bordercolorlight="#CA9800" bordercolordark="#FFFFFF">
              
              
              


          
              
                <tr bgcolor="#ECB100">
                  <td width="16%" height="31" align="center"><strong><font color="#FFFFFF">Ŀ�ĵ�</font></strong></td>
                  <td width="14%" height="31" align="center"><strong><font color="#FFFFFF">����</font></strong></td>
                  <td width="16%" height="31" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">���չ�˾</font></strong></td>
                  <td width="12%" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">����ʱ��</font></strong></td>
                  <td width="12%" height="31" align="center"><strong><font color="#FFFFFF">����ʱ��</font></strong></td>
                  <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">ȫ��</font></strong></td>
                  <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">�ؼ�</font></strong></td>
                </tr>
                
                
               
                <tr>
                  <td width="16%" height="18" align="center"><%=rs("address")%></td>
                  <td width="14%" height="18" align="center"><%=rs("plane")%></td>
                  <td width="16%" height="18" align="center"><%=rs("company")%></td>
                  <td width="12%" height="18" align="center"><%=rs("fromtime")%></td>
                  <td height="18" align="center"><%=rs("totime")%></td>
                  <td width="15%" height="18" align="center"><%=rs("price")%></td>
                  <td width="15%" height="18" align="center"><font color="#FF0000"><%=rs("minprice")%></font></td>
                </tr>



</table>


      </td>
    </tr>
    <tr>
      <td width="100%">
      </td>
    </tr>
    <tr>
      <td width="100%" height="10">
      <form method="POST"  action="guonei_buy_people.asp" name="regform">
          <div align="center"> 
            
<!--#include file="conn.asp"-->
<!--#include file="./inc/config.asp"-->

<!--#include file="./public/user.asp"--><%
edit=trim(request("user_edit"))
if edit="save" then
set rs1=Server.CreateObject("Adodb.Recordset")
rs1.open "Select * from user where user_id="&trim(request("user_id")),conn,1,1
if rs1.eof then
response.write"<script>alert('�Բ������û����ϣ�������ѡ��');history.back();</script>"
response.end
else if trim(request("user_mail"))="" or trim(request("user_bd"))="" then 
response.write"<script>alert('��û����д��������Ϣ,�뷵����д');history.back();</script>"
response.end
else
set rs=Server.CreateObject("Adodb.Recordset")
	rs.open "Select * from user where user_id="&trim(request("user_id")),conn,1,3
	'������Ϣ
			if trim(request("user_pass"))<>"" then rs("user_pass")=trim(request("user_pass"))
			if trim(request("user_passts"))<>"" then rs("user_passts")=trim(request("user_passts"))
			if trim(request("user_passda"))<>"" then rs("user_passda")=trim(request("user_passda"))
			rs("user_mail")=trim(request("user_mail"))
			rs("user_bd")=trim(request("user_bd"))
			'ѡ����Ϣ
			if trim(request("user_sex"))<>"" then rs("user_sex")=trim(request("user_sex"))
			if trim(request("user_oicq"))<>"" then rs("user_oicq")=trim(request("user_oicq"))
			if trim(request("user_url"))<>"" then rs("user_url")=trim(request("user_url"))
			if trim(request("user_sf"))<>"" then rs("user_sf")=trim(request("user_sf"))
			if trim(request("user_xm"))<>"" then rs("user_xm")=trim(request("user_xm"))
		    if trim(request("user_dz"))<>"" then rs("user_dz")=trim(request("user_dz"))
		    if trim(request("user_yb"))<>"" then rs("user_yb")=trim(request("user_yb"))
		 			rs.update
response.write "<script>alert('�û������޸ĳɹ���');location.href='index.asp';</Script>"
  Response.End
  rs.close

end if
end if
end if
%><table border="1" cellspacing="0" width="500" bordercolorlight="#CA9800" bordercolordark="#FFFFFF" cellpadding="5">
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">��Ʊ��ϵ������</td>
                <td width="152" bgcolor="#FFF5D7"> 
                  <div align="left"> 
                    <input type="text" name="name" size="11" value="<%=user(2)%>" onKeyPress="return keysubmit()">
                    <font color="#FF0000"> (���</font></div>
                </td>
                <td width="28"> 
                  <div align="center">�Ա�</div>
                </td>
                <td width="250"> �� 
                  <input name="sex" type="radio" value="��" checked>
                  Ů 
                  <input name="sex" type="radio" value="Ů">
                </td>
              </tr>
              <tr> 
                <td align="center" width="99">�ÿ�����</td>
                <td colspan="3"> 
                  <select size="1" name="number">
                    <option value="1" selected>1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                  </select>
                  <font color="#FF0000">(���</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">��������</td>
                <td colspan="3"> <font size=2> 
                  <select name=GoDateYear>
                    <option 
                          value=2003 selected>2003</option>
                    <option 
                          value=2004>2004</option>
                    <option 
                          value=2005>2005</option>
                    <option 
                          value=2006>2006</option>
                    <option 
                          value=2007>2007</option>
                    <option 
                          value=2008>2008</option>
                  </select>
                  �� 
                  <select 
                        name=GoDateMonth>
                    <option value=01 
                          selected>01</option>
                    <option value=02>02</option>
                    <option value=03>03</option>
                    <option 
                          value=04>04</option>
                    <option value=05>05</option>
                    <option value=06>06</option>
                    <option 
                          value=07>07</option>
                    <option value=08>08</option>
                    <option value=09>09</option>
                    <option 
                          value=10>10</option>
                    <option value=11>11</option>
                    <option value=12>12</option>
                  </select>
                  �� 
                  <select 
                        name=GoDateDay>
                    <option value=01 selected>01</option>
                    <option value=02>02</option>
                    <option 
                          value=03>03</option>
                    <option value=04>04</option>
                    <option value=05>05</option>
                    <option 
                          value=06>06</option>
                    <option value=07>07</option>
                    <option value=08>08</option>
                    <option 
                          value=09>09</option>
                    <option value=10>10</option>
                    <option value=11>11</option>
                    <option 
                          value=12>12</option>
                    <option value=13>13</option>
                    <option value=14>14</option>
                    <option 
                          value=15>15</option>
                    <option value=16>16</option>
                    <option value=17>17</option>
                    <option 
                          value=18>18</option>
                    <option value=19>19</option>
                    <option value=20>20</option>
                    <option 
                          value=21>21</option>
                    <option value=22>22</option>
                    <option value=23>23</option>
                    <option 
                          value=24>24</option>
                    <option value=25>25</option>
                    <option value=26>26</option>
                    <option 
                          value=27>27</option>
                    <option value=28>28</option>
                    <option value=29>29</option>
                    <option 
                          value=30>30</option>
                    <option 
                        value=31>31</option>
                  </select>
                  ��</font><font color="#FF0000">(���</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">��������</td>
                <td colspan="3"><font size=2> 
                  <input type="text" name="backDate">
                  ��</font><font color="#FF0000">(�������(��ʽ��2004-10-02)</font></td>
              </tr>
              <tr> 
                <td width="99" align="center">�ֻ�����</td>
                <td colspan="3"> 
                  <input type="text" name="people_number" size="24" value="<%=user(8)%>">
                  <font color="#FF0000">(���</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">�̶��绰</td>
                <td colspan="3"> 
                  <input type="text" name="phone" size="28" value="<%=user(15)%>" onKeyPress="return keysubmit()">
                  <font color="#FF0000">(���</font> </td>
              </tr>
              <tr> 
                <td width="99" align="center">��Ʊ��ַ</td>
                <td colspan="3"> 
                  <input type="text" name="address" size="52" value="<%=user(14)%>" onKeyPress="return keysubmit()">
                  <font color="#FF0000">(���</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">E-mail</td>
                <td colspan="3"> 
                  <input type="text" name="email" size="28"  value="<%=user(7)%>">
                </td>
              </tr>
              <tr> 
                <td width="99" align="center">QQ</td>
                <td colspan="3"> 
                  <input type="text" name="qq" size="28" value="<%=user(6)%>" >
                </td>
              </tr>
              <tr> 
                <td width="99" align="center">��ע</td>
                <td colspan="3"> 
                  <textarea rows="5" name="more" cols="51"></textarea>
                </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td colspan="4"> 
                  <p align="center"><a href="javascript:validate()"><font color="#000000">[��һ��]</font></a></p>
                </td>
              </tr>
            </table>
          </div>
        <input type="hidden" name="id" value="<%=id%>">
		<SCRIPT language=JavaScript>
<!--
var today=new Date;
document.regform.GoDateYear.selectedIndex = today.getYear()-2003;
document.regform.GoDateMonth.selectedIndex = today.getMonth();
document.regform.GoDateDay.selectedIndex = today.getDate()-1;
//document.regform.BackDateYear.selectedIndex = today.getYear()-2003;
//document.regform.BackDateMonth.selectedIndex = today.getMonth();
//document.regform.BackDateDay.selectedIndex = today.getDate()-1;
//-->
</SCRIPT>
      </form>
      </td>
    </tr>
    <tr>
      <td width="100%">&nbsp;
      </td>
    </tr>
    <tr>
      <td width="100%" height="10"></td>
    </tr>
  </table>
</div>
</body>
</html>
