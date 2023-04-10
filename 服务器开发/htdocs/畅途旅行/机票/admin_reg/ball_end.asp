<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->
<%ball_id=request("ball_id")%>
<!--#include file="../public/ball.asp"-->

<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>

</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=2>
<form name="ball_add" method="post" action="ball_save.asp">
  <table width="450" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor="#000000">
    <tr> 
      <td height="26" align="center" valign="middle" bgcolor="#008306"><strong><font color="#FFFFFF">心水结果添加</font></strong> 
        <font color="#FFFFFF">带*号必填</font> </td>
  </tr>
  <tr> 
      <td> 
        <table width="100%" height="100%" border="0" align="center" cellpadding="3" cellspacing="1">
          <tr align="center" valign="middle"> 
            <td width="20%" height="26" bgcolor="#C9E393">类别:</td>
            <td width="80%" height="26" align="left" bgcolor="#C9E393"> <%
			set rs=server.createobject("adodb.recordset")
			sql = "select * from team_class where team_class_id="&ball(1)
        rs.open sql,conn,1,1%> <%=rs("team_class")%> <%rs.close%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">标题:</td>
            <td height="26" align="left" bgcolor="#C9E393"><%=ball(2)%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">开球时间:</td>
            <td height="26" align="left" bgcolor="#C9E393"><%=ball(3)%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">球队A:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <%
			set rs=server.createobject("adodb.recordset")
			sql = "select * from team where team_id="&ball(4)
        rs.open sql,conn,1,1%> <%=rs("team_name")%> <%rs.close%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">球队B:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <%
			set rs=server.createobject("adodb.recordset")
			sql = "select * from team where team_id="&ball(5)
        rs.open sql,conn,1,1%> <%=rs("team_name")%> <%rs.close%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">赔率:</td>
            <td height="26" align="left" bgcolor="#C9E393"><%
			set rs1=server.createobject("adodb.recordset")
rs1.open "select * from ball_pl where ball_pl_id="&ball(6),conn,1,3%><%=rs1("ball_pl")%><%rs1.close%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">预测:</td>
            <td height="26" align="left" bgcolor="#C9E393"> <%
			set rs=server.createobject("adodb.recordset")
			sql = "select * from team where team_id="&ball(7)
        rs.open sql,conn,1,1%> <%=rs("team_name")%> <%rs.close%></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">信心指数:</td>
            <td height="26" align="left" bgcolor="#C9E393"><img src="<%=ball(8)%>"></td>
          </tr>
          <tr align="center" valign="middle">
            <td height="26" bgcolor="#C9E393">是否VIP:</td>
            <td height="26" align="left" bgcolor="#C9E393">
              <%If ball(12) = true Then Response.Write("<font color=red>是</font>") else Response.Write("否") end if%>
            </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" bgcolor="#C9E393">过效时间:</td>
            <td height="26" align="left" bgcolor="#C9E393"><%=ball(13)%> </td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" colspan="2" bgcolor="#C9E393"><font color="#FF0000">比分 
              球队A ： 球队B</font></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="26" colspan="2" bgcolor="#C9E393"> <select name="ball_cent_a" id="ball_cent_a">
                <OPTION selected value="<%=ball(9)%>"><%=ball(9)%></OPTION>
                <%for i=0 to 20%>
                <OPTION value="<%=i%>"><%=i%></OPTION>
                <%next%>
              </select> <strong> ： </strong> <select name="ball_cent_b" id="ball_cent_b">
                <OPTION selected value="<%=ball(10)%>"><%=ball(10)%></OPTION>
                <%for i=0 to 20%>
                <OPTION value="<%=i%>"><%=i%></OPTION>
                <%next%>
              </select></td>
          </tr>
          <tr align="center" valign="middle"> 
            <td height="25" colspan="2" bgcolor="#C9E393"></td>
          </tr>
        </table>
      </td>
  </tr>
  <tr> 
    <td height="30" bgcolor="#C9E393">
<div align="center"> 
<input type="hidden" name="ball" value="end">
<input type="hidden" name="ball_id" value="<%=ball(0)%>">
          <input type="submit" name="Submit" value=" 添加结果 ">
      </div></td>
  </tr>
</table></form>
</body>

