<%@ page contentType="text/html; charset=gb2312" language="java"%>
<%@ page import="com.jspsmart.upload.*"%>
<%@ page import="java.util.Properties"%>
<%@ page import="javax.mail.*"%>
<%@ page import="javax.mail.internet.*"%>
<jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" />
<jsp:useBean scope="page" id="SendMail" class="com.chapter12.SendMail" />
<html>
	<head>
		<title>�ϴ�</title>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
	</head>
	<body>
            <%String sUserName = (String) session.getAttribute("UserName");%>
	<div align="center">
	<h1 align="center">�ļ��ϴ�</h1>
	<p>�ϴ����ļ���Ϣ���£�</p>
	<%
                try{
		//�½�һ��SmartUpload����
		SmartUpload su = new SmartUpload();
		//�ϴ���ʼ��
		su.initialize(pageContext);
		//�趨�ϴ�����
		//����ÿ���ϴ��ļ�����󳤶ȡ�
		su.setMaxFileSize(10*1024*1024);
		//�������ϴ����ݵĳ��ȡ�
		su.setTotalMaxFileSize(10*1024*1024);
		//�趨�����ϴ����ļ���ͨ����չ�����ƣ�,������doc,txt�ļ���
		su.setAllowedFilesList("rar");
		//�趨��ֹ�ϴ����ļ���ͨ����չ�����ƣ�,��ֹ�ϴ�����exe,bat,jsp,htm,html��չ�����ļ���û����չ�����ļ���
		su.setDeniedFilesList("exe,bat,jsp,htm,html,,");
		//�ϴ��ļ�
		su.upload();
		//���ϴ��ļ�ȫ�����浽ָ��Ŀ¼
		//su.save("/upload");
                java.text.SimpleDateFormat dateFormatter = new java.text.SimpleDateFormat("yyyyMMddHHmmss");
		//�ж��Ƿ����ϴ��ļ�
		com.jspsmart.upload.File file = su.getFiles().getFile(0);
                String sFileUrl="upload/";
		if (!file.isMissing())
		{
			//��ʾ��ǰ�ļ���Ϣ
			out.println("<TABLE BORDER=1>");
			out.println("<TR><TD>������</TD><TD>"+file.getFieldName()+"</TD></TR>");
			out.println("<TR><TD>�ļ�����</TD><TD>"+file.getSize()+"</TD></TR>");
			out.println("<TR><TD>�ļ���</TD><TD>"+file.getFileName()+"</TD></TR>");
			out.println("<TR><TD>�ļ���չ��</TD><TD>" +file.getFileExt()+"</TD></TR>");
			out.println("<TR><TD>�ļ�ȫ��</TD><TD>"+file.getFilePathName()+"</TD></TR>");
			out.println("</TABLE><BR>");
                        
                        String sNowTime = dateFormatter.format(new java.util.Date());
			sFileUrl += sNowTime+"."+ file.getFileExt();
                        file.saveAs("./"+sFileUrl);
                       // file.saveAs("./notice_attachment/"+sFileUrl);
                        
                        
                        
                        //�����Զ������ʼ�����
                     SendMail.setNeedAuth(true);
        if (SendMail.setSubject("Team��ԤԼ") == false) {
            return;
        }
//�ʼ����� ֧��html �� <font color=red>��ӭ����</font> <a href=\"http://www.laabc.com\">��ABC</a> 
                     String mailbody = "������Team��ԤԼ��������ע������";
        if (SendMail.setBody(mailbody) == false) {
            return;
        }
//�ռ������� 
        if (SendMail.setTo("hit.team@163.com") == false) {
            return;
        }
//���������� 
        if (SendMail.setFrom("luo__lei@163.com") == false) {
            return;
        }
//���ø��� 
//if (themail.addFileAffix("#######") == false) 
//return; // �����ڱ��ػ����ϵľ���·�� 
        SendMail.setNamePass("luo__lei", "22763378"); // �û��������� 
        if (SendMail.sendout() == false) {
            return;
        }
    

                        
		}
		String sInfo =su.getRequest().getParameter("Info");
		out.println("<p>�ļ�˵����<font color=blue>"+sInfo+"</font>");	
                
               //���ļ����ӵ����ݿ�
                UpFile.setFileInfo(sInfo);
                UpFile.setFileURL(sFileUrl);
                UpFile.setSender(sUserName);
                if(UpFile.add())
			{
				out.println("<p><font color=blue>�ϴ��ɹ�</font></p>");
				out.println("<div><input type=button Subject=btn value=\"�����ϴ�\" onClick='window.location=\"./contribution.html\"'><input type=button Subject=btn value=\"������ҳ\" onClick='window.location=\"index.jsp\"'></div>");
			}
			else
			{
				out.println("<p><font color=red>�ϴ�ʧ�ܣ�������</font></p>");
				out.println("<div><input type=button Subject=btn value=\"����\" onClick='window.history.go(-1)'></div>");
				return;
			}
                }
                catch(Exception e)
		{
			out.println("<p><font color=red>���ϴ����ļ���ʽ���ԣ������ϴ��ļ�̫��</font></p>");
			out.println("<div><input type=button name=btn value=���� onClick='window.history.go(-1)'></div>");
			return;
		}

	%>
	</div>
	</body>
</html>