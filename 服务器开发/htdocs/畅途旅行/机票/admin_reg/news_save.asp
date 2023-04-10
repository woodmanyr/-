<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="../inc/char.asp"-->
<!--#include file="cfc.asp"-->
<%
	founderr=false
	if trim(request.form("news_title"))="" then
  		founderr=true
  		errmsg="<li>文章标题不能为空</li>"
	end if
	if trim(request.form("news_type"))="" then
  		founderr=true
  		errmsg=errmsg+"<li>文章内容不能为空</li>"
	end if
	if trim(request.form("nclass_id"))="" then
  		founderr=true
  		errmsg=errmsg+"<li>文章分类不能为空</li>"
	end if
	'if trim(request.form("news_writer"))="" then
  '		founderr=true
  '		errmsg=errmsg+"<li>文章作者不能为空</li>"
'	end if
	
	if founderr=false then
		news_title=htmlencode(request.form("news_title"))
		nclass_id=request.form("nclass_id")
	   
	   if request("news_writer")<>"" then
    news_writer=request.form("news_writer")
end if
	
		if request("html")="true" then
		news_type=htmlencode2(request("news_type"))
		else
		news_type=ubbcode(request.form("news_type"))
		end if

	set rs=server.createobject("adodb.recordset")
	if request("news_add_add")="save" then
		call new_news()
	elseif request("news_add_add")="edit" then
		call edit_news()
	else
		founderr=true
		errmsg=errmsg+"<li>没有选定参数</li>"
	end if
sub new_news()
	sql="select * from news where (news_id is null)" 
	rs.open sql,conn,1,3
	rs.addnew
	rs("news_title")=news_title
	rs("news_type")=news_type
	'rs("news_link")=request("news_link")
	rs("nclass_id")=nclass_id
	if request("news_writer")<>"" then rs("news_writer")=news_writer end if
	rs("news_hits")=0
	rs("news_add")=request("news_add")
	if news_type<>"" then
		rs("news_type")=trim(request.form("news_type"))
	end if
	if request.form("news_from")<>"" then
		rs("news_from")=trim(request.form("news_from"))
	end if
	if request.form("news_images")<>"" then
		rs("news_images")=trim(request.form("news_images"))
	end if
	if request.form("news_link")<>"" then
		rs("news_link")=trim(request.form("news_link"))
	end if
	if request.form("news_vip")<>"" then rs("news_vip")=true end if
	if request.form("news_vip")="" then rs("news_vip")=false end if
	rs("news_date")=now()
	rs.update
	response.write "<script>alert('文章添加成功！');location.href='news_add.asp';</Script>"
end sub

sub edit_news()
	sql="select * from news where news_id="&request("news_id")
	rs.open sql,conn,1,3
	rs("news_title")=news_title
	rs("news_type")=news_type	
	'if news_type<>"" then rs("news_type")=news_type end if
	rs("nclass_id")=nclass_id
	if request("news_writer")<>"" then rs("news_writer")=news_writer end if
	'rs("news_link")=trim(request.form("news_link"))
	if request.form("news_link")<>"" then
		rs("news_link")=trim(request.form("news_link"))
	end if
	if request.form("news_from")<>"" then
		rs("news_from")=trim(request.form("news_from"))
	end if
	if request.form("news_images")<>"" then
		rs("news_images")=trim(request.form("news_images"))
	end if
	if request.form("news_vip")<>"" then rs("news_vip")=true end if
	if request.form("news_vip")="" then rs("news_vip")=false end if
	rs.update
	response.write "<script>alert('文章修改成功！');location.href='news_list.asp';</Script>"
end sub

	rs.close
	set rs=nothing
	conn.close
	set conn=nothing
%>
<html>

<head>
<title></title>
<link rel="stylesheet" type="text/css" href="../inc/style.css">

</head>

<body>
<div align="center"><center>
<br><br>
<table class="border" align=center width="50%" border="0" cellpadding="4" cellspacing="0" bordercolor="#999999">
  <tr align=center>
    <td width="100%" class="title"  height="20"><b>
<%if request("news_add_add")="save" then%>添加<%else%>修改<%end if%>文章成功</b></td>
  </tr>
  <tr>
    <td class="tdbg"><p align="left"><br>
          文章标题为：<%response.write news_title%></p>
	</p>
		  您可以进行其他操作
    </td>
  </tr>
</table>
</center></div>
<%
else
	Error()
end if
%>

</body>
</html>
<%
sub Error()
	response.write "   <html><head><link rel='stylesheet' href='../inc/style.css'></head><body background='../images/bg.jpg'>"
    	response.write "   <br><br><br>"
    	response.write "    <table align='center' width='300' border='0' cellpadding='3' cellspacing='1' bgcolor='#000000'>"
    	response.write "      <tr > "
    	response.write "        <td align='center' bgcolor='#008306' height='26'> "
    	response.write "          <div align='center'>由于以下的原因不能保存数据!</div>"
    	response.write "        </td>"
    	response.write "      </tr>"
    	response.write "      <tr> "
    	response.write "        <td align='center' bgcolor='#C9E393' height='23'> "
    	response.write "          <br>"
    	response.write errmsg& " <br><br>"
    	response.write "        <a href='javascript:onclick=history.go(-1)'>返回</a>"        
    	response.write "        <br><br></td>"
    	response.write "      </tr>   </table></body></html>" 
end sub
%>