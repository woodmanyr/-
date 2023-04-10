<% set conn=server.CreateObject("AdoDb.Connection")
str="Provider=Microsoft.Jet.OleDb.4.0;Data Source="&Server.MapPath("datebase/plane.mdb")
'str="Provider=Microsoft.Jet.OleDb.4.0;Data Source=datebase/plane.mdb"
conn.Open str
site_name="上海不夜城航空售票[飞机票 国际机票 打折机票 特价机票 上海机票]"
%> 