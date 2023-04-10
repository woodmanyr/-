<%
cnt=0
dnt=0
s=Request.ServerVariables("path_translated")
Set objFSO = Server.CreateObject("Scripting.FileSystemObject")
cName=Server.MapPath("chy.cnt")
dName=Server.MapPath("dchy.cnt")
Set objCountFile = objFSO.OpenTextFile(cName,1,True)
If Not objCountFile.AtEndOfStream Then cnt=CLng(objCountFile.ReadAll)
objCountFile.Close
Set objCountFile=Nothing
cnt=cnt+1
Set objCountFile=objFSO.CreateTextFile(cName,True)
objCountFile.Write cnt
objCountFile.Close
Set objCountFile=Nothing

if application("dntime")<=cint(hour(time())) then
	Set objCountFile = objFSO.OpenTextFile(dName,1,True)
	If Not objCountFile.AtEndOfStream Then dnt=CLng(objCountFile.ReadAll)
	objCountFile.Close
	Set objCountFile=Nothing
end if
application("dntime")=cint(hour(time()))
dnt=dnt+1
Set objCountFile=objFSO.CreateTextFile(dName,True)
objCountFile.Write dnt
objCountFile.Close
Set objCountFile=Nothing
Set objFSO = Nothing

t=(cint(day(date()))*24+cint(hour(time())))*60+cint(minute(time()))
k=0
i=1
y=0
Do While application("zxip"&i)<>""
	if application("zxip"&i)=Request.ServerVariables("REMOTE_ADDR") then
		application("zxsj"&i)=t
		y=1
	end if
	if t-application("zxsj"&i)>9 or t<application("zxsj"&i) then
		k=k+1
	else
		if k>0 then
			application.lock
			application("zxip"&i-k)=application("zxip"&i)
			application("zxsj"&i-k)=application("zxsj"&i)
			application.unlock
		end if
	end if
	if k>0 then
		application.lock
		application("zxip"&i)=""
		application.unlock
	end if
	i=i+1
loop
if y=0 then
	application("zxip"&i)=Request.ServerVariables("REMOTE_ADDR")
	application("zxsj"&i)=t
else
	i=i-1
end if%> document.write('<table width="361" border="0" cellspacing="0" cellpadding="0" bordercolorlight="#CC33FF" bordercolordark="#FFFFFF">  <tr>    <td>            <div align="center">  访问总次数：<b><%=cnt%></b>|今日访问次数：<b><%=dnt%></b>|当前在线<b><%=i%></b>人</div>    </td>  </tr></table>') 