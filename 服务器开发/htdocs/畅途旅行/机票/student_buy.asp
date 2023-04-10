<!--#include file="inc/conn.asp"-->
<%
id=request("id")
set rs=server.CreateObject("adodb.recordset")
sql="select * from student where id="&id&""
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
/*以上用于email*/
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
                alert("请填写姓名!");
                document.regform.name.focus();
                return;
        }



	if (document.regform.phone.value == "")
        {
                alert("请填写联系电话!");
                document.regform.phone.focus();
                return;
        }


	if (document.regform.address.value == "")
        {
                alert("请填写送票地址!");
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
BODY {FONT-FAMILY: 宋体; FONT-SIZE: 9pt}
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
            <td width="16%" height="31" align="center"><strong><font color="#FFFFFF">目的地</font></strong></td>
            <td width="14%" height="31" align="center"><strong><font color="#FFFFFF">机场</font></strong></td>
            <td width="16%" height="31" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">航空公司</font></strong></td>
            <td width="12%" align="center" bgcolor="#ECB100"><strong><font color="#FFFFFF">出发时间</font></strong></td>
            <td width="12%" height="31" align="center"><strong><font color="#FFFFFF">到达时间</font></strong></td>
            <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">全价</font></strong></td>
            <td width="15%" height="31" align="center"><strong><font color="#FFFFFF">特价</font></strong></td>
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
        </table></td>
    </tr>
    <tr>
      <td width="100%">
      </td>
    </tr>
    <tr>
      <td width="100%" height="10">
      <form method="POST"  action="student_buy_people.asp" name="regform">
        <div align="center">
            <table border="1" cellspacing="0" width="500" bordercolorlight="#CA9800" bordercolordark="#FFFFFF" cellpadding="5">
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">订票联系人姓名</td>
                <td width="152" bgcolor="#FFF5D7"> 
                  <div align="left">
                    <input type="text" name="name" size="11" onKeyPress="return keysubmit()">
                <font color="#FF0000"> (必填）</font></div>                </td>
                <td width="28"> 
                <div align="center">性别</div>                </td>
                <td width="250"> 男 
                  <input name="sex" type="radio" value="男" checked>
                  女 
                <input name="sex" type="radio" value="女">                </td>
              </tr>
              <tr> 
                <td align="center" width="99">旅客人数</td>
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
                <font color="#FF0000">(必填）</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">出发日期</td>
                <td colspan="3"> 
                  <FONT size=2>
                  <SELECT name=GoDateYear>
                    <OPTION 
                          value=2003 selected>2003</OPTION>
                    <OPTION 
                          value=2004>2004</OPTION>
                    <OPTION 
                          value=2005>2005</OPTION>
                    <OPTION 
                          value=2006>2006</OPTION>
                    <OPTION 
                          value=2007>2007</OPTION>
                    <OPTION 
                          value=2008>2008</OPTION>
                  </SELECT>
年
<SELECT 
                        name=GoDateMonth>
  <OPTION value=01 
                          selected>01</OPTION>
  <OPTION value=02>02</OPTION>
  <OPTION value=03>03</OPTION>
  <OPTION 
                          value=04>04</OPTION>
  <OPTION value=05>05</OPTION>
  <OPTION value=06>06</OPTION>
  <OPTION 
                          value=07>07</OPTION>
  <OPTION value=08>08</OPTION>
  <OPTION value=09>09</OPTION>
  <OPTION 
                          value=10>10</OPTION>
  <OPTION value=11>11</OPTION>
  <OPTION value=12>12</OPTION>
</SELECT>
月
<SELECT 
                        name=GoDateDay>
  <OPTION value=01 selected>01</OPTION>
  <OPTION value=02>02</OPTION>
  <OPTION 
                          value=03>03</OPTION>
  <OPTION value=04>04</OPTION>
  <OPTION value=05>05</OPTION>
  <OPTION 
                          value=06>06</OPTION>
  <OPTION value=07>07</OPTION>
  <OPTION value=08>08</OPTION>
  <OPTION 
                          value=09>09</OPTION>
  <OPTION value=10>10</OPTION>
  <OPTION value=11>11</OPTION>
  <OPTION 
                          value=12>12</OPTION>
  <OPTION value=13>13</OPTION>
  <OPTION value=14>14</OPTION>
  <OPTION 
                          value=15>15</OPTION>
  <OPTION value=16>16</OPTION>
  <OPTION value=17>17</OPTION>
  <OPTION 
                          value=18>18</OPTION>
  <OPTION value=19>19</OPTION>
  <OPTION value=20>20</OPTION>
  <OPTION 
                          value=21>21</OPTION>
  <OPTION value=22>22</OPTION>
  <OPTION value=23>23</OPTION>
  <OPTION 
                          value=24>24</OPTION>
  <OPTION value=25>25</OPTION>
  <OPTION value=26>26</OPTION>
  <OPTION 
                          value=27>27</OPTION>
  <OPTION value=28>28</OPTION>
  <OPTION value=29>29</OPTION>
  <OPTION 
                          value=30>30</OPTION>
  <OPTION 
                        value=31>31</OPTION>
</SELECT>
日</FONT><font color="#FF0000">(必填）</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7">
                <td width="99" align="center">返回日期</td>
                <td colspan="3"><FONT size=2>
<input type="text" name="backDate">
日</FONT><font color="#FF0000">(往返必填）(格式：2004-10-02)</font></td>
              </tr>
              <tr> 
                <td width="99" align="center">手机号码</td>
                <td colspan="3"> 
                  <input type="text" name="people_number" size="24">
                  <font color="#FF0000">(必填）</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">固定电话</td>
                <td colspan="3"> 
                  <input type="text" name="phone" size="28" onKeyPress="return keysubmit()">
                <font color="#FF0000">(必填）</font> </td>
              </tr>
              <tr> 
                <td width="99" align="center">送票地址</td>
                <td colspan="3"> 
                  <input type="text" name="address" size="52" onKeyPress="return keysubmit()">
                  <font color="#FF0000">(必填）</font> </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td width="99" align="center">E-mail</td>
                <td colspan="3"> 
                <input type="text" name="email" size="28">                </td>
              </tr>
              <tr> 
                <td width="99" align="center">QQ</td>
                <td colspan="3"> 
                  <input type="text" name="qq" size="28">
                </td>
              </tr>
              <tr> 
                <td width="99" align="center">备注</td>
                <td colspan="3"> 
                  <textarea rows="5" name="more" cols="51"></textarea>
                </td>
              </tr>
              <tr bgcolor="#FFF5D7"> 
                <td colspan="4"> 
                <p align="center"><a href="javascript:validate()"><font color="#000000">[下一步]</font></a></p>                </td>
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
