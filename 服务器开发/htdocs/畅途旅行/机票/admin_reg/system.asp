<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<%
edit=trim(request("edit"))
if edit = "save" then
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "SELECT * From system",conn,1,3 
                        rs("home_title")=trim(request("home_title"))
						rs("home_link")=trim(request("home_link"))
                        rs("page_num")=trim(request("page_num"))
                        rs("home_mail")=trim(request("home_mail"))
				        rs("images_lk")=trim(request("images_lk"))
                        rs("admin_lk")=trim(request("admin_lk"))
						if trim(request("user_reg"))<>"" then rs("user_reg")=true
					    if trim(request("user_reg"))="" then rs("user_reg")=false
						rs("ts_time")=trim(request("ts_time"))
						rs("admin_group_id")=trim(request("admin_group_id"))
					    rs.update
						rs.close
                        set rs=nothing
	             response.write "<script>alert('��ϲ����ϵͳ�������óɹ���');location.href='system.asp';</Script>"
        response.end
end if
%>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<br>
&nbsp;&nbsp;&nbsp;&nbsp;������Ŀ������д<br>
<form action=system.asp method=post>
  <table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
    <tr> 
      <td width="167" bgcolor="#008306">��վ����:</td>
      <td width="565" bgcolor="#C9E393"><INPUT name="home_title"  type="text" value="<%=config(0)%>" size="20"></td>
    </tr>
    <tr> 
      <td bgcolor="#008306">��վ��ַ:</td>
      <td bgcolor="#C9E393"><INPUT name="home_link" type="text" value="<%=config(1)%>" size="30"> 
      </td>
    </tr>
    <tr> 
      <td bgcolor="#008306">��ϵmail:</td>
      <td bgcolor="#C9E393"><INPUT name="home_mail" type="text" value="<%=config(2)%>"> 
      </td>
    </tr>
    <tr> 
      <td bgcolor="#008306">ÿҳ��ʾ����</td>
      <td bgcolor="#C9E393"><INPUT name="page_num" type="text" value="<%=config(3)%>" size="4">
        ÿҳ��ʾ�������� </td>
    </tr>
    <tr> 
      <td bgcolor="#008306">����Ŀ¼��ַ:</td>
      <td bgcolor="#C9E393"><input name="admin_lk" type="text" value="<%=config(4)%>" size="20"> 
        <font color="#FF0000">��ַ����������&quot;/&quot; </font></td>
    </tr>
    <tr> 
      <td bgcolor="#008306">ͼƬ��ַ:</td>
      <td bgcolor="#C9E393"><INPUT name="images_lk" type="text" value="<%=config(5)%>" size="20"> 
        <font color="#FF0000">��ַ����������&quot;/&quot;</font> </td>
    </tr>
    <tr> 
      <td bgcolor="#008306">�Ƿ�����ע��:</td>
      <td bgcolor="#C9E393"> <input <%If config(6) = true Then Response.Write("checked") : Response.Write("")%> name="user_reg" type="checkbox">
        ���������ע��,����Ӱ����ע���û��ĵ�½.</td>
    </tr>
    <tr> 
      <td bgcolor="#008306">������ǰ��������</td>
      <td bgcolor="#C9E393"><INPUT  name="ts_time" type="text" value="<%=config(7)%>" size="6">
        ��&quot;��&quot;Ϊ��λ</td>
    </tr>
    <tr> 
      <td bgcolor="#008306">�����̨������:</td>
      <td bgcolor="#C9E393">
        <%
set rs=server.createobject("adodb.recordset")
sql="SELECT * From user_group where user_group_id="&config(8)
rs.open sql,conn,1,3%>
        <select name="admin_group_id">
          <OPTION selected value="<%=config(8)%>"><%=rs("user_group")%></OPTION>
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
        </select></td>
    </tr>
    <tr> 
      <td bgcolor="#008306">&nbsp;</td>
      <td bgcolor="#C9E393">&nbsp;</td>
    </tr>
    <tr> 
      <td colspan="2" bgcolor="#008306"><div align="center"> 
          <input type="hidden" name="edit" value="save">
          <input type="submit" name="Submit" value=" �� �� ">
        </div></td>
    </tr>
  </table>
</form>
