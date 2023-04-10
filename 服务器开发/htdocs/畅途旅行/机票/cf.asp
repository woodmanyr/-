<%
user_id=session("user_id")
user_name=session("user_name")
user_pass=session("user_pass")
user_group_id=session("user_group_id")

if user_id="" or user_name="" or user_pass="" then
Response.Redirect("../public/error.asp")
else
session("user_name")=user_name
session("user_pass")=user_pass
session("user_id")=user_id
session("user_grouop_id")=user_group_id
end if

session.timeout=10
%>