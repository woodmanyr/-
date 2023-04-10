<!--#include file="../inc/conn1.asp"-->
<%
   set rs_ding=Server.CreateObject("ADODB.Recordset")
   set rs_good=Server.CreateObject("ADODB.Recordset")
   strSel="Select * from dinggao where hangban='guonei'"
   rs_ding.Open strSel,conn,3,2
if Request.Form("submit")="确 定" then
   flag=Request.Form("ok")="" 
   if flag ="" then 
     flag="否"
	end if
   rs_ding("flag")=flag
   rs_ding.UpDate
 end if
 if Request.Form("submit2")="推 荐" then
 for i=1 to Request.Form("hidden").count
   strSel="Select id,flag from address where id="&Request.Form("hidden")(i)
   rs_good.Open strSel,conn,3,2
   if Request.Form("good"&i)<>""then
    rs_good("flag")=1
   else
    rs_good("flag")=0
   end if
   rs_good.UpDate
   rs_good.close
 next
 end if


 if Request.Form("submit")="价格修改" then
 for i=1 to Request.Form("hidden").count
   strSel="Select * from holiday1 where id="&Request.Form("hidden")(i)
   rs_good.Open strSel,conn,3,2
    rs_good("price")=Request.Form("price"&i) 
	rs_good("minprice")=Request.Form("minprice"&i) 
   rs_good.UpDate
   rs_good.close
 next
 end if
 
page=request("page")
if page="" then
page=1
end if

address=request("address")
if Request.Form("search")<>"" then 
address=request.Form("address")
 RESPONSE.REDIRECT("?address="&address)
 end if
 
Set rs = Server.CreateObject("ADODB.RecordSet")
sql = "select * from address"
sql=sql& " where address like '%"& address &"%'"
sql=sql &" order by  flag desc,address,fromtime asc" 
rs.open sql,conn,3,2

%>

