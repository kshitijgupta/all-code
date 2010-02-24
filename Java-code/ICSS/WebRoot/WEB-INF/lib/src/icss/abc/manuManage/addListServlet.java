package icss.abc.manuManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * 获得用户端的新建List请求，获得新建list的地址和名称
 * 向数据库中搜索，判断是否名称已经存在，
 * 插入成功向用户端返回成功信息
 */
public class addListServlet extends HttpServlet{
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
	public void init(ServletConfig config) throws ServletException{
		super.init();
	}
	public void destroy(){}
	public void doPost(HttpServletRequest request,HttpServletResponse response)throws ServletException,IOException{
		response.setContentType("text/html;charset=GB2312");
		 PrintWriter out = response.getWriter();
	}
    
}
