<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<script src="../js/Popup.js"></script>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>

<form action=user_search_list.asp method=post name=reg>
  <table width="100%" height="433" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td height="150" align="center" valign="middle">������Ŀ�粻Ҫ��������<br>
        <br>
	    <table width="95%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
          <tr align="center" valign="middle" bgcolor="#008306"> 
            <td height="26" colspan="2"> 
              <div align="center">������Ա���� </div>
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td width="24%" height="26">�û�������:</td>
            <td height="26"><font color="#FF0000"> 
              <input name="user_name" type="text" id="user_name" size="20">
              </font></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">Ȩ�޵���:</td>
            <td height="26"> 
              <select name="user_group_id">
                <OPTION value="">��Ա��</OPTION>
                <% set rs1=server.createobject("adodb.recordset")
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
            <td height="26">��Ǯ����:</td>
            <td height="26"> 
              <input name="user_money" type="text" id="user_money" size="10" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">�Ƿ�ͨVIP</td>
            <td height="26"> <label> 
              <input type="radio" name="user_vip" value="0">
              �ر�</label> <label> 
              <input type="radio" name="user_vip" value="1">
              ��ͨ</label> </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP��ͨ���ڵ���:</td>
            <td height="26"> 
              <input name="user_vip_s" type="text" id="user_vip_s" value="" size="15">
              &nbsp; <a href=# title="ѡ������" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_s, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- �����Сͼѡ����</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP�������ڵ���:</td>
            <td height="26"> 
              <input name="user_vip_e" type="text" id="user_vip_e" size="15">
              &nbsp; <a href=# title="ѡ������" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_e, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- �����Сͼѡ����</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">&nbsp;</td>
            <td height="26">&nbsp;</td>
          </tr>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="2"> 
              <div align="center"> 
                <input type="hidden" name="user_search" value="save">
                <input type="submit" name="Submit" value=" �� ѯ ">
                &nbsp;&nbsp; 
                <input type="reset" name="Submit2" value=" �� �� ">
              </div>
            </td>
          </tr>
        </table> 
        
        
      </td>
  </tr>
</table>
</form>
<form action=user_member_search_list.asp method=post name=reg>
  <table width="100%" height="433" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td align="center" valign="middle"><br>
        <br>
	    <table width="95%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
          <tr align="center" valign="middle" bgcolor="#008306"> 
            <td height="26" colspan="2"> 
              <div align="center">������Ա���� </div>
            </td>
          </tr>
          <tr valign="middle" bgcolor="#C9E393"> 
            <td width="24%" height="26">��Ա���ŵ���:</td>
            <td height="26"><font color="#FF0000"> 
              <input name="user_member" type="text" id="user_member" size="20">
              </font><font color="#FF0000"> </font></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">Ȩ�޵���:</td>
            <td height="26"> 
              <select name="user_group_id">
                <OPTION value="">��Ա��</OPTION>
                <% set rs1=server.createobject("adodb.recordset")
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
            <td height="26">��Ǯ����:</td>
            <td height="26"> 
              <input name="user_money" type="text" id="user_money" size="10" maxlength="10">
            </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">�Ƿ�ͨVIP</td>
            <td height="26"> <label> 
              <input type="radio" name="user_vip" value="0">
              �ر�</label> <label> 
              <input type="radio" name="user_vip" value="1">
              ��ͨ</label> </td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP��ͨ���ڵ���:</td>
            <td height="26"> 
              <input name="user_vip_s" type="text" id="user_vip_s" value="" size="15">
              &nbsp; <a href=# title="ѡ������" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_s, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- �����Сͼѡ����</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">VIP�������ڵ���:</td>
            <td height="26"> 
              <input name="user_vip_e" type="text" id="user_vip_e" size="15">
              &nbsp; <a href=# title="ѡ������" onClick="fPopUpDlg('../js/calendar.htm', document.reg.user_vip_e, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- �����Сͼѡ����</td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="26">&nbsp;</td>
            <td height="26">&nbsp;</td>
          </tr>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" colspan="2"> 
              <div align="center"> 
                <input type="hidden" name="user_search" value="save">
                <input type="submit" name="Submit" value=" �� ѯ ">
                &nbsp;&nbsp; 
                <input type="reset" name="Submit2" value=" �� �� ">
              </div>
            </td>
          </tr>
        </table> 
        
        
      </td>
  </tr>
</table>
</form><br>
      <br>
</body>
</html>
