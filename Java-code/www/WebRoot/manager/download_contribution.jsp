<%@ page contentType="text/html;charset=gb2312" import="com.jspsmart.upload.*" %><jsp:useBean scope="page" id="UpFile" class="com.chapter12.UpFile" /><%
        String sUrl = request.getParameter("FileURL"); 
        //sUrl +=s;
        //�½�һ��SmartUpload����
        SmartUpload su = new SmartUpload();
        //��ʼ��
        su.initialize(pageContext);
        //�趨contentDispositionΪnull�Խ�ֹ������Զ����ļ�����֤������Ӻ��������ļ��������趨�������ص��ļ���չ��Ϊdocʱ����������Զ���word��������չ��Ϊpdfʱ�����������acrobat�򿪡�
        su.setContentDisposition(null);
        
        UpFile.setFileURL(sUrl);
	UpFile.init();
        UpFile.setTag();
        //�����ļ�
        su.downloadFile(sUrl);
       // su.downloadFile("upload/20080313124433.rar")
        
        %>