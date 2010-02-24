<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@page pageEncoding="UTF-8"%>
<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />
<html>
	<head>
	<title>欢迎光临</title>
                <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<link rel=stylesheet type=text/css href="../lib/enterprise.css">	
	</head>
	<body bgcolor="#F2F2F2">
          
	<div align="center"><br>
	<%
		try
		{
			//新建一个SmartUpload对象
			SmartUpload su = new SmartUpload();
			//上传初始化
			su.initialize(pageContext);
			//设定上传限制
			//限制上传文件的最大长度。
			su.setMaxFileSize(1024*1024);
                        //限制总上传数据的长度。
                        su.setTotalMaxFileSize(10*1024*1024);
                        //设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
                        su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
			//上传文件
			su.upload();		
			//获取公告信息
			String sSubject=su.getRequest().getParameter("Subject");//标题
			String sContent=su.getRequest().getParameter("Content");//内容
			String sPart =  su.getRequest().getParameter("Part");
                        //String sAttachment="";	
			String sFileUrl="";
			//long lUserID = (Long) session.getAttribute("UserID");
			
			

			//判断是否有附件上传
			com.jspsmart.upload.File file = su.getFiles().getFile(0);
			if (!file.isMissing())
			{
				//sAttachment=file.getFileName();
				//将附件以 当前时间+附件扩展名 作为文件名保存		
				java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
				String sNowTime = dateFormatter.format(new java.util.Date());
				sFileUrl = sNowTime+"."+ file.getFileExt();
				file.saveAs("./myfile/"+sFileUrl);
				
			}
			//将公告信息保存到数据库中
			MyFile.setFileTitle(sSubject);
			MyFile.setFileContent(sContent);
			MyFile.setFileURL(sFileUrl);
			//Notice.setAttachment(sAttachment);
			//Notice.setUserID(lUserID);
			MyFile.setPart(sPart);

			if(MyFile.add())
			{
				out.println("<p><font color=blue>添加成功</font></p>");
			}
			else
			{
				out.println("<p><font color=red>添加失败，请重试</font></p>");
				out.println("<div><input type=button Subject=btn value=\"返回\" onClick='window.history.go(-1)'></div>");
				return;
			}
		}
		catch(Exception e)
		{
                        String a = e.toString();
			out.println("<p><font color=red>您上传的文件太大！</font></p>");
			out.println("<div><input type=button Subject=btn value=返回 onClick='window.history.go(-1)'></div>");
			return;
		}
	%>
	</div>
	</body>
</html>