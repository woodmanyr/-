<table width='100%' border=0 cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle"> 
    <td height="18"> <div align="right"><font color=#FF9A00><strong><%=PageNo%></strong></font>/<font color=#FF9A00><strong><%=TotalPage%></strong></font> ҳ,<font color=#FF9A00><strong><%=pagenum%></strong></font>ƪ/ҳ &nbsp;&nbsp;
	<%if request("news_day")<>"" then
news_date="news_day"
end if
if request("news_month")<>"" then
news_date="news_month"
end if
if request("news_year")<>"" then
news_date="news_year"
end if
if request("class_id")<>"" then
classid=request("class_id")
end if
if request("nclass_id")<>"" then
nclassid=request("nclass_id")
end if%>
        <%If rs.RecordCount = 0 or TotalPage = 1 Then 
Response.Write "��ǰֻ��һҳ"
Else%>
        <a href="<%=fileName%>?PageNo=1&pagenum=<%=pagenum%><%if news_date<>"" then%>&<%response.write ""&news_date&"=1"%><%end if%><%if request("class_id")<>"" then response.write "&class_id="+classid+"" end if%><%if request("nclass_id")<>"" then response.write "&nclass_id="+nclassid+"" end if%>">�� 
        ҳ</a> | 
        <%If PageNo - 1 = 0 Then
Response.Write ""
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo-1%>&pagenum=<%=pagenum%><%if news_date<>"" then%>&<%response.write ""&news_date&"=1"%><%end if%><%if request("class_id")<>"" then response.write "&class_id="+classid+"" end if%><%if request("nclass_id")<>"" then response.write "&nclass_id="+nclassid+"" end if%>">��һҳ</a> 
        | 
        <%End If

If PageNo+1 > TotalPage Then
Response.Write " "
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo+1%>&pagenum=<%=pagenum%><%if news_date<>"" then%>&<%response.write ""&news_date&"=1"%><%end if%><%if request("class_id")<>"" then response.write "&class_id="+classid+"" end if%><%if request("nclass_id")<>"" then response.write "&nclass_id="+nclassid+"" end if%>">��һҳ</a> 
        | 
        <%End If%>
        <a href="<%=fileName%>?PageNo=<%=TotalPage%>&pagenum=<%=pagenum%><%if news_date<>"" then%>&<%response.write ""&news_date&"=1"%><%end if%><%if request("class_id")<>"" then response.write "&class_id="+classid+"" end if%><%if request("nclass_id")<>"" then response.write "&nclass_id="+nclassid+"" end if%>">ĩ 
        ҳ</a> 
        <%End If%>
      </div></td>
    <td width="47">&nbsp;</td>
  </tr>
</table>
