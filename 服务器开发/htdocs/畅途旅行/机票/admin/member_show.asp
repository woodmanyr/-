<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<!-- #include file="../inc/conn1.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>��̨������Ʒ����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>
<%
set rs=Server.CreateObject("AdoDb.Recordset")
if Request.QueryString("action")="ok" then
 strSel="select * from buy_product where id="&Request.QueryString("buy_id")
 rs.Open strSel,conn,3,3
 rs("flag")="true" 
 rs.update
 rs.close
 Response.Write("<script>alert('�������')</script>")
end if

strSel="select * from member where id="&Request.QueryString("id")&"  order by id desc"
rs.Open strSel , conn , 3 ,3
%>
<body class="body">
<form method="get" >
<table width="780" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#7392EF" class="font">
  <tr>
    <td height="110" bgcolor="#D6DFF7"><div align="right">
      <table width="100%" height="177"  border="0" cellpadding="1" cellspacing="1" bgcolor="#FFFFFF">
        <tr bgcolor="#D6DFF7">
          <td width="12%"><div align="right">��Ա��¼����</div></td>
          <td width="34%" height="25"><div align="left"><%=rs("username")%></div></td>
          <td width="10%"><div align="right">��ʵ������</div></td>
          <td><div align="left"><%=rs("contact1")%></div></td>
          <td>�����ˣ�</td>
          <td><div align="left"><%=rs("introducer")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">�Ա� </div></td>
          <td height="25"><div align="left"><%=rs("sex")%></div></td>
          <td>
            <div align="right">�������䣺 </div></td>
          <td colspan="3"><div align="left"><%=rs("email")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">�̶��绰�� </div></td>
          <td height="25"><div align="left"><%=rs("tel1")%></div></td>
          <td>
            <div align="right">�ƶ��绰�� </div></td>
          <td colspan="3"><div align="left"><%=rs("mobile")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">�̶��绰2��</div></td>
          <td height="25"><div align="left"><%=rs("tel2")%></div></td>
          <td>
            <div align="right">ѧ����</div></td>
          <td colspan="3"><div align="left"><%=rs("education")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">���ڵ�ַ��</div></td>
          <td height="25"><div align="left"><%=rs("address")%></div></td>
          <td>
            <div align="right">�������£�</div></td>
          <td colspan="3"><div align="left"><%=rs("birthday")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">��ͥ��ַ��</div></td>
          <td height="25"><div align="left"><%=rs("homeaddress")%></div></td>
          <td><div align="right"></div>
            <div align="right">�ȼ���</div></td>
          <td width="17%"><div align="left"><%for i=1 to rs("level")%><font color="#FF0000">��</font><%next%></div></td>
          <td width="7%"><div align="right">���֣�</div></td>
          <td width="20%"><div align="left"><%=rs("moncount")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">������λ��</div></td>
          <td height="25"><div align="left"><%=rs("company")%></div></td>
          <td>
            <div align="right">�绰��</div></td>
          <td colspan="3"><div align="left"><%=rs("companytel")%></div></td>
        </tr>
        <tr bgcolor="#D6DFF7">
          <td>
            <div align="right">��Ӫ��Ʒ�� </div></td>
          <td height="25"><div align="left"><%=rs("schooltel")%></div></td>
          <td>
            <div align="right">�绰��</div></td>
          <td colspan="3"><div align="left"><%=rs("schooltel")%></div></td>
        </tr>
      </table>
      </div></td>
  </tr>
</table>
<p align="center"><a href="javascript:window.close()">���رա�</a></p>
</form>
</body>
</html>
