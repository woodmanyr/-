<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="inc/conn_reg.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="images/common1.css" rel=stylesheet type=text/css>
<LINK href="images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-ע����֪</title>
</head>

<BODY background="images/bg.jpg" topmargin="0">
<CENTER>
<!--#include file="top_mem.asp"-->
<table cellspacing=0 cellpadding=0 width=760 align=center bgcolor=#ffffff 
border=0>
  <tbody> 
  <tr> 
    <td width=3></td>
    <td valign=top align=middle bgcolor=#ffffff> 
      <p>&nbsp; </p>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr> 
          <td valign="top" bgcolor="#FFFFFF">
            <div align="center"> 
              <p><br>
              </p>
              <p>&nbsp; </p>
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td><b> 
                    <table cellspacing=0 cellpadding=0 width="90%" border=0>
                      <tbody> 
                      <tr> 
                        <td> 
                          <ol>
                            <li>Ϊ�����ܼ�ʱ���ܱ���˾Ϊ��Աר��ĸ��������Żݣ�������������ϸ����д���������Ϣ���Ա������ܼ�ʱ������˾�����»�Ա������Ϣ��������� 
                            <li>���ڱ�վע��ɹ����û������Գ�Ϊ����˾����ʱ��Ա�������ǿͷ���Ա�ֻ�ȷ�Ϻ�ɳ�Ϊ���ǵ���ʽ��Ա�����ܻ�Ա�����д�������������Ԥ�������ֽ����ȣ��� 
                            <li>��Ա��ʹ�����Ա�ʺ�Ϊ�Լ������˹��򱾹�˾��Ʒ�����õĻ��ֽ�����û�Ա���У� 
                            <li>����ϣ������Ӯȡ�ľƵꡢ��Ʊ��������·�Ƚ����ṩ���������ã���������������Ȩ�鼰��Ա��Ч���֤���� 
                            <li>��ͬ��Ա�Ļ��ֲ��ɺϲ�ʹ�ã� 
                            <li>����˾�������г�������ڶ���Ʒ���е���������ע��鿴������Ʒ���ϣ� 
                            <li>��Ա�������Ʊ��ܺ��Լ��Ļ�Ա�ʺź����룬�����Ա������������ɵ�һ����ʧ���ɻ�Ա���˳е��� 
                            <li>����˾���ػ�Ա�ĸ�����˽�����޷������Ҫ�������²����⹫����͸¶�û�����ϸ���ϣ� 
                            <li>��Ա�ڱ���վ������Ϣʱ������ѭ���¹涨�� <br>
                              1)��������й��йط��棻 <br>
                              2)���ô����κηǷ��ġ�ɧ���Եġ��������˵ġ������Եġ������Եġ��˺��Եġ�ӹ�׵ġ��������Ϣ���ϣ� 
                            <li>��Ա�����Υ�����ҷ��ɻ򱾹�˾��ع涨����Ϊ������˾��Ȩ��ֹ���Ա�ʸ� 
                            <li>����˾��Ȩ�Ա���������޸ģ� 
                            <li>����վ��һ�л���ս���Ȩ�鱾��˾���С� </li>
                          </ol>
                        </td>
                      </tr>
                      </tbody> 
                    </table>
                    </b></td>
                </tr>
              </table>
              <p><a 
            href="user/./reg2.asp"><img border=0 
            height=17 src="images/button_agree.gif" width=59></a>&nbsp; <img 
            border=0 height=17 onClick=history.back() 
            onMouseOver="this.style.cursor='hand'" 
            src="images/button_dissent.gif" width=59></p>
              <table class=tab1 cellspacing=1 cellpadding=1 width="95%" align=center 
      border=0>
                <tbody> 
                <tr> 
                  <td class=tab1 align=left height=40><span class="mainzi">
                    <%set rs=server.CreateObject("adodb.recordset")
%>
                    <%
id=Request.QueryString("id")
strSel="select * from qita where id=166"
rs.Open strsel,conn,3,3
%>
                    </span> 
                    <table id=Table1 height=400 cellspacing=0 cellpadding=0 width="100%" 
      align=center border=0>
                      <tbody> 
                      <tr> 
                        <td valign=top>&nbsp;&nbsp;&nbsp;&nbsp; 
                          <table width="100%" border="0" cellspacing="0" cellpadding="0">
                            <tr> 
                              <td>&nbsp;</td>
                            </tr>
                          </table>
                          <span class="style15"><%=Trim(rs("content"))%></span></td>
                      </tr>
                      <tr> 
                        <td valign=top align=middle height=30>&nbsp; </td>
                      </tr>
                      </tbody> 
                    </table>
                    <p> 
                      <%rs.close%>
                    </p>
            </td>
                </tr>
                </tbody> 
              </table>
              <p><br>
              </p>
            </div>
          </td>
        </tr>
      </table>
      <font face=����><font 
      face=����></font></font> </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="bottom_mem.asp"-->
</CENTER>
</BODY>
</HTML>