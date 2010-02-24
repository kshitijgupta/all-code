package ef.luolei.login.ctrl;

import java.io.IOException;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import ef.luolei.db.base.DBConnection;

public class LogInServlet extends HttpServlet implements Serializable{
	
	private static final long serialVersionUID = -8550895283804723282L;
	
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		perform(request, response);
	}

	public void perform(HttpServletRequest request, HttpServletResponse response) {

		String redirect = "/qigemingzhenfeijin.jsp";
		

		HttpSession session = request.getSession();
		String name = request.getParameter("UserName");
		String pwd = request.getParameter("UserPassword");

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		CallableStatement subProc = null;
		CallableStatement taProc  = null;
		String sql = "select * from usertable where username = ? and password = ?";

		try {
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, name);
			stmt.setString(2, pwd);
			rs = stmt.executeQuery();
			
			String dbuser = "";
			String dbpwd = "";
			String tasql = "";
			int    dbid = -1;
			while (rs.next()) {

				dbuser = rs.getString("username");
				dbpwd  = rs.getString("password");
				dbid   = rs.getInt("userid");
			}
			
			if( dbuser.equals(name)&&dbpwd.equals(pwd)){
				
				session.setAttribute("userid","dbid");
				
				String subsql = "";
				
				//处理12个板块的主页显示信息
				for(int i=1; i<=12; i++)//共12个模块
				{
					//在request里加入查看次数
					int value = getNumView(conn,i);
					String key = "view"+i;
					
					request.setAttribute(key, value);
					//在request里加入主题数和帖子数以及最好发帖日期和最后发帖人
					subsql  = "call total( "+i+" , ?, ?)";
					
					subProc = conn.prepareCall(subsql);				
					subProc.registerOutParameter(1,Types.INTEGER);
					subProc.registerOutParameter(2,Types.INTEGER);
					
					subProc.execute();
					int subvalue = subProc.getInt(1);
					int totalvalue=subProc.getInt(2);
					request.setAttribute("sub"+i, subvalue);
					request.setAttribute("total"+i, totalvalue);
					//
					
					
					tasql  = "call last( "+i+" , ?, ?,?,?)";
					
					taProc = conn.prepareCall(tasql);
					taProc.registerOutParameter(1, Types.TIMESTAMP);
					taProc.registerOutParameter(2, Types.VARCHAR);
					taProc.registerOutParameter(3, Types.TIMESTAMP);
					taProc.registerOutParameter(4, Types.VARCHAR);
					
					taProc.execute();
					
					
					String ts1 = taProc.getString(1);
					String ts2 = taProc.getString(3);
					
					if(ts1.compareTo(ts2)>0){
						request.setAttribute("time"+i, ts1);
						request.setAttribute("author"+i, taProc.getString(2));
					}
					else{
						request.setAttribute("time"+i, ts2);
						request.setAttribute("author"+i, taProc.getString(4));
					}
					
				}
				request.getRequestDispatcher(redirect).forward(request, response);
			}
			else{
				request.getRequestDispatcher("/index.jsp").forward(request, response);
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (subProc!=null)
					subProc.close();
				if (taProc !=null)
					taProc.close();
				DBConnection.releaseConnection(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	public int getNumView(Connection conn, int id){
		
		CallableStatement proc = null;
		String sql = "call getNumView( "+id+" ,?)";
		int result = 0;
		try {
			proc = conn.prepareCall(sql);
			proc.registerOutParameter(1,Types.INTEGER);
			proc.execute();
			
			result = proc.getInt(1);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			if(proc!=null)
				try {
					proc.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}
		return result;
	}
	
}
