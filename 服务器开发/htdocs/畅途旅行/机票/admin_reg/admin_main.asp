<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="top"> <table width="70%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td>&nbsp;</td>
        </tr>
        <tr> 
          <td>
            <p>��ӭ������վ����ϵͳ�������<br>
              <br>
            </p>
            <p>���������Կ��ƻ�Ա����ϵͳ���á��������ҳ������ѡ����Ҫ���й�������ӡ�<br>
            </p></td>
        </tr>
        <tr> 
          <td>&nbsp;</td>
        </tr>
      </table>
      <br> 
	     
      <table width="70%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
        <tr align="center" valign="middle" bgcolor="#008306"> 
          <td height="26" colspan="2"> 
            <div align="left">��ݲ˵�</div>
          </td>
        </tr>
        <form action=news_search_list.asp method=post name=reg>
        </form>
        <%if user_group_id=config(8) then%>
        <form action=user_member_search_list.asp method=post name=reg>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" align="left" bgcolor="#C9E393" width="31%">�����������ţ�</td>
            <td height="26" align="left" bgcolor="#C9E393" width="69%"> <font color="#FF0000">	
              <input name="user_member" type="text" id="user_member" size="20">
              </font> 
              <input type="submit" name="Submit" value=" �� ѯ ">
            </td>
          </tr>
        </form>
        <%end if%>
        <tr align="center" valign="middle" bgcolor="#C9E393"> 
          <td height="26" colspan="2" align="left" bgcolor="#C9E393">&nbsp;</td>
        </tr>
        <tr align="center" valign="middle" bgcolor="#C9E393"> 
          <td height="26" colspan="2" align="left" bgcolor="#C9E393">&nbsp;</td>
        </tr>
      </table>
	  
      <table width="70%" border="0" cellpadding="3" cellspacing="1" bgcolor="#000000">
        <tr align="center" valign="middle" bgcolor="#008306"> 
          <td height="26" colspan="2"> 
            <div align="left">��ݲ˵�</div>
          </td>
        </tr>

        <%if user_group_id=config(8) then%>
        <form action=user_search_list.asp method=post name=reg>
          <tr align="center" valign="middle" bgcolor="#C9E393"> 
            <td height="26" align="left" bgcolor="#C9E393" width="31%">���������û�����</td>
            <td height="26" align="left" bgcolor="#C9E393" width="69%"> <font color="#FF0000">	
              <input name="user_name" type="text" id="user_name" size="20">
              </font> 
              <input type="submit" name="Submit2" value=" �� ѯ ">
            </td>
          </tr>
        </form>
        <%end if%>
        <tr align="center" valign="middle" bgcolor="#C9E393"> 
          <td height="26" colspan="2" align="left" bgcolor="#C9E393">&nbsp;</td>
        </tr>
        <tr align="center" valign="middle" bgcolor="#C9E393"> 
          <td height="26" colspan="2" align="left" bgcolor="#C9E393">&nbsp;</td>
        </tr>
      </table>
      <br>
      <br>
      <br>
    </td>
  </tr>
</table>
</body>
</html>
