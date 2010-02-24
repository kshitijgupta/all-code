<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.io.File.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />

	</head>
	<body>
	<div align="center"><br>    
            
<%
	//获取所要删除的id号
	String sFileID = request.getParameter("FileID");	
     
   //获得当前绝对路径
    String path=request.getRealPath("");
       // out.print(""+sFileID +"       "  + path);
	//删除附件
	if (sFileID != null)
	{
		
		MyFile.setFileID(Long.parseLong(sFileID));
	        MyFile.init();
                        
                String spath = path +"\\myfile\\"+MyFile.getFileURL();
                     
        java.io.File f = new java.io.File(spath);
        if(f.exists())
              f.delete();
        else
              out.println("服务器中不存在此文件");
	}		
	

	//删除邮件
	if(MyFile.delete(sFileID))
	{
		out.println("<p><font color=blue>成功</font></p>");
		out.println("<p><a href=\"myFileManagement.jsp\" target=\"_self\"><font color=blue>返回文件管理</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>删除失败，请重试</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"返回\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
