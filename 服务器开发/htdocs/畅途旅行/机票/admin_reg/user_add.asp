<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<%
if config(6)=false then
  response.write("<br>"&"<p>")
  Response.Write "<center>本系统目前不提供免费用户注册！</center>"
  response.write "<br>"
   Response.Write "<center>请修改系统设置！</center>"
  response.write "<br>"
  response.write "<center><a href=system.asp>请按这儿 修 改</a></center>"  
  Response.End
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<script src="../js/Popup.js"></script>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>
<form action=user_add.asp method=post name=reg>
  <table width="100%" height="707" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="150" align="center" valign="middle">
        <table width="95%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
          <tr align="center" valign="middle" bgcolor="#008306"> 
            <td height="26" colspan="4"> 
              <div align="center">修改会员资料</div>
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td width="24%" height="26">用户名:</td>
            <td width="38%" height="26"><font color="#FF0000"> 
              <input name="user_name" type="text" id="user_name" size="20" maxlength="20">
              </font></td>
            <td width="38%" height="26">会员卡号:</td>
            <td width="76%" height="26"> 
              <input name="user_member" type="text" id="user_member" size="15">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">密 码 :</td>
            <td height="26" colspan="3"> 
              <input name="user_pass" type="password" id="user_pass">
              如不修改则留空</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">确认密码:</td>
            <td height="26" colspan="3">
              <input name="user_passqr" type="password" id="user_passqr" size="20">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">密码提示问题:</td>
            <td height="26" colspan="3"> 
              <input name="user_passts" type="text" id="user_passts">
              如不修改则留空</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">密码提示问题答案:</td>
            <td height="26" colspan="3"> 
              <input name="user_passda" type="text" id="user_passda">
              如不修改则留空</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">电子邮件地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_mail" type="text" id="user_mail">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">出生日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_bd" type="text" id="user_bd2 size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_bd, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="4"><font color="#FF0000">以下为选添信息:</font></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">真实姓名:</td>
            <td height="26" colspan="3"> 
              <input name="user_xm" type="text" id="user_xm">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">性别:</td>
            <td height="26" colspan="3"> <label> 
              <input type="radio" name="user_sex" value="0">
              女</label> <label> 
              <input type="radio" name="user_sex" value="1">
              男</label><label></label></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系电话:</td>
            <td height="26" colspan="3"> 
              <input name="user_url" type="text" id="user_url">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系手机:</td>
            <td height="26" colspan="3"> 
              <input name="user_url2" type="text" id="user_url2">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">OICQ:</td>
            <td height="26" colspan="3"> 
              <input name="user_oicq" type="text" id="user_oicq">
              必须为数字 </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">MSN:</td>
            <td height="26" colspan="3"> 
              <input name="user_msn" type="text" id="user_msn">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dz" type="text" id="user_dz" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">送票地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dz2" type="text" id="user_dz2" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">省份:</td>
            <td height="26" colspan="3"> 
              <input name="user_sf" type="text" id="user_sf">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">邮编:</td>
            <td height="26" colspan="3"> 
              <input name="user_yb" type="text" id="user_yb">
              必须为数字</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">备注信息</td>
            <td height="26" colspan="3"> 
              <input name="user_dz3" type="text" id="user_dz3" size="90">
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="25" colspan="4"><font color="#FF0000">以下为会员高级信息:</font></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">权限:</td>
            <td height="26" colspan="3"> <label> 
              <select name="select">
                <% set rs1=server.createobject("adodb.recordset")
rs1.open "select * from user_group",conn,1,3
  do while not rs1.eof                        
        %>
                <option value="<%=rs1("user_group_id")%>"><%=rs1("user_group")%></option>
                <%                        
        rs1.movenext                        
        loop%>
                <%rs1.close%>
              </select>
              </label></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">金钱:</td>
            <td height="26" colspan="3"> 
              <input name="user_money2" type="text" id="user_money">
              *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">是否开通VIP</td>
            <td height="26" colspan="3"> <label> 
              <input name="user_vip" type="radio" value="0" checked>
              关闭</label> <label> 
              <input type="radio" name="user_vip" value="1">
              开通</label> </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP开通日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_vip_s2" type="text" id="user_vip_s" size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_s, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期 *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP到期日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_vip_e2" type="text" id="user_vip_e" size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_e, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期 *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26" colspan="4">*<font color="#FF0000"> 管理信息备注</font></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">真实姓名:</td>
            <td height="26" colspan="3"> 
              <input name="user_xma" type="text" id="user_xma">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系电话:</td>
            <td height="26" colspan="3"> 
              <input name="user_urla" type="text" id="user_urla">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系手机:</td>
            <td height="26" colspan="3"> 
              <input name="user_url2a" type="text" id="user_url2a">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">OICQ:</td>
            <td height="26" colspan="3"> 
              <input name="user_oicqa" type="text" id="user_oicqa">
              必须为数字 </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">MSN:</td>
            <td height="26" colspan="3"> 
              <input name="user_msna" type="text" id="user_msna">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dza" type="text" id="user_dza" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">送票地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dz2a" type="text" id="user_dz2a" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">省份:</td>
            <td height="26" colspan="3"> 
              <input name="user_sfa" type="text" id="user_sfa">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">邮编:</td>
            <td height="26" colspan="3"> 
              <input name="user_yba" type="text" id="user_yba">
              必须为数字</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">备注信息</td>
            <td height="26" colspan="3"> 
              <input type="text" name="user_dz3a" id="user_dz3a" size="90">
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">&nbsp;</td>
            <td height="26" colspan="3">&nbsp;</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">&nbsp;</td>
            <td height="26" colspan="3">&nbsp;</td>
          </tr>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="4"> 
              <div align="center"> 
                <input type="hidden" name="user_add" value="save">
                <input type="submit" name="Submit" value=" 添 加 ">
                &nbsp;&nbsp; 
                <input type="reset" name="Submit2" value=" 重 填 ">
              </div>
            </td>
          </tr>
        </table>
      </td>
  </tr>
