<!--#include file="inc/conn.asp"-->


<HTML>
<HEAD>
<TITLE><%=site_name%></TITLE>
<META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=gb2312">

<link rel="stylesheet" href="inc/css.css"  type="text/css">
</HEAD>
<%
  set Rs=Server.CreateObject("AdoDb.Recordset")
  id=Request.QueryString("id")
  if Request.QueryString("action")="out" then 
    Response.Cookies("admin_login")=""
  end if
  if Request.QueryString("action")="mod_pass" then 
    if Request.Cookies("admin_login")<>"true" then
	  Response.Redirect("?action=Admin_Login")
	else
	  if Request.Form("submit")="�޸�" then
	  strSel="select * from admin"
	  rs.Open strSel,conn,3,3
	    admin_name=Trim(Request.Form("admin_name"))
	    if admin_name<>"" then
		  rs("name")=admin_name
	    end if 
	    rs("password")=Request.Form("admin_pass")
		rs.Update
		rs.close
		Response.Write("<script>alert('�޸ĳɹ�')</script>")
		Response.Write("<script>window.location='?action=View_Words'</script>")
	  end if
	end if
  end if
  if Request.QueryString("action")="del" then
    if Request.Cookies("admin_login")<>"true" then
	  Response.Redirect("?action=Admin_Login")
	else
      strSel="delete from guestbook where id="&id
	  conn.Execute(strSel)
	  Response.Redirect("?action=View_Words")
    end if
  end if
  if Request.QueryString("action")="replay_news" then
    if Request.Cookies("admin_login")<>"true" then
	  Response.Redirect("?action=Admin_Login")
	else
	  if Request.Form("submit")="�ύ" then
        strSel="select * from guestbook where id="&id
	    rs.Open strSel,conn,3,3
        replay_content=Request.Form("Replay_content")
	    rs("replay")=replay_content
	    rs("replaydate")=date()
	    rs.Update
	    rs.close
	    Response.Redirect("?action=View_Words")
	  end if
    end if
  end if
  if Request.QueryString("action")="Admin_Login" then
    if Request.Cookies("admin_login")<>"true" then
	  if Request.Form("submit")="��½" then
	    strSel="select * from admin where name='"&Request.Form("admin_name")&"' and password='"&Request.Form("admin_pass")&"'"
	    rs.Open strSel,conn,3,3
		if rs.RecordCount>0 then
		 Response.Cookies("admin_login")="true"
		 Response.Redirect("?action=View_Words")
		end if
		rs.close
	  end if
	else
	 Response.Redirect("?action=View_Words")
	end if
  end if
  strSel="select * from guestbook"
  if Request.Form("Submit")="�ύ" then
     user=Request.Form("name")
	 email=Request.Form("email")
	 web=Request.Form("web")
	 title=Request.Form("title")
	 content=Request.Form("content")
	 admin=Request.Form("admin")
     iicon = request.form("icon")
     iface = request.form("face")
	 Rs.Open StrSel,conn,3,3
	 Rs.AddNew
     rs("icon") = iicon
     rs("face") = iface
	 Rs("name")=user
	 Rs("email")=email
	 Rs("web")=web
	 Rs("class")=title
	 Rs("content")=content
	 Rs("show")=admin
	 Rs.Update
	 Rs.Close
	 Response.Redirect("guestbook.asp")
   end if
   if Request.Cookies("admin_login")<>"true" then
      strSel=strSel&" where show=0"
   end if
   strSel=strSel&" order by id desc"
   rs.Open strSel,conn,3,3
%>
<script language="javascript">
  function check()
   {
     if (document.modpass.admin_pass.value!=document.modpass.admin_repass.value) {
	   alert("������������벻ͬ������������");
	   return false
	 }  
   }
</script>

<BODY BGCOLOR=#FFFFFF LEFTMARGIN=0 TOPMARGIN=0 MARGINWIDTH=0 MARGINHEIGHT=0>
<TABLE WIDTH=750 BORDER=0 align="center" CELLPADDING=0 CELLSPACING=0>
  <TR> 
    <TD><!--#include file="top.asp"--></TD>
