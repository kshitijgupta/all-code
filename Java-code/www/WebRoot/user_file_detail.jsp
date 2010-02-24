<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.sql.*" import = "java.io.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />
<%
	//获得要显示的文章的参数，并将它转为整型值
	String sFileID = request.getParameter("FileID");
	long lFileID = Long.parseLong(sFileID);
	
	//获得主题文章信息
	MyFile.setFileID(lFileID);
	MyFile.init();
	
	int count=1;
%>
<link href="default.css" rel="stylesheet" type="text/css" />
	</head>
	<body>
                   <div id="header">
	<h1><a href="#">化学</a></h1>
	<!--<h2><a href="http://www.freecsstemplates.org/">by Free Css Templates </a></h2>-->
</div>
<div id="content"></div>
	<div align="center"><br>
	<table width="90%" border="1" cellpadding="0" cellspacing="0" bordercolor="#E1E1E1">
	<tr bgcolor="#F5F5F5">
	<td width="95%" height="20" align="left">
	</td>
	<td width="5%" height="20" align="center"><font color="#0000FF"><%=count++%></font></td>
	</tr>
	<tr bgcolor="#FFFFFF">
	<td width="100%" align="left" colspan="2">
	&nbsp;文章标题：<font color="#0000FF"><%=MyFile.getFileTitle()%></font><br>
	&nbsp;发文时间：<font color="#0000FF"><%=MyFile.getCreateTime()%></font><br><br>
	<%
	String sContent = MyFile.getFileContent();
	sContent = sContent.replaceAll("\r\n","<br>");
	out.println("&nbsp;"+sContent);
	%>
	<br>
	<%
		//获得当前文章对应附件的保存文件名
		if(MyFile.getFileURL().indexOf(".")>-1)
		{
                  
                     
	%>
                        <br>&nbsp;附件：<a href='./download_file.jsp?FileURL=<%=MyFile.getFileURL()%>'><%=MyFile.getFileURL()%>点击下载</a><br>
			&nbsp;
	<%      
		}
                else
                {
	 		out.println("&nbsp;<font color=blue>无附件</font>");
		}
	%>
	</td>
	</tr>
	</table>
	
	<br>
	<br>
	</div>
        <input type="button" name="btn" value="返回" onClick="javascript:window.history.go(-1)">
	</body>
</html>
