<%
if request("news_id")<>"" then
news_id=request("news_id")
set nrs=Server.CreateObject("Adodb.Recordset")
sql="SELECT * From news where news_id="&news_id
nrs.open sql,conn,1,3
news_hits=nrs("news_hits")
nrs("news_hits")=news_hits+1
nrs.update
nrs.close
dim news(10)
sql = "SELECT * From news where news_id="&news_id
set rs=conn.execute(sql)
news(0)=rs("news_id")
news(1)=rs("nclass_id")
news(2)=rs("news_title")
news(3)=rs("news_type")
news(4)=rs("news_link")
news(5)=rs("news_from") 
news(6)=rs("news_writer")
news(7)=rs("news_hits")
news(8)=rs("news_date")
news(9)=rs("news_images")
news(10)=rs("news_vip")
rs.close
set rs=nothing
end if
%>
