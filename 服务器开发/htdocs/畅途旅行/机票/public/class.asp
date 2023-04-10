<%
if class_id<>"" then
dim tclass(1)
sql = "SELECT * From class where class_id="&class_id
set rs=conn.execute(sql)
tclass(0)=rs("class_id")
tclass(1)=rs("class_name")
rs.close
set rs=nothing
end if
%>
