<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->

<head>
<%
dim count
set rs=server.createobject("adodb.recordset")
sql = "select * from team order by team_id asc"
rs.open sql,conn,1,1
%>
<script language = "JavaScript">
var onecount;
onecount=0;
subcat = new Array();
        <%
        count = 0
        do while not rs.eof 
        %>
subcat[<%=count%>] = new Array("<%= trim(rs("team_name"))%>","<%= trim(rs("team_class_id"))%>","<%= trim(rs("team_id"))%>");
        <%
        count = count + 1
        rs.movenext
        loop
        rs.close
        %>
onecount=<%=count%>;

function changelocation(locationid)
    {
    document.ball_add.team_a.length = 0; 
    document.ball_add.team_b.length = 0; 
	document.ball_add.ball_test.length = 0; 
	
    var locationid=locationid;
    var i;
    for (i=0;i < onecount; i++)
        {
            if (subcat[i][1] == locationid)
            { 
                document.ball_add.team_a.options[document.ball_add.team_a.length] = new Option(subcat[i][0], subcat[i][2]);
				document.ball_add.team_b.options[document.ball_add.team_b.length] = new Option(subcat[i][0], subcat[i][2]);
				document.ball_add.ball_test.options[document.ball_add.ball_test.length] = new Option(subcat[i][0], subcat[i][2]);
            }        
        }
        
    }    
</script>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>
<form name="ball_add" method="post" action="ball_save.asp">
  <table width="560" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr> 
      <td height="26" align="center" valign="middle" bgcolor="#008306"><strong><font color="#FFFFFF">��ˮ���</font></strong> 
        <font color="#FFFFFF">��*�ű���</font> </td>
  </tr>
  <tr> 
      <td> 
        <table width="100%" height="100%" border="0" align="center" cellpadding="3" cellspacing="1">
          <tr align="center" valign="middle"> 
            <td width="17%" height="26" bgcolor="#C9E393">���:</td>
            <td width="83%" height="26" align="left" bgcolor="#C9E393"><%
        sql = "select * from team_class"
        rs.open sql,conn,1,1
	if rs.eof and rs.bof then
	response.write "���������ӷ��ࡣ"
	response.end
	else
%> <select name="team_class_id" onChange="changelocation(document.ball_add.team_class_id.options[document.ball_add.team_class_id.selectedIndex].value)" size="1">
                <option selected value="<%=trim(rs("team_class_id"))%>"><%=trim(rs("team_class"))%></option>
                <%      dim team_class_id
         team_class_id=rs("team_class_id")
        rs.movenext
        do while not rs.eof
%>
                <option value="<%=trim(rs("team_class_id"))%>"><%=trim(rs("team_class"))%></option>
                <%
        rs.movenext
        loop
	end if
        rs.close
%>
              </select> <font color="#FF0000"> * </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">����:</td>
            <td height="26" align="left" bgcolor="#C9E393"><input name="ball_title" type="text" id="ball_title" size="50"> 
              <font color="#FF0000"> *</font></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">����ʱ��:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <input name="ball_starttime" type="text" id="ball_starttime" size="10" >
              ��ʽΪ: <strong><font color="#0000FF">18:08</font></strong> <font color="#FF0000">* 
              </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">���A:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <select name="team_a" id="team_a">
                <%
				sql="select * from team where team_class_id="&team_class_id
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
                <option selected value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
do while not rs.eof%>
                <option value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
loop
end if
        rs.close
%>
              </select> <font color="#FF0000">* </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">���B:</td>
            <td height="26" align="left" bgcolor="#C9E393"><select name="team_b" id="team_b">
                <%
				sql="select * from team where team_class_id="&team_class_id
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
                <option selected value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
do while not rs.eof%>
                <option value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
loop
end if
        rs.close
%>
              </select> <font color="#FF0000">* </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">����:</td>
            <td height="26" align="left" bgcolor="#C9E393"><select name="ball_pl" id="ball_pl">
                <OPTION selected value="">ѡ������</OPTION>
                <%
				set rsf=server.createobject("adodb.recordset")
rsf.open "select * from ball_forum",conn,1,1
ball_forum=rsf("ball_forum")
rsf.close
			
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from ball_pl where ball_pl_id in("&ball_forum&")",conn,1,3
  do while not rs1.eof                        
        %>
                <OPTION value="<%=trim(rs1("ball_pl_id"))%>"><%=trim(rs1("ball_pl"))%></OPTION>
                <%                        
        rs1.movenext                        
        loop                        
        rs1.close                        
        %>
              </select> <font color="#FF0000">* </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">Ԥ��:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <font color="#FF0000"> 
              <select name="ball_test" id="ball_test">
                <%
				sql="select * from team where team_class_id="&team_class_id
rs.open sql,conn,1,1
if not(rs.eof and rs.bof) then
%>
                <option selected value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
do while not rs.eof%>
                <option value="<%=rs("team_id")%>"><%=rs("team_name")%></option>
                <% rs.movenext
loop
end if
        rs.close
%>
              </select>
              * </font> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">����ָ��:</td>
            <td height="26" align="left" bgcolor="#C9E393"><select name="ball_xx" id="select">
                <OPTION selected value="">��ѡ��</OPTION>
                <%for i=1 to 5%>
                <OPTION value="../images/xing/<%=i%>.gif"><%=i%>��</OPTION>
                <%next%>
              </select> <font color="#FF0000">* </font> </td>
          </tr>
          <tr align="center" valign="middle">
            <td height="26" bgcolor="#C9E393">��Чʱ��:</td>
            <td height="26" align="left" bgcolor="#C9E393"><font color="#FF0000">
              <input name="ball_endtime" type="text" id="ball_endtime" value="<%=year(now())&"-"&month(now())&"-"&day(now())&" "&hour(now())+2&":"&minute(now())&":"&second(now())%>" size="18" readonly>
              *��Ѱ��޷��޸�,Ĭ��2Сʱ</font></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">�Ƿ�VIP:</td>
            <td height="26" align="left" bgcolor="#C9E393"><input name="ball_vip" type="checkbox" id="ball_vip" value="checkbox" checked  readonly>
              ѡ���.ֻ��VIP��Ա������� <font color="#FF0000">*��Ѱ��޷��޸�</font></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="25" colspan="2" bgcolor="#C9E393">&nbsp;</td>
          </tr>
        </table>
      </td>
  </tr>
  <tr> 
    <td height="30" bgcolor="#C9E393">
<div align="center"> 
<input type="hidden" name="ball" value="add">
          <input type="submit" name="Submit" value=" �� �� ">
      </div></td>
  </tr>
</table></form>
</body>

