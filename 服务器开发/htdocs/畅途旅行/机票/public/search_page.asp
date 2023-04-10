<table width='100%' border=0 cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle"> 
    <td height="18"> <div align="right"><font color=#FF9A00><strong><%=PageNo%></strong></font>/<font color=#FF9A00><strong><%=TotalPage%></strong></font> 页,<font color=#FF9A00><strong><%=config(3)%></strong></font>篇/页 
        <%If rs.RecordCount = 0 or TotalPage = 1 Then 
Response.Write "当前只有一页"
Else%>
        <a href="<%=fileName%>?PageNo=1<%=hrefdate%>">首 
        页</a> | 
        <%If PageNo - 1 = 0 Then
Response.Write "上一页|"
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo-1%><%=hrefdate%>">上一页</a> 
        | 
        <%End If

If PageNo+1 > TotalPage Then
Response.Write " "
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo+1%><%=hrefdate%>">下一页</a> 
        | 
        <%End If%>
        <a href="<%=fileName%>?PageNo=<%=TotalPage%><%=hrefdate%>">末 
        页</a> 
        <%End If%>
      </div></td>
    <td width="47">&nbsp;</td>
  </tr>
</table>
