<%@ page contentType="text/html; charset=gb2312" language="java"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="User" class="com.chapter12.User" />
	</head>
	<%String sUserName = (String) session.getAttribute("UserName");
if(sUserName==null) 
  response.sendRedirect("error.jsp");  
%>
	<frameset frameborder="1" frameSpacing="1" border="1" rows="120,*">
		<frame name="topFrame" src="./top.jsp" MARGINWIDTH=1 MARGINHEIGHT=1
			noresize>
		<frame name="mainFrame" marginwidth="4" marginheight="1"
			src="./board_management.jsp">
	</frameset>

	<noframes>
		<body bgcolor="#F5F5F5">
			<h1 align="center">
				浏览器要求支持框架集
			</h1>
		</body>
	</noframes>
</html>
