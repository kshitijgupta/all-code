package icss.abc.manuManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class addListsServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public addListsServlet() {
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
	public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
    	//���ý�����Ϣ���ַ���
    	request.setCharacterEncoding("UTF-8");
    	//������������ύ����Ϣ
		String textfield = codeToString(request.getParameter("textfield"));
		//���������Ϣ�ĸ�ʽ���ַ���        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        //�������������
        PrintWriter out = response.getWriter();
        //������֤��������ͬ��������Ϣ
        //�������ݿ⣬�ж��½��ļ����Ƿ��Ѿ����ڣ������Ƿ�ɹ�
        //���ݿ���� ��������������������������������������������������������
        //if(exist)//���ļ����Ѿ�����
        //{
        //	out.print("exist");
        //}
        //else//������
        //{
        //	out.print("ok");
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
	/*public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		String url = request.getContextPath();
		
		//response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		//out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		//out.println("<HTML>");
		//out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		//out.println("  <BODY>");
		//out.print("    This is ");
		//out.print(this.getClass());
		//out.println(", using the POST method");
		//out.println("  </BODY>");
		//out.println("</HTML>");
		//String newListName = codeToString(request.getParameter("textField"));
		//out.println("window.alert(newListName+'�������ظ�');");
		request.setAttribute("error","1");

		getServletContext().getRequestDispatcher("/middle_pages/addList.jsp").forward(request, response);



        
		out.flush();
		out.close();
	}*/

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occure
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
