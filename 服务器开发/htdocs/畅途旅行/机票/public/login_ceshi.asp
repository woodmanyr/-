<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/common1.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-登陆</title>
</head>

<BODY background="../images/bg.jpg" topmargin="0" onLoad="MM_preloadImages('../images/vip1_2.gif','../images/vip2_2.gif','../images/vip3_2.gif','../images/vip4_2.gif')">
<CENTER>
  <table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td height="321" valign="middle" bgcolor="#FFFFFF"> 
        <div align="center">
          <form action="./login.asp" method="post">
            <table width="290" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
              <tr> 
                <td width="282" height="29" align="center" valign="middle" bgcolor="#CCCCCC"><strong>登 
                  陆</strong></td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">用户名: 
                  <input name="user_name" type="text" id="user_name" value="" size="18">
                </td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7">密 
                  码 : 
                  <input name="user_pass" type="password" id="user_pass" value="" size="18">
                </td>
              </tr>
              <tr> 
                <td height="30" align="center" valign="middle" bgcolor="#F7F7F7"> 
                  <input type="hidden" name="login" value="login">
                  <input class=button type="submit" name="Submit2" value=" 登 陆 ">
                </td>
              </tr>
              <%
		  if request("login")="login" then
		  user_name=trim(request("user_name"))
          user_pass=trim(request("user_pass"))
          if user_name<>"" then
set rs=server.createobject("adodb.recordset")
rs.open "select * from user where user_name='"&user_name&"'",conn,1,3
	if rs.bof and rs.eof then
response.write"<tr><td height='30' align='center' valign='middle' bgcolor='#F7F7F7'><font color=red>你输入的信息有误!请重新输入</font></td></tr>"
else
if rs("user_name")=user_name and rs("user_pass")=user_pass then
session("user_name")=rs("user_name")
session("user_pass")=rs("user_pass")
session("user_id")=rs("user_id")
session("user_group_id")=rs("user_group_id")
user_dl=rs("user_dl")
rs("user_dl")=user_dl+1
rs.update
if rs("user_group_id")=config(8) or rs("user_group_id")=3 then
Response.Redirect("./chang.asp")
else
Response.Redirect("../user/")
rs.close
set rs=nothing
conn.close
set conn=nothing
end if
else
response.write"<tr><td height='30' align='center' valign='middle' bgcolor='#F7F7F7'><font color=red>你输入的信息有误!请重新输入</font></td></tr>"
end if 
end if
end if
end if
%>
            </table>
          </form>
        </div>
      </td>
    </tr>
  </table>
<table width="80%" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="576" valign="top" bgcolor="#FFFFFF">
        <table width="100%" height="28" border=0 align=center cellpadding=0 cellspacing=0>
          <tbody> 
          <tr> 
            <td height="25" bgcolor="#BDC7D6" class=chinese>&nbsp; <img src="../images/arr1.gif" width=26 
            height=13 border="0" align=absMiddle> <a href="../index.asp">首 页</a> 
              <img src="../images/square_topmenu.gif" width="6" height="9"> <a href="./index.asp"><font color="#FF0000">会员专区</font></a> 
            </td>
          </tr>
          </tbody> 
        </table>
        <p>&nbsp;</p>
      </td>
      <td width="199" valign="top" bgcolor="#FFFFFF"> 
        <table width="23%" border=0 align=center cellpadding=0 cellspacing=0 bgcolor=#ffffff>
          <tr> 
            <td align=middle valign=top> 
              <script language=JavaScript type=text/JavaScript>
<!--
function MM_swapImgRestore() { //v3.0
  var i,x,a=document.MM_sr; for(i=0;a&&i<a.length&&(x=a[i])&&x.oSrc;i++) x.src=x.oSrc;
}

function MM_preloadImages() { //v3.0
  var d=document; if(d.images){ if(!d.MM_p) d.MM_p=new Array();
    var i,j=d.MM_p.length,a=MM_preloadImages.arguments; for(i=0; i<a.length; i++)
    if (a[i].indexOf("#")!=0){ d.MM_p[j]=new Image; d.MM_p[j++].src=a[i];}}
}

function MM_findObj(n, d) { //v4.01
  var p,i,x;  if(!d) d=document; if((p=n.indexOf("?"))>0&&parent.frames.length) {
    d=parent.frames[n.substring(p+1)].document; n=n.substring(0,p);}
  if(!(x=d[n])&&d.all) x=d.all[n]; for (i=0;!x&&i<d.forms.length;i++) x=d.forms[i][n];
  for(i=0;!x&&d.layers&&i<d.layers.length;i++) x=MM_findObj(n,d.layers[i].document);
  if(!x && d.getElementById) x=d.getElementById(n); return x;
}

function MM_swapImage() { //v3.0
  var i,j=0,x,a=MM_swapImage.arguments; document.MM_sr=new Array; for(i=0;i<(a.length-2);i+=3)
   if ((x=MM_findObj(a[i]))!=null){document.MM_sr[j++]=x; if(!x.oSrc) x.oSrc=x.src; x.src=a[i+2];}
}
//-->
</script>
              <table border=0 cellpadding=0 cellspacing=1 class=chinese width=180>
                <tbody> 
                <tr> 
                  <td><a href="./edit.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image14','','../images/vip1_2.gif',1)"><img 
            border=0 name=Image14 src="../images/vip1_1.gif" 
            osrc="../images/vip1_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="./look.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image15','','../images/vip2_2.gif',1)"><img 
            border=0 name=Image15 src="../images/vip2_1.gif" 
            osrc="../images/vip2_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="./money.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image16','','../images/vip3_2.gif',1)"><img 
            border=0 name=Image16 src="../images/vip3_1.gif" 
            osrc="../images/vip3_1.gif"></a></td>
                </tr>
                <tr> 
                  <td><a href="../public/logout.asp" 
            onMouseOut=MM_swapImgRestore() 
            onMouseOver="MM_swapImage('Image17','','../images/vip4_2.gif',1)"><img 
            border=0 name=Image17 src="../images/vip4_1.gif" 
            osrc="../images/vip4_1.gif"></a></td>
                </tr>
                <tr> 
                  <td></td>
                </tr>
                </tbody> 
              </table>
              <br>
              <table border=0 cellpadding=0 cellspacing=0 width=180>
                <tbody> 
                <tr> 
                  <td background=../images/dotlineh.gif height=1></td>
                </tr>
                <tr> 
                  <td></td>
                </tr>
                <tr> 
                  <td><img border=0 height=25 src="../images/wzss.gif" 
        width=180></td>
                </tr>
                </tbody> 
              </table>
              <form action="../public/search_list.asp" method=post name=form2>
                <table border=0 cellpadding=0 cellspacing=0 width=180>
                  <tbody> 
                  <tr> 
                    <td align=middle> 
                      <input class=textarea name="news_title">
                      <br>
                      <input class=button name=search type=submit value=" 搜索 ">
                      <a href="../public/search.asp">高级搜索</a> </td>
                  </tr>
                  </tbody> 
                </table>
              </form>
              <br>
            </td>
          </tr>
          <tbody> </tbody> 
        </table>
      </td>
    </tr>
  </table>
</CENTER>
</body>
</html>