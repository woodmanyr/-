<!--#include file="inc/conn_reg.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="cf.asp"-->
<!--#include file="vip.asp"-->
<%i=config(3)%><HEAD>
<TITLE><%=config(0)%>-=-会员专区</TITLE>
<LINK href="images/common1.css" rel=stylesheet type=text/css>
<LINK href="images/style.css" rel=stylesheet type=text/css>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
 </HEAD>
<BODY bgColor=#ffffff background="images/bg.jpg" leftMargin=0 topMargin=0 onLoad="MM_preloadImages('images/wz1_2.gif','user/./images/wz2_2.gif','user/./images/wz3_2.gif')">
<CENTER>

  <table width="775" border="0" cellspacing="0" cellpadding="0">
    <tr> 
      <td width="576" valign="top" bgcolor="#FFFFFF"><TABLE width="100%" height="28" border=0 align=center cellPadding=0 cellSpacing=0>
          <TBODY>
            <TR> 
              <TD height="25" bgcolor="#BDC7D6" class=chinese>&nbsp; <IMG src="images/arr1.gif" width=26 
            height=13 border="0" align=absMiddle> <a href="index.asp">首 页</a> 
                <img src="images/square_topmenu.gif" width="6" height="9"> 
                <a href="user/index.asp"><font color="#FF0000">会员专区</font></a> </TD>
            </TR>
          </TBODY>
        </TABLE><%if user_vip=true then%>
		<table width="560" height="233" border="0" align="center" cellpadding="0" cellspacing="0">
          <tr> 
            <td width="16" height="102"></td>
            <td width="441" height="102"> 
              <p><font size="2">&nbsp;&nbsp;&nbsp; </font></p>
              <p><b><font size="2">这里显示的是.会员区<font color="#FF0000">本日</font>刚发布的<font color="#FF0000">VIP</font>心水资料.</font></b></p>
              <p><b></b></p></td>
          </tr>
          <tr> 
            <td width="16" height="91">　</td>
            <td height="91" valign="top"> <table border="0" width="100%" id="AutoNumber1" height="89" cellspacing="0" cellpadding="0">
                <tr> 
                  <td width="12%" height="1"></td>
                  <td width="18%" height="1"></td>
                  <td width="17%" height="1"></td>
                  <td width="18%" height="1"></td>
                  <td height="1" colspan="2"></td>
                </tr>
                <tr> 
                  <td height="1" colspan="2"></td>
                  <td height="1" colspan="2"> <p align="center"></td>
                  <td height="1" colspan="2"></td>
                </tr>
                <tr> 
                  <td height="15" colspan="2"></td>
                  <td height="15" colspan="2"> <p align="center"></td>
                  <td height="15" colspan="2"> <p align="right"><font face="Arial" color="#000080"><b><%=date()%>&nbsp;&nbsp; 
                      </b></font></td>
                </tr>
                <tr bgcolor="#F87D43"> 
                  <td width="12%" height="24" align="center"> <b><font size="2">时间</font></b></td>
                  <td width="18%" height="24"  align="center"> <b><font size="2">球队</font></b></td>
                  <td width="17%" height="24"  align="center"> <b><font size="2">赔率</font></b></td>
                  <td width="18%" height="24"  align="center"> <b><font size="2">球队</font></b></td>
                  <td width="17%" height="24"  align="center"> <font size="2"><b>推荐</b></font></td>
                  <td width="18%" height="24"  align="center"> <font size="2"><b>信心</b></font></td>
                </tr>
                <%
	   rowcount= i
	   vip=true
	   nowtime=now()
	   set rs=Server.CreateObject("Adodb.Recordset")
	sql="SELECT * from ball where ball_vip="&vip&" and day(ball_addtime)=day(date()) ORDER BY ball_id DESC"
rs.open sql,conn,1,1
				if rs.bof and rs.eof then 
		response.write "近期无更新文章" 
	else 
	do while not rs.eof  and rowcount>0 
n=rowcount mod 2
if n=1 then
bgcolor="#97CC98"
else
bgcolor="#FEFFD1"
end if
%>
                <tr> 
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"><%=formatdatetime(rs("ball_starttime"),4)%></td>
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"> 
                    <%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("team_a"),conn,1,1 %>
                    <%=brs("team_name")%> 
                    <%brs.close 
					set brs=nothing%>
                  </td>
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"><%=rs("ball_pl")%></td>
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"> 
                    <%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("team_b"),conn,1,1 %>
                    <%=brs("team_name")%> 
                    <%brs.close 
					set brs=nothing%>
                  </td>
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"> 
                    <%set brs=Server.CreateObject("Adodb.Recordset")
brs.open "SELECT team_name from team where team_id="&rs("ball_test"),conn,1,1 %>
                    <%=brs("team_name")%> 
                    <%brs.close 
					set brs=nothing%>
                  </td>
                  <td height="24"  bgcolor="<%=bgcolor%>" align="center"><img src="<%=rs("ball_xx")%>"></td>
                </tr>
                <%
		RowCount = RowCount - 1
        Rs.MoveNext
        Loop
       end if
	   rs.close
	   set rs=nothing%>
              </table></td>
          </tr>
          <tr> 
            <td height="10">&nbsp;</td>
            <td height="10">&nbsp;</td>
          </tr>
          <tr> 
            <td width="16" height="10">　</td>
            <td height="10">　 
              <div align="right"><a href="ball_list.asp">以往更多....</a></div></td>
          </tr>
        </table>
		<%else
		response.write"<center><p><br>对不起.你不是本站VIP会员.请注册才能查看资料</center>"
		end if%>
        <p>&nbsp;</p></td>
      <td width="199" valign="top" bgcolor="#FFFFFF"><!--#include file="user/right.asp"--></td>
    </tr>
  </table>
</CENTER></BODY>