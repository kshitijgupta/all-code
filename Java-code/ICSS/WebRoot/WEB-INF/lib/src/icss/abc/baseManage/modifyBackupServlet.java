package icss.abc.baseManage;


import icss.abc.baseManage.CopyFile.*;
import icss.abc.log.base.dao.LogBaseDAO;
import icss.abc.log.vo.LogVO;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class modifyBackupServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public modifyBackupServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

//		���ý�����Ϣ���ַ���
    	request.setCharacterEncoding("UTF-8");
    	//������������ύ����Ϣ
		//���������Ϣ�ĸ�ʽ���ַ���        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        //�������������
        PrintWriter out = response.getWriter();
        //������֤��������ͬ��������Ϣ
        //�������ݿ⣬�ж��½��ļ����Ƿ��Ѿ����ڣ������Ƿ�ɹ�
        //���ݿ���� ��������������������������������������������������������
        
        //���Դ�ļ��������ļ��еľ���·��
		String resourceDir = this.getServletContext().getRealPath("/source");
		String backupDir = this.getServletContext().getRealPath("/backup");
		
        //��Դ�ļ�����,����ȫ���ݺ���
        FindLastFile backupModifyFile = new FindLastFile();
        //������ݳɹ�������ok
        String bn=backupModifyFile.FindLastFile(backupDir,resourceDir);
        if(bn=="ok")
        {
        	out.print("ok");
        	//����
    		LogVO vo = new LogVO();
    		LogBaseDAO dao = new LogBaseDAO();
    		vo.setLogid(7);//7��ʾ��¼���Ǳ��ݲ���
    		HttpSession session = request.getSession();
    		int dbuserid = (Integer)session.getAttribute("userid");
    		vo.setUserid(dbuserid);//dbuserid��session��ȡ
    		vo.setUserip(request.getRemoteAddr());
    		vo.setDescribe("���ݿ��������ݼ�¼");
    		dao.setLog(7, vo);
        }
        else if(bn=="empty")//û��ȫ����
        {
        	out.print("empty");
        }
        else//ʧ�ܷ���error
        {
        	out.print("error");
        }
        
        //out.print("ok");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
