<% set conn=server.CreateObject("AdoDb.Connection")
str="Provider=Microsoft.Jet.OleDb.4.0;Data Source="&Server.MapPath("../datebase/plane.mdb")
'str="Provider=Microsoft.Jet.OleDb.4.0;Data Source=/datebase/holiday.mdb"
conn.Open str
site_name="�Ϻ���ҹ�Ǻ���Ʊ���������۲�[�ɻ�Ʊ���ʻ�Ʊ���ۻ�Ʊ�ؼۻ�Ʊ�Ϻ���Ʊ]"
%> 