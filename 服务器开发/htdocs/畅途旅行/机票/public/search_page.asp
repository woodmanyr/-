<table width='100%' border=0 cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle"> 
    <td height="18"> <div align="right"><font color=#FF9A00><strong><%=PageNo%></strong></font>/<font color=#FF9A00><strong><%=TotalPage%></strong></font> ҳ,<font color=#FF9A00><strong><%=config(3)%></strong></font>ƪ/ҳ 
        <%If rs.RecordCount = 0 or TotalPage = 1 Then 
Response.Write "��ǰֻ��һҳ"
Else%>
        <a href="<%=fileName%>?PageNo=1<%=hrefdate%>">�� 
        ҳ</a> | 
        <%If PageNo - 1 = 0 Then
Response.Write "��һҳ|"
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo-1%><%=hrefdate%>">��һҳ</a> 
        | 
        <%End If

If PageNo+1 > TotalPage Then
Response.Write " "
Else%>
        <a href="<%=fileName%>?PageNo=<%=PageNo+1%><%=hrefdate%>">��һҳ</a> 
        | 
        <%End If%>
        <a href="<%=fileName%>?PageNo=<%=TotalPage%><%=hrefdate%>">ĩ 
        ҳ</a> 
        <%End If%>
      </div></td>
    <td width="47">&nbsp;</td>
  </tr>
</table>
