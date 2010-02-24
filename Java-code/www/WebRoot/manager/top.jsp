<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="java.sql.*"%>
<%
	String sUserName = (String) session.getAttribute("UserName");

%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>欢迎光临论坛</title>
<link rel=stylesheet type=text/css href="../lib/bbs.css">
<jsp:useBean scope="page" id="User" class="com.chapter12.User" />

<jsp:useBean scope="page" id="Email" class="com.chapter12.Email" />
</head>
<body bgcolor="#F5F5F5">
<div align="center">
<br>
<h1>欢迎光临论坛</h1>
<table width="90%">
<tr>
<td width="17%" height="30" align="center"><a href="./myFileManagement.jsp" target="mainFrame"><font color="#666666"><b>主页内容管理</b></font></a></td>
<td width="15%" height="30" align="center"><a href="./deal_with_contribution.jsp" target="mainFrame"><font color="#666666"><b>用户上传管理</b></font></a></td>
<td width="12%" height="30" align="center"><a href="./board_management.jsp" target="mainFrame"><font color="#666666"><b>讨论区管理</b></font></a></td>
<td width="25%" height="30" align="center"><a href="../email_management.jsp" target="mainFrame"><font color="#666666"><b>站内邮件管理
<%
        //获取当前用户的用户名
	Email.setReceiver(sUserName);
	//获取所有邮件信息
	ResultSet rs = Email.rec_list();
        
        int unReadCount=0;
       
        while(rs.next())
	{
            int iTag = rs.getInt("Tag");
            if(iTag == 0)
                {
                    unReadCount++;
                }
        }
        if(unReadCount!=0)%>
            
           (<%=unReadCount%>)
</b></font></a></td>
<td width="11%" height="30" align="center"><a href="../info_management.jsp" target="mainFrame"><font color="#666666"><b>资料管理</b></font></a></td>
<td width="13%" height="30" align="center"><font color="#666666"><b>欢迎您：</b></font><font color="#0000FF"><%=sUserName%></font></td>
<td width="7%" height="30" align="center"><a href="../logout.jsp" target="_top"><font color="#666666"><b>退出</b></font></a></td>
</tr>
</table>
</div>
</body>
</html>
