<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->

<%
if config(6)=false then
  response.write("<br>"&"<p>")
  Response.Write "<center>本系统目前不提供免费用户注册！</center>"
  response.end
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-填写信息</title>
<script src="../js/Popup.js"></script>
</head>

<BODY background="../images/bg.jpg" topmargin="0">
<CENTER>
<!--#include file="../top_mem.asp"-->
<table cellspacing=0 cellpadding=0 width=760 align=center bgcolor=#ffffff 
border=0>
  <tbody> 
  <tr> 
    <td width=3></td>
    <td valign=top align=middle bgcolor=#ffffff> 
      <p>&nbsp; </p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top" bgcolor="#FFFFFF"><br>
            <div align="center">
              <form action=reg2.asp method=post name=reg>
                <table width="95%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
                  <tr align="center" valign="middle" bgcolor="#CCCCCC"> 
                    <td height="26" colspan="2"> 
                      <div align="center">会员注册--填写资料</div>
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td width="24%" height="26">用户名:</td>
                    <td width="76%" height="26"> 
                      <input name="user_name" type="text" id="user_name">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">密 码 :</td>
                    <td height="26"> 
                      <input name="user_pass" type="password" id="user_pass">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">确认密码:</td>
                    <td height="26"> 
                      <input name="user_passqr" type="password" id="user_passqr">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">密码提示问题:</td>
                    <td height="26"> 
                      <input name="user_passts" type="text" id="user_passts">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">密码提示问题答案:</td>
                    <td height="26"> 
                      <input name="user_passda" type="text" id="user_passda">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">电子邮件地址:</td>
                    <td height="26"> 
                      <input name="user_mail" type="text" id="user_mail">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">出生日期:</td>
                    <td height="26"> 
                      <input name="user_bd" type="text" id="user_bd" size="15">
                      &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_bd, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
                      &lt;- 点这个小图选日期</td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26" colspan="2"><font color="#FF0000">以下为选添信息:</font></td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">真实姓名:</td>
                    <td height="26"> 
                      <input name="user_xm" type="text" id="user_xm">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">性别:</td>
                    <td height="26"> <label> 
                      <input type="radio" name="user_sex" value="0">
                      女</label> <label> 
                      <input type="radio" name="user_sex" value="1">
                      男</label></td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">联系电话:</td>
                    <td height="26"> 
                      <input name="user_url" type="text" id="user_url">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">联系手机:</td>
                    <td height="26"> 
                      <input name="user_url2" type="text" id="user_url2">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">OICQ:</td>
                    <td height="26"> 
                      <input name="user_oicq" type="text" id="user_oicq">
                      必须为数字 </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">MSN:</td>
                    <td height="26"> 
                      <input name="user_msn" type="text" id="user_msn">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">联系地址:</td>
                    <td height="26"> 
                      <input name="user_dz" type="text" id="user_dz" size="40">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">送票地址:</td>
                    <td height="26"> 
                      <input name="user_dz2" type="text" id="user_dz2" size="40">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">省份:</td>
                    <td height="26"> 
                      <input name="user_sf" type="text" id="user_sf">
                    </td>
                  </tr>
                  <tr valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26">邮编:</td>
                    <td height="26"> 
                      <input name="user_yb" type="text" id="user_yb">
                      必须为数字</td>
                  </tr>
                  <tr bgcolor="#f7f7f7"> 
                    <td height="26" colspan="2">&nbsp;</td>
                  </tr>
                  <tr align="center" valign="middle" bgcolor="#f7f7f7"> 
                    <td height="26" colspan="2"> 
                      <div align="center"> 
                        <input type="hidden" name="user_add" value="save">
                        <input type="submit" name="Submit" value=" 添 加 ">
                        &nbsp;&nbsp; 
                        <input type="reset" name="Submit2" value=" 重 填 ">
                      </div>
                    </td>
                  </tr>
                </table>
              </form>
            </div>
          </td>
        </tr>
      </table>
      <font face=宋体><font 
      face=宋体></font></font> </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="../bottom_mem.asp"-->

<%
user_add=trim(request("user_add"))
if user_add="save" then
set rs1=Server.CreateObject("Adodb.Recordset")
rs1.open "Select * from user where user_name='"&trim(request("user_name"))&"'",conn,1,1
if not rs1.eof then
response.write"<script>alert('对不起，该用户名已经注册！请重新选择！');history.back();</script>"
response.end
else if  trim(request("user_name"))="" or trim(request("user_pass"))="" or trim(request("user_passqr"))="" or trim(request("user_passts"))="" or  trim(request("user_passda"))="" or trim(request("user_mail"))="" or trim(request("user_bd"))="" then 
response.write"<script>alert('你没有填写完整的信息,请返回填写');history.back();</script>"
response.end
else if trim(request("user_pass"))<>trim(request("user_passqr")) then
response.write"<script>alert('密码和确认密码不相同,请返回填写');history.back();</script>"
response.end
else
set rs=Server.CreateObject("Adodb.Recordset")
	rs.open "select * from user where user_name is null",conn,1,3
			rs.addnew
			'必须信息添加
			rs("user_name")=trim(request("user_name"))
			rs("user_pass")=trim(request("user_pass"))
			rs("user_passts")=trim(request("user_passts"))
			rs("user_passda")=trim(request("user_passda"))
			rs("user_mail")=trim(request("user_mail"))
			rs("user_bd")=trim(request("user_bd"))
			rs("user_regtime")=date()
			rs("user_ip")=Request.ServerVariables("REMOTE_ADDR")
			rs("user_group_id")=1
			'选填信息
			if trim(request("user_xm"))<>"" then rs("user_xm")=trim(request("user_xm"))
			if trim(request("user_sex"))<>"" then rs("user_sex")=trim(request("user_sex"))
			if trim(request("user_url"))<>"" then rs("user_url")=trim(request("user_url"))
			if trim(request("user_url2"))<>"" then rs("user_url2")=trim(request("user_url2"))
			if trim(request("user_oicq"))<>"" then rs("user_oicq")=trim(request("user_oicq"))
			if trim(request("user_msn"))<>"" then rs("user_msn")=trim(request("user_msn"))
			if trim(request("user_dz"))<>"" then rs("user_dz")=trim(request("user_dz"))
			if trim(request("user_dz2"))<>"" then rs("user_dz2")=trim(request("user_dz2"))
			if trim(request("user_sf"))<>"" then rs("user_sf")=trim(request("user_sf"))
			if trim(request("user_yb"))<>"" then rs("user_yb")=trim(request("user_yb"))
		    rs.update
			rs.close
			 set rs=nothing
             conn.close
            set conn=nothing
			session("user_user_name")=trim(request("user_name"))
response.redirect"../public/cg.asp"
  rs.close
    end if
end if
end if
end if%>
</CENTER>
</BODY>
</HTML>
