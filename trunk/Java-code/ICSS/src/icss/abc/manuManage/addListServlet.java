package icss.abc.manuManage;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/*
 * ����û��˵��½�List���󣬻���½�list�ĵ�ַ������
 * �����ݿ����������ж��Ƿ������Ѿ����ڣ�
 * ����ɹ����û��˷��سɹ���Ϣ
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
