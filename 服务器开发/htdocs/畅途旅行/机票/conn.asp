<%
'*******************************************************
'�������ƣ�ndbbs.com���Ź���ϵͳ
'����汾��VER 1.00 beta
'��վ��ַ: HTTP://www.ndbbs.com
'����ű�: asp
'���л���: iis5.0+ access2000��PWS+access2000
'��Ȩ����: Waner
'�������ڣ�2003��8��
'*******************************************************


dbname="date/news.mdb"	'���ݿ��ļ������֣��������κ���Ч���֣����԰���·��������db/news.mdb

'==========�趨���������²����޸ģ�������֪����ô�޸�=============

	dim conn   
	dim connstr   
	connstr = "DBQ=" + server.mappath(dbname) + ";DefaultDir=;DRIVER={Microsoft Access Driver (*.mdb)};"       
	set conn=server.createobject("ADODB.CONNECTION")
	
	conn.Open connstr

	function rsclose
	set rs=nothing
	end function

	function connclose
	conn.close
	set conn=nothing
	end function
	
%>
