<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" />
<jsp:useBean scope="page" id="SendMail" class="com.chapter12.SendMail" />
<html>
	<head>
		<title>上传</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<body>
            <%String sUserName = (String) session.getAttribute("UserName");%>
	<div align="center">
	<h1 align="center">文件上传</h1>
	<p>上传的文件信息如下：</p>
	<%
                try{
		//新建一个SmartUpload对象
		SmartUpload su = new SmartUpload();
		//上传初始化
		su.initialize(pageContext);
		//设定上传限制
		//限制每个上传文件的最大长度。
		su.setMaxFileSize(10*1024*1024);
		//限制总上传数据的长度。
		su.setTotalMaxFileSize(10*1024*1024);
		//设定允许上传的文件（通过扩展名限制）,仅允许doc,txt文件。
		su.setAllowedFilesList("rar");
		//设定禁止上传的文件（通过扩展名限制）,禁止上传带有exe,bat,jsp,htm,html扩展名的文件和没有扩展名的文件。
		su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		//上传文件
		su.upload();
		//将上传文件全部保存到指定目录
		//su.save("/upload");
                java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		//判断是否有上传文件
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
                String sFileUrl="upload/";
		if (!file.isMissing())
		{
			//显示当前文件信息
			out.println("<TABLE BORDER=1>");
			out.println("<TR><TD>表单项名</TD><TD>"+file.getFieldName()+"</TD></TR>");
			out.println("<TR><TD>文件长度</TD><TD>"+file.getSize()+"</TD></TR>");
			out.println("<TR><TD>文件名</TD><TD>"+file.getFileName()+"</TD></TR>");
			out.println("<TR><TD>文件扩展名</TD><TD>" +file.getFileExt()+"</TD></TR>");
			out.println("<TR><TD>文件全名</TD><TD>"+file.getFilePathName()+"</TD></TR>");
			out.println("</TABLE><BR>");
                        
                        String sNowTime = dateFormatter.format(new java.util.Date());
			sFileUrl += sNowTime+"."+ file.getFileExt();
                        file.saveAs("./"+sFileUrl);
                       // file.saveAs("./notice_attachment/"+sFileUrl);
                        
                        
                        
                        //加入自动发送邮件功能
                     SendMail.setNeedAuth(true);
        if (SendMail.setSubject("Team：预约") == false) {
            return;
        }
//邮件内容 支持html 如 <font color=red>欢迎光临</font> <a href=\"http://www.laabc.com\">啦ABC</a> 
                     String mailbody = "有人在Team上预约报名，请注意验收";
        if (SendMail.setBody(mailbody) == false) {
            return;
        }
//收件人邮箱 
        if (SendMail.setTo("hit.team@163.com") == false) {
            return;
        }
//发件人邮箱 
        if (SendMail.setFrom("luo__lei@163.com") == false) {
            return;
        }
//设置附件 
//if (themail.addFileAffix("#######") == false) 
//return; // 附件在本地机子上的绝对路径 
        SendMail.setNamePass("luo__lei", "22763378"); // 用户名与密码 
        if (SendMail.sendout() == false) {
            return;
        }
    

                        
		}
		String sInfo =su.getRequest().getParameter("Info");
		out.println("<p>文件说明：<font color=blue>"+sInfo+"</font>");	
                
               //把文件连接到数据库
                UpFile.setFileInfo(sInfo);
                UpFile.setFileURL(sFileUrl);
                UpFile.setSender(sUserName);
                if(UpFile.add())
			{
				out.println("<p><font color=blue>上传成功</font></p>");
				out.println("<div><input type=button Subject=btn value=\"继续上传\" onClick='window.location=\"./contribution.html\"'><input type=button Subject=btn value=\"返回主页\" onClick='window.location=\"index.jsp\"'></div>");
			}
			else
			{
				out.println("<p><font color=red>上传失败，请重试</font></p>");
				out.println("<div><input type=button Subject=btn value=\"返回\" onClick='window.history.go(-1)'></div>");
				return;
			}
                }
                catch(Exception e)
		{
			out.println("<p><font color=red>您上传的文件格式不对，或者上传文件太大！</font></p>");
			out.println("<div><input type=button name=btn value=返回 onClick='window.history.go(-1)'></div>");
			return;
		}

	%>
	</div>
	</body>
</html>