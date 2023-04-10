<style type=text/css>
body  { background:#799AE1; margin:0px; font:9pt 宋体; }
table  { border:0px; }
td  { font:normal 12px 宋体; }
img  { vertical-align:bottom; border:0px; }
a  { font:normal 12px 宋体; color:#000000; text-decoration:none; }
a:hover  { color:#428EFF;text-decoration:underline; }
.sec_menu  { border-left:1px solid white; border-right:1px solid white; border-bottom:1px solid white; overflow:hidden; background:#D6DFF7; }
.menu_title  { }
.menu_title span  { position:relative; top:2px; left:8px; color:#215DC6; font-weight:bold; }
.menu_title2  { }
.menu_title2 span  { position:relative; top:2px; left:8px; color:#428EFF; font-weight:bold; }
</style>
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<SCRIPT language=javascript1.2>
function showsubmenu(sid)
{
whichEl = eval("submenu" + sid);
if (whichEl.style.display == "none")
{
eval("submenu" + sid + ".style.display=\"\";");
}
else
{
eval("submenu" + sid + ".style.display=\"none\";");
}
}
</SCRIPT>

<link href="../inc/css1.css" rel="stylesheet" type="text/css">
<BODY leftmargin="0" topmargin="0" marginheight="0" marginwidth="0">
<tr><td valign=top>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=42 valign=bottom> <img src="images/title.gif" width=158 height=38> 
        </td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background=images/title_bg_quit.gif  > 
          <span><a href="../index.asp" target=_top><b>返回首页</b></a></span></td>
  </tr>
</table>
<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_1.gif" id=menuTitle1 onClick="showsubmenu(0)"> 
          <b><font color="#3366CC">首选服务</font></b></td>
  </tr>
  <tr>
    <td style="display:" id='submenu0'>
<div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href="logout.asp" target="_top">注销登陆</a></td>
              </tr>
            </table>
	  </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(1)"> 
          <b>网站版块管理</b></td>
  </tr>
  <tr>
    <td style="display:" id='submenu1'>
<div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href="guonei_address.asp" target="right">国内城市管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guonei_company.asp" target="right">国内航空公司管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_area.asp" target="right">国际大州管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_country.asp" target="right">国际国家管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_address.asp" target="right">国际城市管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_company.asp" target="right">国际航空公司管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="huoche_company.asp" target="right">火车类型管理</a></td>
              </tr>
            </table>
	  </div>
<div  style="width:158">

<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>

    <table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr> 
        <td height=25 class=menu_title onmouseover=this.className='menu_title3'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(3)"> 
          <b>订房信息管理</b></td>
      </tr>
      <tr> 
        <td style="display:" id='submenu3'> <div class=sec_menu style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
       
              <tr> 
                <td height=20><a href="dingfang.asp" target="right"><span class="menu_title"><strong><b>订房信息管理</b></strong></span></a></td>
              </tr>         
            </table>
          </div>
          <div  style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                <td height=20></td>
              </tr>
            </table>
          </div></td>
      </tr>
    </table>
	
    <table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title3'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(3)"><b>网站信息管理</b></td>
      </tr>
      <tr>
        <td style="display:" id='submenu3'><div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                <td height=20><a href="changshi.asp" target="right"><span class="menu_title"><strong>机票常识管理</strong></span></a></td>
              </tr>
            </table>
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href="stu.asp" target="right">学生特价管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="gg.asp" target="right">网站公告管理</a></td>
              </tr>
              <tr> 
                <!--<td height=20><a href="server.asp" target="right">机票常识管理</a></td>-->
              </tr>
              <tr> 
                <td height=20><a href="news.asp" target="right">最新信息管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="qita.asp" target="right">其他信息管理</a></td>
              </tr>
            </table>
          </div>
            <div  style="width:158">
              <table cellpadding=0 cellspacing=0 align=center width=135>
                <tr>
                  <td height=20></td>
                </tr>
              </table>
          </div></td>
      </tr>
    </table>
    <table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr> 
        <td height=25 class=menu_title onmouseover=this.className='menu_title4'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(4)"> 
          <strong>机票管理</strong></td>
      </tr>
      <tr> 
        <td style="display:" id='submenu4'> <div class=sec_menu style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href="guonei_hangban.asp" target="right">国内航班管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_hangban.asp" target="right">国际航班管理</a></td>
              </tr>
              <tr> 
                <td height=20><a href="stu.asp" target="right"><strong>特价管理</strong></a></td>
              </tr>
              <tr> 
                <td height=20><a href="huoche_hangban.asp" target="right">火 车 
                  票管理</a></td>
              </tr>
            </table>
          </div>
          <div  style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                <td height=20></td>
              </tr>
            </table>
          </div></td>
      </tr>
    </table>
    <table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title41'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(41)"> <strong>旅游管理</strong></td>
      </tr>
      <tr>
        <td style="display:" id='submenu41'>
          <div class=sec_menu style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                <td height=20><a href="trip.asp" target="right">旅游路线管理</a></td>
              </tr> 
            </table>
          </div>
          <div  style="width:158">
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr>
                <td height=20></td>
              </tr>
            </table>
        </div></td>
      </tr>
    </table>
    <table cellpadding=0 cellspacing=0 width=158 align=center>
      <tr> 
        <td height=25 class=menu_title onmouseover=this.className='menu_title5'; onmouseout=this.className='menu_title'; background="images/admin_left_2.gif" id=menuTitle1 onClick="showsubmenu(5)"> 
          <strong>订购管理</strong> </td>
      </tr>
      <tr> 
        <td style="display:" id='submenu5'> <div class=sec_menu style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20><a href="guonei_dinggou.asp?url=guonei" target="right">国内航班订购管理</a> 
                </td>
              </tr>
              <tr> 
                <td height=20><a href="guoji_dinggou.asp?url=guoji" target="right">国际航班订购管理</a></td>
              </tr>
              <tr>
                <!--<td height=20><a href="student_dinggou.asp?url=guoji" target="right">学生航班订购管理</a></td>-->
              </tr>
              <tr> 
                <td height=20><a href="huoche_dinggou.asp?url=guonei" target="right">火车票订购管理</a></td>
              </tr>
            </table>
          </div>
          <div  style="width:158"> 
            <table cellpadding=0 cellspacing=0 align=center width=135>
              <tr> 
                <td height=20></td>
              </tr>
            </table>
          </div></td>
      </tr>
    </table>
    <table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_3.gif" id=menuTitle1 onClick="showsubmenu(2)"> 
          <span>用户管理</span> </td>
  </tr>
  <tr>
    <td style="display:" id='submenu2'>
<div class=sec_menu style="width:158">
            <table cellpadding=0 cellkpacing=0 align=center width=135>
            
              <tr> 
                <td height=20><a href=manager.asp target=_blank>管理后台用户</a></td>
              </tr>

                <td height=20><a href=../tongji/index.asp?siteid=2 target=_blank>计数统计</a></td>
              </tr>
            </table>
	  </div>
<div  style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=135>
<tr><td height=20></td></tr>
</table>
	  </div>
	</td>
  </tr>
</table>

<table cellpadding=0 cellspacing=0 width=158 align=center>
  <tr>
        <td height=25 class=menu_title onmouseover=this.className='menu_title2'; onmouseout=this.className='menu_title'; background="images/admin_left_9.gif" id=menuTitle1> 
          <span>程序信息</span> </td>
  </tr>
  <tr>
    <td>
<div class=sec_menu style="width:158">
<table cellpadding=0 cellspacing=0 align=center width=135>

<tr><td height=20>&nbsp;<br>
                  <a href="" target=_blank>信息版权所有：</a><a href="http://www.yifanweb.com" target=_blank> 
                  <BR>
                  <center>
                   一凡网络
                  </center>
                  </a> 技术支持：<a href="mailto:yifan19@126.com">周帆</a><BR>
</td></tr>

</table>
	  </div>
	</td>
  </tr>
</table>

