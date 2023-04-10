<% set conn=server.CreateObject("AdoDb.Connection")
str="Provider=Microsoft.Jet.OleDb.4.0;Data Source="&Server.MapPath("../datebase/plane.mdb")
'str="Provider=Microsoft.Jet.OleDb.4.0;Data Source=/datebase/holiday.mdb"
conn.Open str
site_name="上海不夜城航空票务中心销售部[飞机票国际机票打折机票特价机票上海机票]"
%> 