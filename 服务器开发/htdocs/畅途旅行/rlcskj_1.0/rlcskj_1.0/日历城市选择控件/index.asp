<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title>�����ɻ�Ʊ,�����ؼ�,���пؼ�</title>
<meta name="keywords" content="�����ɻ�Ʊ,�����ؼ�,���пؼ�" />
<meta name="description" content="�����ɻ�Ʊ,�����ؼ�,���пؼ�" />
<META http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<link href="Css/Style.css" rel="stylesheet" type="text/css" />
<!--[if lte IE 6]>
<link type="text/css" rel="stylesheet" href="Css/calendarIE6.css" >
<![endif]--> 
<!--[if gte IE 7]>
<link type="text/css" rel="stylesheet" href="Css/calendar.css" >
<![endif]--> 
<![if !IE]> 
<link type="text/css" rel="stylesheet" href="Css/calendar.css" >
<![endif]>
<script type="text/javascript" src="Javascript/calendar.js" ></script>  
<script type="text/javascript" src="Javascript/calendar-zh.js" ></script>
<script type="text/javascript" src="Javascript/calendar-setup.js"></script>
<script type="text/javascript" src="Javascript/ShouHu.js"></script>
</head>

<body>
<div id="Head">
  <div id="TicketHead">
    <div id="JpLeft">
      <div id="JpLeftTop">���ڻ�Ʊ</div>
      <div id="JpLeftCenter">
        <table width="475" border="0" cellpadding="0" cellspacing="0">
        <form id="myform" name="myform" method="post" action="">
          <tr>
            <td height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;ʽ��</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><input name="radio" type="radio" id="radio" onclick="SHjs('Fly02','Fly01');" value="radio" checked="checked" />
            ����
              <input type="radio" name="radio" id="radio2" value="radio" onclick="SHjs('Fly01','Fly02');" />
            ����</td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;����</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><input type="text" name="textfield" id="textfield" class="JpText" /></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>���֤��</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><input type="text" name="textfield2" id="textfield2" class="JpText" /></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;����</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><input type="text" name="textfield3" id="textfield3" class="JpText" /></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;�Σ�</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><input type="text" name="textfield6" id="textfield6" class="JpText" /></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;�У�</strong></td>
            <td width="40" height="35" align="center" valign="middle">��</td>
            <td width="160" height="35" align="left" valign="middle"><div id="JpDate"><dl>
              <dt style="float:left"><input type="text" id="Ctiy01" name="Ctiy01" class="JpTextDate" onblur="return CityClose('apDiv1');" /></dt>
              <dd style="float:left"><img src="Img/QN1CS2.gif" width="16" height="13" onclick="return City('apDiv1','Ctiy01');"/></dd>
            </dl></div></td>
            <td width="40" height="35" align="center" valign="middle">��</td>
            <td width="180" height="35" align="left" valign="middle"><div id="JpDate"><dl>
              <dt style="float:left"><input type="text" id="Ctiy02" name="Ctiy02" class="JpTextDate" onblur="return CityClose('apDiv2');" /></dt>
              <dd style="float:left"><img src="Img/QN1CS2.gif" width="16" height="13" onclick="return City('apDiv2','Ctiy02');"/></dd>
            </dl></div></td>

          </tr>
          <tr>
            <td height="70" colspan="5">
            <!---->
            <table width="475" border="0" cellpadding="0" cellspacing="0" id="Fly01">
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;�ڣ�</strong></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="left" valign="middle"><div id="JpDate"><dl>
              <dt style="float:left"><input type="text" id="EntTime" name="EntTime" class="JpTextDate" /></dt>
              <dd style="float:left"><img src="Img/QN1CS1.gif" width="16" height="13" onclick="return showCalendar('EntTime', 'y-mm-dd');"/></dd>
            </dl></div></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="160" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="left" valign="middle"><input type="image" name="imageField2" id="imageField2" src="Img/Jpbg.gif" /></td>
          </tr>
            </table>
            <!---->
          <table width="475" border="0" cellpadding="0" cellspacing="0" id="Fly02" style="display:none">
          <tr>
            <td width="55" height="35" align="right" valign="middle"><strong>��&nbsp;&nbsp;�ڣ�</strong></td>
            <td width="40" height="35" align="center" valign="middle">��</td>
            <td width="160" height="35" align="left" valign="middle"><div id="JpDate"><dl>
              <dt style="float:left"><input type="text" id="EntTime01" name="EntTime01" class="JpTextDate" /></dt>
              <dd style="float:left"><img src="Img/QN1CS1.gif" width="16" height="13" onclick="return showCalendar('EntTime01', 'y-mm-dd');"/></dd>
            </dl></div></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="center" valign="middle">&nbsp;</td>
          </tr>
          <tr>
            <td width="55" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="40" height="35" align="center" valign="middle">��</td>
            <td width="160" height="35" align="left" valign="middle"><div id="JpDate"><dl>
              <dt style="float:left"><input type="text" id="EntTime02" name="EntTime02" class="JpTextDate" /></dt>
              <dd style="float:left"><img src="Img/QN1CS1.gif" width="16" height="13" onclick="return showCalendar('EntTime02', 'y-mm-dd');"/></dd>
            </dl></div></td>
            <td width="40" height="35" align="center" valign="middle">&nbsp;</td>
            <td width="180" height="35" align="left" valign="middle"><input type="image" name="imageField2" id="imageField2" src="Img/Jpbg.gif" /></td>
          </tr>
            </table>
            <!---->
            </td>
          </tr>
          </form>
        </table>
        <div id="apDiv1"><script language="javascript">SetCity01('Ctiy01','apDiv1','True');</script></div>
        <div id="apDiv2"><script language="javascript">SetCity01('Ctiy02','apDiv2','False');</script></div>
      </div>
      <div id="JpLeftBottom"></div>
    </div>
    <div id="JpRight">
      <div id="JpRightTop">����&middot;�۰�̨��Ʊ</div>
      <div id="JpRightCenter">������Ϣ</div>
      <div id="JpRightBottom"></div>
    </div>
  </div>
</div>