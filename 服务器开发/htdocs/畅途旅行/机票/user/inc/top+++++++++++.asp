  <script language="javascript">	
function GetDate() 
  {
 var week; 
if(new Date().getDay()==0)          week="������"
if(new Date().getDay()==1)          week="����һ"
if(new Date().getDay()==2)          week="���ڶ�"
if(new Date().getDay()==3)          week="������"
if(new Date().getDay()==4)          week="������"
if(new Date().getDay()==5)          week="������"
if(new Date().getDay()==6)          week="������"
myclock=(new Date().getYear()+"��"+(new Date().getMonth()+1)+"��"+new Date().getDate()+"�� "+week);
	liveclock.innerHTML=myclock;

  } 
 window.onload=GetDate;
</script>
<style type="text/css">
<!--
.style1 {font-size: 12px}
-->
</style>

<link href="css.css" rel="stylesheet" type="text/css">
<style type="text/css">
<!--
a:link {
	text-decoration: none;
}
a:visited {
	text-decoration: none;
}
a:hover {
	text-decoration: none;
	color: #000000;
}
a:active {
	text-decoration: none;
	color: #000000;
}
-->
</style>
<link href="hht.css" rel="stylesheet" type="text/css">
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="766" id="table1">
    <tr>
      <td valign="top">
        <div align="center">
          <table border="0" cellpadding="0" cellspacing="0" width="100%" id="table3">
            <tr> 
              <td valign="middle"><object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=6,0,29,0" width="766" height="130">
                <param name="movie" value="images/flash/qq.swf">
                <param name="quality" value="high">
                <embed src="images/flash/qq.swf" quality="high" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" width="766" height="130"></embed>
              </object></td>
            </tr>
          </table>
      </div></td>
    </tr>
  </table>
</div>

<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="766" id="table5">
    <tr>
      <td width="70" height="20" background="images/ee.gif" class="texttitle" ><div align="center"><a href="index.asp" class="texttitle">��ҳ</a></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="guoji_hangban_list1.asp" class="texttitle">���ʻ�Ʊ</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="guonei_hangban_list1.asp" class="texttitle">���ڻ�Ʊ</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="trip.asp" class="texttitle">����</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="dingfang.asp" class="texttitle">����</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="student_index.asp" class="texttitle">�ؼ���Ϣ</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="server_index.asp" class="texttitle">��Ʊ��ʶ</a></span></div></td>
      <td width="70" height="20" background="images/cc.gif" class="texttitle"><div align="center"><span class="style1"><a href="contact.asp" class="texttitle">��ϵ����</a></span></div></td>
      <td height="20" align="center">&nbsp;<span style="font-size:9pt" id=liveclock></span></td>
    </tr>
  </table>
</div>
<div align="center">
  <table border="0" cellpadding="0" cellspacing="0" width="766" id="table6" height="18">
    <tr bgcolor="#5F9D3D">
      <td width="10"> <p align="left"></td>
      <td width="764" align="right" valign="bottom">
 
      </td>
    </tr>
  </table>
</div>
 