</TR> </TABLE> 
<table cellspacing=0 cellpadding=0 width=750 border=0 align="center">
  <span id=tickettext style="DISPLAY: none"></span> <tbody> 
  <tr> 
    <td>&nbsp;</td>
  </tr>
  </tbody> 
</table>
<table width="750" align="center" cellpadding="0" cellspacing="1" class="bfont">

  <tr>
    <td height="22" valign="middle"><div style="display:none "><IMG src="images/link2.gif" 
            border=0>&nbsp;<A 
            href="?action=Add_New">�������</A>&nbsp;</div><p align="right"> <IMG src="images/link2.gif" 
            border=0>&nbsp;<A 
            href="?action=View_Words">�鿴����</A>&nbsp;<IMG 
            src="images/link2.gif" border=0>&nbsp;
            <%if Request.Cookies("admin_login")<>"true" then%>
            <A href="?action=Admin_Login">��������</A>
            <%else%>
            <A href="?action=out">�˳�����</A><IMG 
            src="images/link2.gif" border=0>&nbsp;<A href="?action=mod_pass">�޸�����</A>
            <%end if%>
            <br>
    </p></td>
  </tr>
  <tr>
    <td height="90" valign="top"><div align="center">
        <TABLE width=100% align=center cellPadding=1 cellSpacing=1 class="fontcolor" id="add_news" style="display:black">
          <FORM name=new   method=post>
            <TBODY>
              <TR>
                <TD width="179"   align="right">��������:</TD>
                <TD height="20" colspan="2"><div align="left">
                    <INPUT class=lanyu maxLength=14 name=name>
                    <FONT color=red>*</FONT></div></TD>
              </TR>
              <TR>
                <TD align="right">��������:</TD>
                <TD height="20" colspan="2"><div align="left">
                    <INPUT class=lanyu maxLength=30 name=email>
                </div></TD>
              </TR>
              <TR>
                <TD align="right">��ϵ�绰:</TD>
                <TD height="20" colspan="2"><div align="left">
                    <INPUT class=lanyu maxLength=15 name=web>
                </div></TD>
              </TR>
              <TR>
                <TD><p align="right">ѡ�����:</p>                </TD>
                <TD height="20" colspan="2"><table border="0" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber2" cellpadding="2">
                  <tr>
                    <input type="hidden" name="icon" value="1">
                    <td width="7%" align="center"> <img border="0" src="images/icon/1.gif" onclick="icon.value='1',nowicon.src='images/icon/1.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/2.gif" onclick="icon.value='2',nowicon.src='images/icon/2.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/3.gif" onclick="icon.value='3',nowicon.src='images/icon/3.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/4.gif" onclick="icon.value='4',nowicon.src='images/icon/4.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/5.gif" onclick="icon.value='5',nowicon.src='images/icon/5.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/6.gif" onclick="icon.value='6',nowicon.src='images/icon/6.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/7.gif" onclick="icon.value='7',nowicon.src='images/icon/7.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/8.gif" onclick="icon.value='8',nowicon.src='images/icon/8.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/9.gif" onclick="icon.value='9',nowicon.src='images/icon/9.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/10.gif" onclick="icon.value='10',nowicon.src='images/icon/10.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/11.gif" onclick="icon.value='11',nowicon.src='images/icon/11.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/12.gif" onclick="icon.value='12',nowicon.src='images/icon/12.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/13.gif" onclick="icon.value='13',nowicon.src='images/icon/13.gif'"></td>
                  </tr>
                  <tr>
                    <td width="7%" align="center"> <img border="0" src="images/icon/14.gif" onclick="icon.value='14',nowicon.src='images/icon/14.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/15.gif" onclick="icon.value='15',nowicon.src='images/icon/15.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/16.gif" onclick="icon.value='16',nowicon.src='images/icon/16.gif'"></td>
                    <td width="7%" align="center"> <img border="0" src="images/icon/17.gif" onclick="icon.value='17',nowicon.src='images/icon/17.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/18.gif" onclick="icon.value='18',nowicon.src='images/icon/18.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/19.gif" onclick="icon.value='19',nowicon.src='images/icon/19.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/20.gif" onclick="icon.value='20',nowicon.src='images/icon/20.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/21.gif" onclick="icon.value='21',nowicon.src='images/icon/21.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/22.gif" onclick="icon.value='22',nowicon.src='images/icon/22.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/23.gif" onclick="icon.value='23',nowicon.src='images/icon/23.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/24.gif" onclick="icon.value='24',nowicon.src='images/icon/24.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/25.gif" onclick="icon.value='25',nowicon.src='images/icon/25.gif'"></td>
                    <td width="8%" align="center"> <img border="0" src="images/icon/26.gif" onclick="icon.value='26',nowicon.src='images/icon/26.gif'"></td>
                  </tr>
                </table></TD>
              </TR>
              <TR>
                <TD><div align="right">ѡ��ͷ��:</div></TD>
                <TD height="20" colspan="2"><table border="0" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="100%" id="AutoNumber3">
                  <tr>
                    <input type="hidden" name="face" value="1">
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/1.gif" onclick="face.value='1',nowface.src='images/face/1.gif'"></div></td>
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/2.gif" onclick="face.value='2',nowface.src='images/face/2.gif'"></div></td>
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/3.gif" onclick="face.value='3',nowface.src='images/face/3.gif'"></div></td>
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/4.gif" onclick="face.value='4',nowface.src='images/face/4.gif'"></div></td>
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/5.gif" onclick="face.value='5',nowface.src='images/face/5.gif'"></div></td>
                    <td width="33" align="center"> <div align="center"><img border="0" src="images/face/6.gif" onclick="face.value='6',nowface.src='images/face/6.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/7.gif" width="32" height="32" border="0" onclick="face.value='7',nowface.src='images/face/7.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/8.gif" width="32" height="32" border="0" onclick="face.value='8',nowface.src='images/face/8.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/9.gif" width="32" height="32" border="0" onclick="face.value='9',nowface.src='images/face/9.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/10.gif" width="32" height="32" border="0" onclick="face.value='10',nowface.src='images/face/10.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/11.gif" width="32" height="32" border="0" onclick="face.value='11',nowface.src='images/face/11.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/12.gif" width="32" height="32" border="0" onclick="face.value='12',nowface.src='images/face/12.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/13.gif" width="32" height="32" border="0" onclick="face.value='13',nowface.src='images/face/13.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/14.gif" width="32" height="32" border="0" onclick="face.value='14',nowface.src='images/face/14.gif'"></div></td>
                    <td width="33" align="center"><div align="center"><img src="images/face/15.gif" width="32" height="32" border="0" onclick="face.value='15',nowface.src='images/face/15.gif'"></div></td>
                    </tr>
                </table></TD>
              </TR>
              <TR style="display:none">
                <TD align="right">����ѡ��:</TD>
                <TD colspan="2"><div align="left">
                    <INPUT type=radio CHECKED value=0 name=title>
                    <FONT 
                        color=#0000ff>����</FONT>
                    <INPUT type=radio value=1 
                        name=title>
                    <FONT color=#ff00ff>����</FONT>
                    <INPUT 
                        type=radio value=2 name=title>
                    <FONT 
                        color=#1e90ff>����</FONT></div></TD>
              </TR>
              <TR>
                <TD  align="right">��������: <BR></TD>
                <TD width="340" vAlign=top>                  <div align="left">
                    <TEXTAREA name=content cols=40 rows=6 class="lanyu" id=content ></TEXTAREA>
                </div></TD>
                <TD width="221" vAlign=top><table border="0" cellpadding="2" cellspacing="0" style="border-collapse: collapse" bordercolor="#111111" width="60%" id="AutoNumber6">
                  <tr>
                    <td width="45%" height="42">��ǰ����</td>
                    <td width="55%" align="center"> <img border="0" src="images/icon/1.gif" name="nowicon"></td>
                    </tr>
                  <tr>
                    <td>��ǰͷ��</td>
                    <td width="55%" align="center"><img border="0" src="images/face/1.gif" name="nowface"></td>
                  </tr>
                </table></TD>
              </TR>
              <TR>
                <TD  align="right">�Ƿ����أ�</TD>
                <TD colspan="2" vAlign=top><div align="left">
                    <INPUT type=radio CHECKED value=0 
                        name=admin>
                    ��
                    <INPUT type=radio value=1 name=admin>
                    ��&nbsp;&nbsp;<FONT color=#009900>*</FONT> ѡ�����غ󣬴�����ֻ�й���Ա���Կ�����</div></TD>
              </TR>
              <TR>
                <TD align=middle colSpan=3 height=40><INPUT type=hidden 
                        value=Add_New name=action_e>
                    <INPUT class=button type=submit value=�ύ name=Submit>
                  ��
                  <INPUT class=button type=reset value=��д name=Submit2>
                </TD>
              </TR>
          </FORM>
        </TABLE>
        <table  width=100% cellpadding="5" cellspacing="1" id="admin_login" style="display:none ">
          <FORM name=new action=?action=Admin_Login method=post>
            <TBODY>
              <tr bgcolor="#F7F7F7">
                <td colspan="2" align="middle"><div align="center">�����½ </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td  align="right" valign="top">�� ���� </td>
                <td width="226"><div align="left">
                    <input name="admin_name" type="text" class="lanyu">
                </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td  align="right" valign="top">�� �룺 </td>
                <td width="500"><div align="left">
                    <input name="admin_pass" type="text" class="lanyu">
                </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td colspan="2" align="right" valign="top"><div align="center">
                    <input name="Submit" type="submit" class="button" value="��½">
                </div></td>
              </tr>
              <tr>
                <td colspan="2"></td>
              </tr>
            </tbody>
          </FORM>
        </table>
        <table  width=100% cellpadding="5" cellspacing="1" id="mod_pass" style="display:none " >
          <FORM name=modpass  onSubmit="return(check())" method=post>
            <TBODY>
              <tr bgcolor="#F7F7F7">
                <td colspan="2"  align="right"><div align="center">�޸�����</div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td  align="right" valign="top">�� ���� </td>
                <td width="500"><div align="left">
                    <input name="admin_name" type="text" class="lanyu">
                </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td  align="right" valign="top">�� �룺 </td>
                <td width="226"><div align="left">
                    <input name="admin_pass" type="text" class="lanyu">
                </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td  align="right" valign="top">�� ֤ �� �룺</td>
                <td><div align="left">
                    <input name="admin_repass" type="text" class="lanyu" id="admin_repass">
                </div></td>
              </tr>
              <tr bgcolor="#F7F7F7">
                <td colspan="2" align="right" valign="top"><div align="center">
                    <input name="Submit" type="submit" class="button" value="�޸�">
                </div></td>
              </tr>
              <tr>
                <td colspan="2"></td>
              </tr>
            </tbody>
          </FORM>
        </table>
        <TABLE  width=100% align=center cellPadding=1 cellSpacing=0 class="fontcolor" id="replay_news" style="display:none ">
          <FORM name=new  method=post>
            <TBODY>
              <TR>
                <TD  vAlign=center  align="right">�ظ�����: <BR></TD>
                <TD width="500" vAlign=top>
                  <div align="left">
                    <TEXTAREA name=replay_content cols=40 rows=6 class="lanyu" id=content ></TEXTAREA>
                </div></TD>
              </TR>
              <TR>
                <TD align=middle colSpan=2 height=40><INPUT type=hidden 
                        value=Add_New name=action_e2>
                    <INPUT class=button type=submit value=�ύ name=Submit>
                  ��
                  <INPUT class=button type=reset value=��д name=Submit>
                </TD>
              </TR>
          </FORM>
        </TABLE>
        <TABLE  width=100% align=center cellPadding=0 cellSpacing=0 0class="fontcolor" id="view_news" style="display:none ">
          <TBODY>
            <TR>
              <td>
                <%
				page=Request.QueryString("page")
				if page="" then
				  page=1
				end if
				page=clng(page) 
				rs.pagesize=6
				if page<1 then page=1
				if page>rs.pagecount then    
                  page=rs.pagecount    
                end if
				 if rs.RecordCount<>0 then
				  rs.absolutePage=page  
				end if
				for i=1 to rs.pagesize
				  If rs.eof then exit for
				%>
                <TABLE  width=100% align=center cellPadding=0 cellSpacing=1 bgcolor="#EAEAEA" class="fontcolor">
                  <TBODY>
                    <TR>
                      <TD width="97" rowspan="2" vAlign=center bgcolor="#FAFAFA">
                    <div align="center" class="bfont"><img border="0" src="images/face/<%=rs("face")%>.gif" vspace="5"><br>
                      <%=rs("name")%>1</div>
                  </TD>
                      <TD height="20" vAlign=center bgcolor="#FAFAFA"><table width="100%"  border="0" cellspacing="0" cellpadding="0">
                          <tr>
                            
                        <td width="49%" class="bfont">�������ڣ�<%=rs("pubdate")%></td>
                            
                        <td width="51%"> 
                          <%if Request.Cookies("admin_login")="true" then%>
                          ��ϵ�绰:<%=rs("web")%>&nbsp;&nbsp;E_Mail:<%=rs("email")%> 
                          <%end if%>
                        </td>
                          </tr>
                      </table></TD>
                    </TR>
                    <TR>
                      <TD height="62" vAlign=middle bgcolor="#FFFFFF">
                    <div align="left"><span ><font color="#FFCC33" ><span class="bfont">�� 
                      <%
						 if rs("class")=0 then Response.Write("����")
						 if rs("class")=1 then Response.Write("����")
						 if rs("class")=2 then Response.Write("����")
						%>
                      ��<img border="0" src="images/icon/<%=rs("icon")%>.gif">&nbsp;</span></font></span><span class="bfont"><%=rs("content")%></span><br>
                      <br>
                      <span><font color="#3333FF"><span class="bfont"><font color="#FF0000">������Ա�ظ���</font></span></font><span class="bfont">��</span></span><font color="#FF0000"><span class="bfont"><%=rs("replay")%> 
                      </span></font></div>
                  </TD>
                    </TR>
                    <TR>
                      
                  <TD height=24 align=middle bgcolor="#FAFAFA">
