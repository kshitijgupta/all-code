package icss.abc.manuManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class modifyListNameServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public modifyListNameServlet() {
		super();
	}

	/**
	 * ������������д���
	 */
	private String codeToString(String str){
		String s = str;
		try{
			byte tempB[] = s.getBytes("ISO-8859-1");
			s = new String(tempB);
			return s;
		}catch(Exception e){
			return s;
		}
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
		String textfield = codeToString(request.getParameter("textfield"));
		String oldFieldName = codeToString(request.getParameter("oldName"));
		//���������Ϣ�ĸ�ʽ���ַ���        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        //�������������
        PrintWriter out = response.getWriter();
        //������֤��������ͬ��������Ϣ
        //�������ݿ⣬�ж��������ļ����Ƿ����������������Ƿ�ɹ�
        //���ݿ���� ��������������������������������������������������������
        //if(ok)//�������ɹ�
        //{
        //	out.print("ok");
        //}
        //else if(exist)//�������ļ����Ѿ�����
        //{
        //	out.print("exist");
        //}
        //else//���ݿ����ʧ�ܵ��쳣ʧ��
        //{
        //  out.print("error");
        //}
        out.print("ok");
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
