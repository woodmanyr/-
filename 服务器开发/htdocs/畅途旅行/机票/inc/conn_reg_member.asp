<%
'*******************************************************
'�������ƣ�ndbbs.com��Ա����ϵͳ
'����汾��VER 1.00 beta
'��վ��ַ: HTTP://www.ndbbs.com
'����ű�: asp
'���л���: iis5.0+ access2000��PWS+access2000
'��Ȩ����: Waner,zmz
'�������ڣ�2003��8��
'*******************************************************


dbname="date/news.mdb"	'���ݿ��ļ������֣��������κ���Ч���֣����԰���·��������db/news.mdb

'==========�趨���������²����޸ģ�������֪����ô�޸�=============

	dim conn   
	dim connstr   

	connstr = "DBQ=" + server.mappath(dbname) + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
	set conn=server.createobject("ADODB.CONNECTION")
	
	if err.number<>0 then 
		err.clear
		set conn=nothing
		response.write "���ݿ����ӳ���"
		Response.End
	else
		conn.open connstr
		if err then 
			err.clear
			set conn=nothing
			response.write "���ݿ����ӳ���"
			Response.End 
		end if
	end if   
	
	sub endConnection()
		conn.close
		set conn=nothing
	end sub
	
%>
