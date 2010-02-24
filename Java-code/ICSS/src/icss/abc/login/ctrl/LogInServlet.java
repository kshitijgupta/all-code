package icss.abc.login.ctrl;

import icss.abc.base.db.DBConnection;
import icss.abc.log.base.dao.LogBaseDAO;
import icss.abc.log.vo.LogVO;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class LogInServlet extends HttpServlet implements Serializable {
	private static final long serialVersionUID = -950824516449626887L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void perform(HttpServletRequest request, HttpServletResponse response) {
		
		String redirect = "/index.jsp";
		
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		ServletContext application = getServletConfig().getServletContext();
		HttpSession session = request.getSession();
		String sql = "select * from usertable where username = ? and password = ?";
		
		try {
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, username);
			stmt.setString(2, password);
			rs = stmt.executeQuery();
			String dbuser="";
			String dbpwd="";
			int dbuserid = -1;
			while(rs.next()){
				
				dbuser = rs.getString("username");
				dbpwd = rs.getString("password");
				dbuserid = rs.getInt("userid");
			}
			
			if( dbuser.equals(username)&&dbpwd.equals(password)){
				
				session.setAttribute("userid", dbuserid);
				int counter = (Integer)application.getAttribute("counter");
				counter++;
				application.setAttribute("counter", counter);
				
				
				
				System.out.println((Integer)session.getAttribute("userid")+"");
				//记录登陆日志,dao会判断是否需要把日志写入数据库
				LogVO vo = new LogVO();
				LogBaseDAO dao = new LogBaseDAO();
				vo.setLogid(3);//3表示记录的是登陆日志
				vo.setUserid(dbuserid);
				vo.setUserip(request.getRemoteAddr());
				vo.setDescribe("登陆记录");
				dao.setLog(3, vo);
				
				request.getRequestDispatcher(redirect).forward(request, response);
			}
			else{
				request.getRequestDispatcher("/regdite.html").forward(request, response);
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
}
