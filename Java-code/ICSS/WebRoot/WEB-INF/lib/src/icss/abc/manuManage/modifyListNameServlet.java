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
	 * 对中文乱码进行处理
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

		
//		设置接收信息的字符集
    	request.setCharacterEncoding("UTF-8");
    	//接收浏览器端提交的信息
		String textfield = codeToString(request.getParameter("textfield"));
		String oldFieldName = codeToString(request.getParameter("oldName"));
		//设置输出信息的格式及字符集        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        //创建输出流对象
        PrintWriter out = response.getWriter();
        //依据验证结果输出不同的数据信息
        //连接数据库，判断重命名文件名是否已重名，重命名是否成功
        //数据库操作 、、、、、、、、、、、、、、、、、、、、、、、、、、、、
        //if(ok)//重命名成功
        //{
        //	out.print("ok");
        //}
        //else if(exist)//重命名文件名已经存在
        //{
        //	out.print("exist");
        //}
        //else//数据库操作失败等异常失误
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
