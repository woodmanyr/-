<% set conn=server.CreateObject("AdoDb.Connection")
str="Provider=Microsoft.Jet.OleDb.4.0;Data Source="&Server.MapPath("../datebase/plane.mdb")
'str="Provider=Microsoft.Jet.OleDb.4.0;Data Source=../datebase/plane.mdb"
conn.Open str
site_name="�Ϻ�����Ʊ���������۲�[�ɻ�Ʊ���ʻ�Ʊ���ۻ�Ʊ�ؼۻ�Ʊ�Ϻ���Ʊ]"
%> 