</table>
</form>
<br>
<br>
<%
user_add=trim(request("user_add"))
if user_add="save" then
set rs1=Server.CreateObject("Adodb.Recordset")
rs1.open "Select * from user where user_name='"&trim(request("user_name"))&"'",conn,1,1
if not rs1.eof then
response.write"<script>alert('对不起，该用户名已经注册！请重新选择！');history.back();</script>"
response.end
else if  trim(request("user_name"))="" or trim(request("user_pass"))="" or trim(request("user_passts"))="" or  trim(request("user_passda"))="" or trim(request("user_mail"))="" or trim(request("user_bd"))="" then 
response.write"<script>alert('你没有填写完整的信息,请返回填写');history.back();</script>"
response.end
else if trim(request("user_pass"))<>trim(request("user_passqr")) then
response.write"<script>alert('密码和确认密码不相同,请返回填写');history.back();</script>"
response.end
else
set rs=Server.CreateObject("Adodb.Recordset")
	rs.open "select * from user where user_name is null",conn,1,3
			rs.addnew
			rs("user_name")=trim(request("user_name"))
			rs("user_pass")=trim(request("user_pass"))
			rs("user_passts")=trim(request("user_passts"))
			rs("user_passda")=trim(request("user_passda"))
			rs("user_mail")=trim(request("user_mail"))
			rs("user_bd")=trim(request("user_bd"))
			rs("user_regtime")=date()
			rs("user_ip")=Request.ServerVariables("REMOTE_ADDR")

			if trim(request("user_sex"))<>"" then rs("user_sex")=trim(request("user_sex"))
			if trim(request("user_oicq"))<>"" then rs("user_oicq")=trim(request("user_oicq"))
			if trim(request("user_msn"))<>"" then rs("user_msn")=trim(request("user_msn"))
			if trim(request("user_url"))<>"" then rs("user_url")=trim(request("user_url"))
			if trim(request("user_url2"))<>"" then rs("user_url2")=trim(request("user_url2"))
			if trim(request("user_sf"))<>"" then rs("user_sf")=trim(request("user_sf"))
			if trim(request("user_xm"))<>"" then rs("user_xm")=trim(request("user_xm"))
		    if trim(request("user_dz"))<>"" then rs("user_dz")=trim(request("user_dz"))
			if trim(request("user_dz2"))<>"" then rs("user_dz2")=trim(request("user_dz2"))
		    if trim(request("user_yb"))<>"" then rs("user_yb")=trim(request("user_yb"))

		    if trim(request("user_oicqa"))<>"" then rs("user_oicqa")=trim(request("user_oicqa"))
			if trim(request("user_msna"))<>"" then rs("user_msna")=trim(request("user_msna"))
			if trim(request("user_urla"))<>"" then rs("user_urla")=trim(request("user_urla"))
			if trim(request("user_url2a"))<>"" then rs("user_url2a")=trim(request("user_url2a"))
			if trim(request("user_sfa"))<>"" then rs("user_sfa")=trim(request("user_sfa"))
			if trim(request("user_xma"))<>"" then rs("user_xma")=trim(request("user_xma"))
		    if trim(request("user_dza"))<>"" then rs("user_dza")=trim(request("user_dza"))
			if trim(request("user_dz2a"))<>"" then rs("user_dz2a")=trim(request("user_dz2a"))
		    if trim(request("user_yba"))<>"" then rs("user_yba")=trim(request("user_yba"))
		   '高级信息添加
		   rs("user_group_id")=trim(request("user_group_id"))
		   rs("user_money")=trim(request("user_money"))
		   if trim(request("user_dz3"))<>"" then rs("user_dz3")=trim(request("user_dz3"))
		   if trim(request("user_dz3a"))<>"" then rs("user_dz3a")=trim(request("user_dz3a"))
		   if trim(request("user_member"))<>"" then rs("user_member")=trim(request("user_member"))
		   if trim(request("user_vip"))="1" then rs("user_vip")=true
		   if trim(request("user_vip"))="0" then rs("user_vip")=false
		   if trim(request("user_vip_s"))<>"" then rs("user_vip_s")=trim(request("user_vip_s"))
		   if trim(request("user_vip_e"))<>"" then rs("user_vip_e")=trim(request("user_vip_e"))	
			rs.update
			session("user_user_name")=trim(request("user_name"))
response.redirect"cg.asp"

  rs.close
  
  end if
end if
end if
end if%>
</body>
</html>