<div align="center"></div></TD>
                      
                  <TD height=24 align=middle bgcolor="#FFFFFF"> 
                    <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                      <tr> 
                        <td class="bfont"> 
                          <div align="left">�ظ����ڣ�<%=rs("replaydate")%> </div>
                          
                        </td>
                      </tr>
                      <tr> 
                        <td class="bfont"> 
                          <div align="right"><a href="?action=del&id=<%=rs("id")%>"><img src="images/mofei_del.gif" width="52" height="16" border="0"></a><a href="?action=replay_news&id=<%=rs("id")%>"><img src="images/mofei_re.gif" width="45" height="18" border="0"></a></div>
                        </td>
                      </tr>
                    </table>
                  </TD>
                    </TR>
                </TABLE>
                
              <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <tr> 
                  <td>&nbsp;</td>
                </tr>
              </table>
              <%
				rs.Movenext
				next
				%>
              </td>
            </TR>
            <tr>
              <td>
                <table width="100%"  border="0" cellspacing="0" cellpadding="0">
                  <FORM name=new  method=get>
                    <tr>
                      <td align="right">
                        <%if page<=1 then%>
                        ��ҳ ��һҳ
                        <%else%>
                        <a href="?page=1">��ҳ</a> <a href="?page=<%=page-1%>">��һҳ</a>
                        <%end if%>
                        <%if page>=rs.PageCount then%>
                        ��һҳ ���һҳ
                        <%else%>
                        <a href="?page=<%=page+1%>">��һҳ</a> <a href="?page=<%=rs.PageCount%>">���һҳ</a>
                        <%end if%>
                        ת��
                        <input name="page" type="text" size="2">
                        ҳ
                        <input type="submit" class="button" name="Submit3" value="ȷ��"></td>
                    </tr>
                  </form>
              </table></td>
            </tr>
        </TABLE>
    </div></td>
  </tr>
</table>
<table width="750"  border="0" align="center" cellpadding="0" cellspacing="0"> 
<tr>
    <td><div align="center">
        <!--#include file="bottom.asp"-->
    </div></td>
  </tr>
</table>
<script language="javascript">
action='<%=Request.QueryString("action")%>';
if(action=="Add_New"){
  document.all.add_news.style.display="block"
}
else if(action=="Admin_Login"){
  document.all.admin_login.style.display="block"
}
else if(action=="replay_news"){
  document.all.replay_news.style.display="block"
}
else if(action=="mod_pass"){
  document.all.mod_pass.style.display="block"
}
else
{
  document.all.view_news.style.display="block"
}
</script>
<%rs.close%>
</BODY>
</HTML>