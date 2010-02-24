<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.io.File.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>欢迎光临论坛</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" />

	</head>
	<body>
	<div align="center"><br>    
            
<%
	//获取所要删除的邮件索引号，并将它们转换成一个字符串
	String[] sFileID = request.getParameterValues("DeleteID");	
	String sDeleteFileID = "0";
     
        //获得当前绝对路径
      String path=request.getRealPath("");
	if (sFileID != null)
	{
		for(int i=0;i<sFileID.length;i++)
		{
			sDeleteFileID = sDeleteFileID +"," + sFileID[i];
                        UpFile.setFileID(Long.parseLong(sFileID[i]));
	                UpFile.initForID();
                        
                        String spath = path +"\\"+UpFile.getFileURL();
                     
                       java.io.File f = new java.io.File(spath);
                        if(f.exists())
                            f.delete();
                        else
                            out.println("服务器中不存在此文件");
		}		
	}

	//删除邮件
	if(UpFile.delete(sDeleteFileID))
	{
		out.println("<p><font color=blue>成功</font></p>");
		out.println("<p><a href=\"deal_with_contribution.jsp\" target=\"_self\"><font color=blue>返回上传文件管理</font></a></p>");
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
