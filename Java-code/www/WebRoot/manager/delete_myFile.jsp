<%@ page contentType="text/html; charset=gb2312" language="java" %>
<%@ page import="java.io.File.*"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
		<title>��ӭ������̳</title>
		<link rel=stylesheet type=text/css href="./lib/bbs.css">
		<jsp:useBean scope="page" id="MyFile" class="com.chapter12.MyFile" />

	</head>
	<body>
	<div align="center"><br>    
            
<%
	//��ȡ��Ҫɾ����id��
	String sFileID = request.getParameter("FileID");	
     
   //��õ�ǰ����·��
    String path=request.getRealPath("");
       // out.print(""+sFileID +"       "  + path);
	//ɾ������
	if (sFileID != null)
	{
		
		MyFile.setFileID(Long.parseLong(sFileID));
	        MyFile.init();
                        
                String spath = path +"\\myfile\\"+MyFile.getFileURL();
                     
        java.io.File f = new java.io.File(spath);
        if(f.exists())
              f.delete();
        else
              out.println("�������в����ڴ��ļ�");
	}		
	

	//ɾ���ʼ�
	if(MyFile.delete(sFileID))
	{
		out.println("<p><font color=blue>�ɹ�</font></p>");
		out.println("<p><a href=\"myFileManagement.jsp\" target=\"_self\"><font color=blue>�����ļ�����</font></a></p>");
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
