<%@LANGUAGE="VBSCRIPT"%>
<!--#include file="inc/conn_reg.asp"-->
<!--#include file="inc/config.asp"-->
<!--#include file="inc/conn.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="images/common1.css" rel=stylesheet type=text/css>
<LINK href="images/style.css" rel=stylesheet type=text/css>
<title><%=config(0)%>-=-注册需知</title>
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
                            <li>为了您能及时享受本公司为会员专设的各项服务和优惠，请您尽可能详细地填写您的相关信息，以便我们能及时将本公司的最新会员服务信息传达给您； 
                            <li>凡在本站注册成功的用户都可以成为本公司的临时会员。经我们客服人员手机确认后可成为我们的正式会员，享受会员的所有待遇（包括在线预订、积分奖励等）； 
                            <li>会员可使用其会员帐号为自己或他人购买本公司产品，所得的积分奖励归该会员所有； 
                            <li>如您希望将所赢取的酒店、机票或旅游线路等奖项提供给亲友享用，请您出据书面授权书及会员有效身份证件； 
                            <li>不同会员的积分不可合并使用； 
                            <li>本公司将根据市场情况定期对礼品进行调整，请您注意查看最新礼品资料； 
                            <li>会员必须妥善保管好自己的会员帐号和密码，如因会员本身的疏忽所造成的一切损失均由会员本人承担； 
                            <li>本公司尊重会员的个人隐私，在无法律许可要求的情况下不对外公开或透露用户的详细资料； 
                            <li>会员在本网站发布信息时必须遵循以下规定： <br>
                              1)必须符合中国有关法规； <br>
                              2)不得传输任何非法的、骚扰性的、中伤他人的、辱骂性的、恐吓性的、伤害性的、庸俗的、淫秽等信息资料； 
                            <li>会员如出现违反国家法律或本公司相关规定的行为，本公司有权终止其会员资格； 
                            <li>本公司有权对本条款进行修改； 
                            <li>本网站的一切活动最终解释权归本公司所有。 </li>
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
      <font face=宋体><font 
      face=宋体></font></font> </td>
    <td width=3></td>
  </tr>
  </tbody> 
</table>
<!--#include file="bottom_mem.asp"-->
</CENTER>
</BODY>
</HTML>