<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<%
user_id=request("user_id")
if user_id="" then
  response.write("<br>"&"<p>")
  Response.Write "<center>没有该用户资料！</center>"
  response.write "<br>"
  response.write "<center><a href=admin_main.htm>请按这儿返回</a></center>"  
  Response.End
else%>
<!--#include file="../public/user.asp"-->
<%
user_edit=trim(request("user_edit"))
if user_edit="save" then
set rs1=Server.CreateObject("Adodb.Recordset")
rs1.open "Select * from user where user_id="&trim(request("user_id")),conn,1,1
if rs1.eof then
response.write"<script>alert('对不起，无用户资料！请重新选择！');history.back();</script>"
response.end
else if trim(request("user_mail"))="" or trim(request("user_bd"))="" then 
response.write"<script>alert('你没有填写完整的信息,请返回填写');history.back();</script>"
response.end
else
set rs=Server.CreateObject("Adodb.Recordset")
	rs.open "Select * from user where user_id="&trim(request("user_id")),conn,1,3
			if trim(request("user_pass"))<>"" then rs("user_pass")=trim(request("user_pass"))
			if trim(request("user_passts"))<>"" then rs("user_passts")=trim(request("user_passts"))
			if trim(request("user_passda"))<>"" then rs("user_passda")=trim(request("user_passda"))
			rs("user_mail")=trim(request("user_mail"))
			rs("user_bd")=trim(request("user_bd"))
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
		   '高级信息添加
		   rs("user_group_id")=trim(request("user_group_id"))
		   if trim(request("user_money"))<>"" then rs("user_money")=trim(request("user_money"))
		   if trim(request("user_dz3"))<>"" then rs("user_dz3")=trim(request("user_dz3"))
		   if trim(request("user_member"))<>"" then rs("user_member")=trim(request("user_member"))
		   if trim(request("user_vip"))="1" then rs("user_vip")=true
		   if trim(request("user_vip"))="0" then rs("user_vip")=false
		   if trim(request("user_vip_s"))<>"" then rs("user_vip_s")=trim(request("user_vip_s"))
		   if trim(request("user_vip_e"))<>"" then rs("user_vip_e")=trim(request("user_vip_e"))	
			rs.update
response.write "<script>alert('用户资料修改成功！');location.href='user_list.asp';</Script>"
  Response.End
  rs.close
end if
end if
end if%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<script src="../js/Popup.js"></script>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>

<form action=user_edit.asp method=post name=reg>
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
            <td width="38%" height="26"><font color="#FF0000"> <%=user(2)%></font></td>
            <td width="38%" height="26">会员卡号:</td>
            <td width="76%" height="26"> 
              <input name="user_member" type="text" id="user_member" value="<%=user(24)%>" size="15">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">密 码 :</td>
            <td height="26" colspan="3"> 
              <input name="user_pass" type="password" id="user_pass">
              如不修改则留空</td>
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
              <input name="user_mail" type="text" id="user_mail" value="<%=user(7)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">出生日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_bd" type="text" id="user_bd2" value="<%=user(11)%>" size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_bd, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">注册日期:</td>
            <td height="26" colspan="3"><%=user(12)%></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">注册IP：</td>
            <td height="26" colspan="3"><%=user(21)%></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">登陆次数:</td>
            <td height="26" colspan="3">注册以来登陆: <%=user(16)%> 次</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="4"><font color="#FF0000">以下为选添信息:</font></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">真实姓名:</td>
            <td height="26" colspan="3"> 
              <input name="user_xm" type="text" id="user_xm" value="<%=user(13)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">性别:</td>
            <td height="26" colspan="3"> <label> 
              <input <%If (CStr(user(10)) = CStr("0")) Then Response.Write("CHECKED") : Response.Write("") end if%> type="radio" name="user_sex" value="0">
              女</label> <label> 
              <input <%If (CStr(user(10)) = CStr("1")) Then Response.Write("CHECKED") : Response.Write("") end if%> type="radio" name="user_sex" value="1">
              男</label></td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系电话:</td>
            <td height="26" colspan="3"> 
              <input name="user_url" type="text" id="user_url" value="<%=user(8)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系手机:</td>
            <td height="26" colspan="3"> 
              <input name="user_url2" type="text" id="user_url2" value="<%=user(25)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">OICQ:</td>
            <td height="26" colspan="3"> 
              <input name="user_oicq" type="text" id="user_oicq" value="<%=user(6)%>">
              必须为数字 </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">MSN:</td>
            <td height="26" colspan="3"> 
              <input name="user_msn" type="text" id="user_msn" value="<%=user(23)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">联系地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dz" type="text" id="user_dz" value="<%=user(14)%>" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">送票地址:</td>
            <td height="26" colspan="3"> 
              <input name="user_dz2" type="text" id="user_dz2" value="<%=user(26)%>" size="35">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">省份:</td>
            <td height="26" colspan="3"> 
              <input name="user_sf" type="text" id="user_sf" value="<%=user(9)%>">
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">邮编:</td>
            <td height="26" colspan="3"> 
              <input name="user_yb" type="text" id="user_yb" value="<%=user(15)%>">
              必须为数字</td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td height="26">备注信息</td>
            <td height="26" colspan="3"> 
              <input name="user_dz3" type="text" id="user_dz3" value="<%=user(27)%>">
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="25" colspan="4"><font color="#FF0000">以下为会员高级信息:</font></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">权限:</td>
            <td height="26" colspan="3"> 
              <%
set rs=server.createobject("adodb.recordset")
sql="SELECT * From user_group where user_group_id="&user(1)
rs.open sql,conn,1,3%>
              <select name="user_group_id">
                <OPTION selected value="<%=user(1)%>"><%=rs("user_group")%></OPTION>
                <%rs.close
					  set rs1=server.createobject("adodb.recordset")
rs1.open "select * from user_group",conn,1,3
  do while not rs1.eof                        
        %>
                <OPTION value="<%=rs1("user_group_id")%>"><%=rs1("user_group")%></OPTION>
                <%                        
        rs1.movenext                        
        loop%>
                <%rs1.close%>
              </select>
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">金钱:</td>
            <td height="26" colspan="3"> 
              <input name="user_money" type="text" id="user_money" value="<%=user(17)%>">
              *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">是否开通VIP</td>
            <td height="26" colspan="3"> <label> 
              <input <%If (CStr(user(18)) = CStr(false)) Then Response.Write("CHECKED") : Response.Write("") end if%> type="radio" name="user_vip" value="0">
              关闭</label> <label> 
              <input <%If (CStr(user(18)) = CStr(true)) Then Response.Write("CHECKED") : Response.Write("") end if%> type="radio" name="user_vip" value="1">
              开通</label> </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP开通日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_vip_s" type="text" id="user_vip_s" value="<%=user(19)%>" size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_s, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期 *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP到期日期:</td>
            <td height="26" colspan="3"> 
              <input name="user_vip_e" type="text" id="user_vip_e" value="<%=user(20)%>" size="15">
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_e, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期 *</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26" colspan="4">*<font color="#FF0000"> 代表免费版无此功能</font></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">&nbsp;</td>
            <td height="26" colspan="3">&nbsp;</td>
          </tr>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="4"> 
              <div align="center"> 
                <input type="hidden" name="user_edit" value="save">
                <input type="hidden" name="user_id" value="<%=user(0)%>">
                <input type="submit" name="Submit" value=" 修 改 ">
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
      <!--#include file="../public/copyright.inc"-->
<%end if%>
</body>
</html>
