<%
'*******************************************************
'程序名称：ndbbs.com会员管理系统
'程序版本：VER 1.00 beta
'网站地址: HTTP://www.ndbbs.com
'程序脚本: asp
'运行环境: iis5.0+ access2000或PWS+access2000
'版权所有: Waner,zmz
'开发日期：2003年8月
'*******************************************************


dbname="date/news.mdb"	'数据库文件的名字，可以是任何有效名字，可以包含路径，例如db/news.mdb

'==========设定结束，以下不用修改，除非你知道怎么修改=============

	dim conn   
	dim connstr   

	connstr = "DBQ=" + server.mappath(dbname) + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
	set conn=server.createobject("ADODB.CONNECTION")
	
	if err.number<>0 then 
		err.clear
		set conn=nothing
		response.write "数据库连接出错！"
		Response.End
	else
		conn.open connstr
		if err then 
			err.clear
			set conn=nothing
			response.write "数据库连接出错！"
			Response.End 
		end if
	end if   
	
	sub endConnection()
		conn.close
		set conn=nothing
	end sub
	
%>
