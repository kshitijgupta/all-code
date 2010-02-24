<%@ page contentType="text/html;charset=gb2312" import="com.jspsmart.upload.*" %><jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" /><%
        String sUrl = request.getParameter("FileURL"); 
        //sUrl +=s;
        //新建一个SmartUpload对象
        SmartUpload su = new SmartUpload();
        //初始化
        su.initialize(pageContext);
        //设定contentDisposition为null以禁止浏览器自动打开文件，保证点击链接后是下载文件。若不设定，则下载的文件扩展名为doc时，浏览器将自动用word打开它；扩展名为pdf时，浏览器将用acrobat打开。
        su.setContentDisposition(null);
        
        UpFile.setFileURL(sUrl);
	UpFile.init();
        UpFile.setTag();
        //下载文件
        su.downloadFile(sUrl);
       // su.downloadFile("upload/20080313124433.rar")
        
        %>