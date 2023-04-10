<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cfc.asp"-->
<!--#include file="../public/user.asp"-->
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
<script src="../js/Popup.js"></script>
</head>

<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<table width="98%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td align="center" valign="middle">
	<form name="search" method="post" action="news_search_list.asp">
        <table width="80%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
          <tr> 
            <td height="26" colspan="2" align="center" valign="middle" bgcolor="#008306"><strong>文章搜索 
              <font color="#FFFFFF">所有项目如不要求则留空</font></strong></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td width="16%" height="24" align="center" valign="middle">文章类别:</td>
            <td width="84%" height="24" align="center" valign="middle"> <div align="left"> 
                <select name="nclass_id" id="select2">
                  <option selected value="">请选择类别</option>
                  <%  dim rs1
set rs1=server.createobject("adodb.recordset")
rs1.open "select * from nclass where nclass_id in("&user(22)&")",conn,1,3
  do while not rs1.eof                        
        %>
                  <option value="<%=trim(rs1("nclass_id"))%>"><%=trim(rs1("nclass_name"))%></option>
                  <%                        
        rs1.movenext                        
        loop                        
        rs1.close                        
        %>
                </select>
              </div></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="24" align="center" valign="middle">文章标题:</td>
            <td height="24" align="center" valign="middle"> <div align="left"> 
                <input name="news_title" type="text" id="news_title5" size="50">
              </div></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="24" align="center" valign="middle">文章连接:</td>
            <td height="24" align="center" valign="middle"> <div align="left"> 
                <input name="news_link" type="text" id="news_link3" size="50">
              </div></td>
          </tr>
          <tr bgcolor="#C9E393">
            <td height="24" align="center" valign="middle"> 
              <p>发布日期:</p>
              </td>
            <td height="24" align="center" valign="middle"><div align="left">
                <input name="news_date" type="text" id="news_date" size="10"> 
              &nbsp; <a href=# title="选择日期" onClick="fPopUpDlg('../js/calendar.htm', document.search.news_date, 'winpop', 177, 210);return false"><img src="../images/datetime.GIF" width="16" height="16" border=0></a> 
              &lt;- 点这个小图选日期</div></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="24" align="center" valign="middle">文章作者:</td>
            <td height="24" align="center" valign="middle"> <div align="left"> 
                <input name="news_writer" type="text" id="news_writer3" size="15">
              </div></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="24" align="center" valign="middle">文章来源:</td>
            <td height="24" align="center" valign="middle"> <div align="left"> 
                <input name="news_from" type="text" id="news_from2" size="30">
              </div></td>
          </tr>
          <tr bgcolor="#C9E393"> 
            <td height="24" colspan="2"> <div align="center"> 
                <input type="hidden" name="news_search" value="save">
                <input type="submit" name="Submit" value=" 搜索文章 ">
              </div></td>
          </tr>
        </table>
</form></td>
  </tr>
</table>
</body>

