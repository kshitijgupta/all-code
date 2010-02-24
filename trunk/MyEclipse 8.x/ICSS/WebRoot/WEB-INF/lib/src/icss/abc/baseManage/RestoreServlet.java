package icss.abc.baseManage;

import icss.abc.baseManage.CopyFile.BackupFullFile;
import icss.abc.baseManage.RestoreFile.RestoreFile;
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

public class RestoreServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public RestoreServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}
    
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
		//设置输出信息的格式及字符集        
        response.setContentType("text/xml; charset=UTF-8");
        response.setHeader("Cache-Control", "no-cache");
        //创建输出流对象
        PrintWriter out = response.getWriter();
        //依据验证结果输出不同的数据信息
        //连接数据库，判断新建文件名是否已经存在，插入是否成功
        //数据库操作 、、、、、、、、、、、、、、、、、、、、、、、、、、、、
        
        
		//String restoreToPath = "c:\\backup\\";
        String restoreFileName=codeToString(request.getParameter("RestoreToData"));
        //如果恢复成功，返回ok
        //读取源、备份文件的绝对路径
        String resourceDir = this.getServletContext().getRealPath("/source");
		String backupDir = this.getServletContext().getRealPath("/backup");
		
        RestoreFile restoreFile =new RestoreFile();
        boolean bn = restoreFile.RestoreFile(restoreFileName,resourceDir,backupDir);
        if(bn)
        {
        	out.print("ok");
        	//还原
        	LogVO vo = new LogVO();
        	LogBaseDAO dao = new LogBaseDAO();
        	vo.setLogid(7);//9表示记录的是资源修改操作
        	HttpSession session = request.getSession();
    		int dbuserid = (Integer)session.getAttribute("userid");
        	vo.setUserid(dbuserid);//dbuserid从session里取
        	vo.setUserip(request.getRemoteAddr());
        	vo.setDescribe("数据恢复记录");
        	dao.setLog(7, vo);
        }
        else//失败返回error
        {
        	out.print("error");
        }
        
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
