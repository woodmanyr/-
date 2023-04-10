<%
user_id=session("user_id")
user_name=session("user_name")
user_pass=session("user_pass")
user_group_id=session("user_group_id")

if user_id<>"" and user_name<>"" and user_pass<>"" and user_group_id=config(8) then
session("user_name")=user_name
session("user_pass")=user_pass
session("user_id")=user_id
session("user_grouop_id")=user_group_id
else
Response.Redirect("../public/error.asp")
end if

session.timeout=10
%>