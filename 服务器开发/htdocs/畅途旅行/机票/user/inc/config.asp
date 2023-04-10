<%
dim config(9)
sql = "SELECT * From system" 
set rs=conn.execute(sql)
config(0)=rs("home_title")
config(1)=rs("home_link")
config(2)=rs("home_mail")
config(3)=rs("page_num")
config(4)=rs("admin_lk")
config(5)=rs("images_lk")
config(6)=rs("user_reg")
config(7)=rs("ts_time")
config(8)=rs("admin_group_id")
config(9)=rs("ball_time")
rs.close
Set rs=Nothing
%>