<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.io.File.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������̳</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" />

	</head>
	<body>
	<div align="center"><br>    
            
<%
	//��ȡ��Ҫɾ�����ʼ������ţ���������ת����һ���ַ���
	String[] sFileID = request.getParameterValues("DeleteID");	
	String sDeleteFileID = "0";
     
        //��õ�ǰ����·��
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
                            out.println("�������в����ڴ��ļ�");
		}		
	}

	//ɾ���ʼ�
	if(UpFile.delete(sDeleteFileID))
	{
		out.println("<p><font color=blue>�ɹ�</font></p>");
		out.println("<p><a href=\"deal_with_contribution.jsp\" target=\"_self\"><font color=blue>�����ϴ��ļ�����</font></a></p>");
	}
	else
	{
		out.println("<p><font color=red>ɾ��ʧ�ܣ�������</font></p>");
		out.println("<div><input type=\"button\" name=\"btn\" value=\"����\" onClick=\"javascript:window.history.go(-1)\"></div>");
	}
%>
	</div>
	</body>
</html>
