<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������̳</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" />
	</head>
	<body>
<%
	//��ȡ��ǰ�û����û���
	String sUserName = (String) session.getAttribute("UserName");
	//��ȡ�����ʼ���Ϣ
	ResultSet rs = UpFile.showAll();	
%>

	<div align="center"><br>
	<form name="form1" method="post" action="delete_contribution.jsp" target="_self">
	<table width="95%" border="0" cellpadding="0" cellspacing="1">
	<tbody>
           
	<tr bgcolor="#F5F5F5">
		<th width="6%" height="30" align="center">ѡ��</th>
		<th width="6%" height="30" align="center">���</th>
		<th width="10%" height="30" align="center">״̬</th>
		<th width="15%" height="30" align="center">�ϴ���</th>
		<th width="43%" height="30" align="center">�ϴ�˵��</th>
		<th width="20%" height="30" align="center">�ϴ�URL</th>
	</tr>
<%
	int i=0;
	//ѭ����ʾ�ϴ���Ϣ
	while(rs.next())
	{
		i++;
	%>
		<tr>
		<td width="6%" height="25" align="center"><input name="DeleteID" type="checkBox" value='<%=rs.getLong("FileID")%>'></td>
		<td width="6%" height="25" align="center"><%=i%></td>
		<td width="10%" height="25" align="center">
	<%
		int iTag = rs.getInt("tag");
		if(iTag == 0)
		{
			out.println("<font color=red>δ�������</font>");
		}
		else
		{
			out.println("<font color=blue>���������</font>");
		}
	%>&nbsp;
		</td>
		<td width="15%" height="25" align="center"><%=rs.getString("sender")%></td>
		<td width="43%" height="25" align="left">&nbsp;<a href="download_contribution.jsp?FileURL=<%=rs.getString("FileURL")%>" target="_self"><font color="#0000FF"><%=rs.getString("fileInfo")%></font></a></td>
		<td width="20%" height="25" align="center"><%=rs.getString("FileURL")%></td>
		</tr>
	<%//target="_self"+UpFile.getFileURL()
	}
	%>
	</tbody>
	</table>
	<p>
        <!--<a href="./download_contribution.jsp"><font color="#0000FF">[�����ļ�]</font></a>&nbsp;&nbsp;&nbsp;&nbsp;-->
	<a href="javascript:form1.submit()"><font color="#0000FF">[ɾ��ѡ���ļ�]</font></a>&nbsp;&nbsp;&nbsp;&nbsp;
	</p>
	</form>
	</div>
	</body>
</html>
