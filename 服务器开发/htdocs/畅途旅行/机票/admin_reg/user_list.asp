<!--#include file="../inc/conn_reg.asp"-->
<!--#include file="../inc/config.asp"-->
<!--#include file="cf.asp"-->

<%
set rs=Server.CreateObject("Adodb.Recordset")
rs.open "SELECT * From user ORDER BY user_id DESC",conn,1,1 
'ɾ��
if request("del")="del" then
dsql="delete * from user where user_id="&request("user_id")
conn.execute dsql
response.write"<script>alert('�û��ѳɹ�ɾ����');location.href='user_list.asp?pageno="%><%=request("pageno")%><%response.write"';</Script>"
end if
%>
<head>
<LINK href="../images/site_css.css" rel=stylesheet type=text/css>
<LINK href="../images/style.css" rel=stylesheet type=text/css>
</head>
<BODY background=../images/BG1.gif bgColor=#ffffff leftMargin=0 topMargin=0>
<br>
<br>
<%
Dim TotalPage '��ҳ��
Dim PageNo '��ǰ��ʾ���ǵڼ�ҳ
Dim RecordCount '�ܼ�¼����
If RS.RecordCount=0 then
response.write "< P>< center>�Բ������ݿ���û�������Ϣ��< /center>< /P>"
response.end
else
RS.PageSize = config(3)
Totalpage=INT(RS.recordcount / rs.pagesize * -1)*-1 '�������ʾҳ�������
PageNo = Request.QueryString ("PageNo")
'ֱ������ҳ����ת��
If Request.Form("PageNo")<>"" Then PageNo = Request.Form("PageNo")
'���û��ѡ��ڼ�ҳ����Ĭ����ʾ��һҳ��
If PageNo = "" then PageNo = 1 
Rs.AbsolutePage = PageNo
End If

'��ȡ��ǰ�ļ�����ʹ��ÿ�η�ҳ���ڵ�ǰҳ����У�
Dim fileName,postion
fileName = Request.ServerVariables("script_name")
postion = InstrRev(fileName,"/")+1
'ȡ�õ�ǰ���ļ����ƣ�ʹ��ҳ������ָ��ǰ�ļ���
fileName = Mid(fileName,postion) 
Dim RowCount
RowCount = config(3) 'ÿҳ��ʾ�ļ�¼����
%>
&nbsp;&nbsp;&nbsp;&nbsp;�û��б�����: ���� <%=RS.recordcount%> ����¼<br><br>
<table width="95%" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#000000">
  <tr align="center" valign="middle"> 
    <td width="5%" bgcolor="#008306">���</td>
    <td width="13%" bgcolor="#008306">��Ա����</td>
    <td width="13%" bgcolor="#008306">�û���</td>
    <td width="8%" bgcolor="#008306">��ʵ����</td>
    <td width="5%" bgcolor="#008306">�Ա�</td>
    <td width="9%" bgcolor="#008306">�����ʼ�</td>
    <td width="19%" bgcolor="#008306">ע������</td>
    <td width="11%" bgcolor="#008306">�û���</td>
    <td width="17%" bgcolor="#008306">�༭</td>
  </tr>
  <%
Do while Not Rs.eof and RowCount>0
%>
  <tr align="center" valign="middle" bgcolor="#C9E393"> 
    <td width="5%"> <%=rs("user_id")%></td>
    <td width="13%"><%=rs("user_member")%></td>
    <td width="13%"><%=rs("user_name")%></td>
    <td width="8%"><%=rs("user_xm")%></td>
    <td width="5%"> 
      <%if rs("user_sex")=1 then response.write("��") else if rs("user_sex")=0 then response.write("Ů")  else response.write("<font color=red>��</font>") end if%>
    </td>
    <td width="9%"><a href="mailto:<%=rs("user_mail")%>">���ʼ�</a></td>
    <td width="19%"><%=rs("user_regtime")%></td>
    <td width="11%"> 
      <%
	set rs3=Server.CreateObject("Adodb.Recordset")
sql="SELECT * From user_group where user_group_id="&rs("user_group_id")
rs3.open sql,conn,1,3
		%>
      <%=rs3("user_group")%></td>
    <td width="17%"> [<a href="user_edit.asp?user_id=<%=rs("user_id")%>">�༭</a>] 
      [<a href="user_list.asp?user_id=<%=rs("user_id")%>&del=del&pageno=<%=pageno%>">ɾ��</a>]</td>
  </tr>
  <%
RowCount = RowCount - 1
Rs.MoveNext
Loop
%>
</table>
<br>
<br>
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr align="center" valign="middle"> 
      <td><!--#include file="../public/page.asp"-->
	</td>
      </tr>
</table>
<br>
<br>
