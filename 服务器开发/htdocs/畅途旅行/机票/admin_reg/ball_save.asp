<!--#include file="../inc/conn_reg.asp"-->
<%
set rs=Server.CreateObject("Adodb.Recordset")
'添加
if request("ball")="add" then
if trim(request("team_class_id"))<>"" and trim(request("ball_title"))<>"" and trim(request("ball_starttime"))<>"" and trim(request("team_a"))<>"" and trim(request("team_b"))<>"" and trim(request("ball_pl"))<>"" and trim(request("ball_test"))<>"" and trim(request("ball_xx"))<>"" and trim(request("ball_endtime"))<>"" then
	rs.open "select * from ball where ball_id is null",conn,1,3
			rs.addnew
			rs("team_class_id")=trim(request("team_class_id"))
			rs("ball_title")=trim(request("ball_title"))
			rs("ball_starttime")=formatdatetime(trim(request("ball_starttime")),4)
			rs("team_a")=trim(request("team_a"))
			rs("team_b")=trim(request("team_b"))
			rs("ball_pl")=trim(request("ball_pl"))
			rs("ball_test")=trim(request("ball_test"))
			rs("ball_xx")=trim(request("ball_xx"))
			rs("ball_addtime")=now()
			'rs("ball_endtime")=trim(request("ball_endtime"))
			rs("ball_endtime")=year(now())&"-"&month(now())&"-"&day(now())&" "&hour(now())+2&":"&minute(now())&":"&second(now())
			'VIP
			'if request.form("ball_vip")<>"" then rs("ball_vip")=true end if
	        'if request.form("ball_vip")="" then rs("ball_vip")=false end if
			rs("ball_vip")=true
			rs.update
	        response.write "<script>alert('球队心水添加成功！');location.href='ball_add.asp';</Script>"
		    Response.End
            rs.close
        else
            response.write"<script>alert('请填写所有信息');history.back();</script>"
end if
end if

'修改
if request("ball")="edit" then
if trim(request("team_class_id"))<>"" and trim(request("ball_title"))<>"" and trim(request("ball_starttime"))<>"" and trim(request("team_a"))<>"" and trim(request("team_b"))<>"" and trim(request("ball_pl"))<>"" and trim(request("ball_test"))<>"" and trim(request("ball_xx"))<>"" and trim(request("ball_endtime"))<>"" then
	rs.open "select * from ball where ball_id="&request("ball_id"),conn,1,3
			rs("team_class_id")=trim(request("team_class_id"))
			rs("ball_title")=trim(request("ball_title"))
			rs("ball_starttime")=formatdatetime(trim(request("ball_starttime")),4)
			rs("team_a")=trim(request("team_a"))
			rs("team_b")=trim(request("team_b"))
			rs("ball_pl")=trim(request("ball_pl"))
			rs("ball_test")=trim(request("ball_test"))
			rs("ball_xx")=trim(request("ball_xx"))
			'rs("ball_endtime")=trim(request("ball_endtime"))
			rs("ball_endtime")=year(now())&"-"&month(now())&"-"&day(now())&" "&hour(now())+2&":"&minute(now())&":"&second(now())
			'VIP
			'if request.form("ball_vip")<>"" then rs("ball_vip")=true end if
	        'if request.form("ball_vip")="" then rs("ball_vip")=false end if
			rs("ball_vip")=true
			rs.update
	        response.write "<script>alert('球队心水修改成功！');location.href='ball_list.asp';</Script>"
		    Response.End
            rs.close
        else
            response.write"<script>alert('请填写所有信息');history.back();</script>"
end if
end if

'结果添加
if request("ball")="end" then
if trim(request("ball_cent_a"))<>"" and trim(request("ball_cent_b"))<>"" then
	rs.open "select * from ball where ball_id="&request("ball_id"),conn,1,3
			rs("ball_cent_a")=trim(request("ball_cent_a"))
			rs("ball_cent_b")=trim(request("ball_cent_b"))
			rs.update
	        response.write "<script>alert('球队心水结果修改成功！');location.href='ball_list.asp';</Script>"
		    Response.End
            rs.close
        else
            response.write"<script>alert('请填写比分');history.back();</script>"
end if
end if
%>