<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta name="GENERATOR" content="Microsoft FrontPage 4.0">
<link rel="stylesheet" href="../inc/css.css" type="text/css">
<meta name="ProgId" content="FrontPage.Editor.Document">
<style type="text/css">
A:link {COLOR: blue; TEXT-DECORATION: none}
A:visited {COLOR: red;TEXT-DECORATION: none}
A:active {COLOR: red; TEXT-DECORATION: none}
A:hover {COLOR: #ff0000; TEXT-DECORATION: none}
A:hover {color:#ff0000;}
a:link.a01 {text-decoration:none;color:#FFFFFF;}
a:visited.a01 {text-decoration:none;color:#FFFFFF;}
a:active.a01 {text-decoration:none;color:#FFFFFF;}
a:hover.a01 {text-decoration:none;color:#505050;}
BODY {FONT-FAMILY: 宋体; FONT-SIZE: 9pt}
TH {FONT-SIZE: 9pt}
TD {FONT-SIZE: 9pt}
.small {font-size:9pt;line-height:13pt;}
.text {
	font-size: 12px;
	line-height: 20px;
	color: #CC0000;
}
.l15{line-height:150%}
</style>
<title><%=site_name%></title>
<link href="../inc/css1.css" rel="stylesheet" type="text/css">
</head>

<body topmargin="0" leftmargin="0"  class=body>
<form method="post">
<table border="0" cellpadding="0" cellspacing="0" width="100%">
  <tr> 
    <td valign="top"> <table border="0" cellpadding="0" cellspacing="0" width="100%" height="26">
        <tr> 
          <td width="100%" height="14"> <div align="center"> 
                <table border="1" cellpadding="0" cellspacing="0" width="70%" bordercolorlight="#0A5092" bordercolordark="#FFFFFF" height="134">
                  <tr> 
                    <td width="50%" bgcolor="#FFFFFF" height="20"> 
                      <p align="left"><a href="guonei_address_add.asp">定购 
                        <input type="checkbox" <%if rs_ding("flag")=0 then %> checked <%end if%> name="ok"  value="是">
                        <input type="submit" name="Submit3" value="确 定">
                        </a>
                    </td>
                    <td width="50%" bgcolor="#FFFFFF" height="20">
                      <div align="right"><a href="guonei_address_add.asp">添加目的地&gt;&gt;&gt;</a> 
                      </div>
                    </td>
                  </tr>
                  <tr> 
                    <td bgcolor="#FFFFFF" height="10" colspan="2"> 
                      <div align="center"> 城市： 
                        <input name="address" type="text" id="address" size="12">
                        <input type="submit" name="Submit" value="查询">
                      </div>
                    </td>
                  </tr>
                  <tr> 
                    <td width="100%" bgcolor="#E9EEF8" height="20" colspan="2"> 
                      <p align="center">国内目的地管理 
                    </td>
                  </tr>
                  <tr> 
                    <td width="100%" height="46" valign="top" colspan="2"> 
                      <table border="0" cellspacing="1" width="100%">
                        <tr> 
                          <td width="55%" bgcolor="#0A5092"> 
                            <p align="center"><font color="#FFFFFF">目的地</font></p>
                          </td>
                          <td width="20%" bgcolor="#0A5092"> 
                            <p align="center"><font color="#FFFFFF">操作</font></p>
                          </td>
                          <td width="20%" bgcolor="#0A5092"> 
                            <div align="center"><span class="样式1"><font color="#FFFFFF">推荐</font></span></div>
                          </td>
                        </tr>
                        <%
rs.pagesize=30    
page=clng(page)    
if page>rs.pagecount then    
page=rs.pagecount    
end if    
if page<1 then    
page=1    
end if 
if Not rs.Eof  then rs.absolutePage=page    
for ipage=1 to rs.pagesize  
if rs.Eof then exit for
                %>
                        <tr> 
                          <td width="55%"> 
                            <p align="center"><%=rs("address")%> 
                          </td>
                          <td width="20%"> 
                            <p align="center"><a href="guonei_address_edit.asp?id=<%=rs("id")%>">[修改]</a><a href="guonei_address_del.asp?id=<%=rs("id")%>">[删除]</a></p>
                          </td>
                          <td width="20%"> 
                            <div align="center"> 
                              <input name="good<%=ipage%>" type="checkbox" value="<%=rs("id")%>"  <%if rs("flag")=1 then %>checked<%end if%>>
                              <input name="hidden" type="hidden" value="<%=rs("id")%>">
                            </div>
                          </td>
                        </tr>
                        <%
                rs.movenext
                If rs.eof then exit for
                next
                %>
                      </table>
                    </td>
                  </tr>
                  <tr> 
                    <td width="100%" height="26" valign="middle" colspan="2"> 
                      <div align="right"> 
                        <input name="Submit2" type="submit" id="Submit" value="价格修改">
                        <input type="submit" name="Submit2" value="推 荐">
                      </div>
                    </td>
                  </tr>
                  <tr> 
                    <td width="100%" height="26" valign="middle" colspan="2"> 
                      <p align="center"><font color="#333333"><b>共 <font color="#990000"><%=rs.pagecount%> 
                        </font> 页 </b>&nbsp;<font face="webdings"><a href="guonei_address.asp?page=1"><font color="#484848">9</font></a></font> 
                        <font face="webdings"><a href="guonei_address.asp?page=<%=page-1%>"><font color="#484848">7</font></a></font>[ 
                        <%
      for i=1 to rs.pagecount
      if i=page then
      response.write "<font color=""#990000""><b>"&page&"&nbsp;</b></font>"
      else
      response.write "<A HREF=guonei_address.asp?page="&i&">"&"<font color=#000000>"&i&"</font>"&"</A>&nbsp;"
      end if
      next
      
     
            %>
                        ]<font face="webdings"><a href="guonei_address.asp?page=<%=page+1%>"><font color="#484848">8</font></a></font> 
                        <font face="webdings"><a href="guonei_address.asp?page=<%=rs.PageCount%>"><font color="#484848">:</font></a> 
                        </font><b>&nbsp; 当前第 <font color="#990000"><%=page%> </font> 
                        页</b></font> 
                    </td>
                  </tr>
                </table>
            </div></td>
        </tr>
      </table></td>
  </tr>
</table>
</form>
</body>

</html>
