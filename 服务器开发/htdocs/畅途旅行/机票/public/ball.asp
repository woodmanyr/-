<%
ball_id=request("ball_id")
dim ball(13)
sql = "SELECT * From ball where ball_id="&ball_id
set rs=conn.execute(sql)
ball(0)=rs("ball_id")
ball(1)=rs("team_class_id")
ball(2)=rs("ball_title")
ball(3)=rs("ball_starttime")
ball(4)=rs("Team_a")
ball(5)=rs("team_b") 
ball(6)=rs("ball_pl")
ball(7)=rs("ball_test")
ball(8)=rs("ball_xx")
ball(9)=rs("ball_cent_a")
ball(10)=rs("ball_cent_b")
ball(11)=rs("ball_addtime")
ball(12)=rs("ball_vip")
ball(13)=rs("ball_endtime")
rs.close
set rs=nothing
%>
