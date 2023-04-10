<%
if nclass_id<>"" then
dim nclass(2)
sql = "SELECT * From nclass where nclass_id="&nclass_id
set rs=conn.execute(sql)
nclass(0)=rs("nclass_id")
nclass(1)=rs("class_id")
nclass(2)=rs("nclass_name")
rs.close
set rs=nothing
end if
%>
