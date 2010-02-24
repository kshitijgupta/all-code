package icss.abc.search.ctrl;

import icss.abc.base.db.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

public class SuperFileter {

	public static boolean myFilter(int fileid, String t, String author,
			String type, String scope) {

		if (timeOK(fileid, t) && authorOK(fileid, author)
				&& typeOK(fileid, type) && scopeOK(fileid, scope))
			return true;
		else
			return false;
	}

	private static boolean timeOK(int fileid, String t) {

		long day = 0;
		if (t.equals("0"))
			return true;
		else if (t.equals("1")) {
			day = 1;
			return timedif(fileid, day);
		} else if (t.equals("2")) {
			day = 7;
			return timedif(fileid, day);
		} else if (t.equals("3")) {
			day = 31;
			return timedif(fileid, day);
		} else if (t.equals("4")) {
			day = 365;
			return timedif(fileid, day);
		}
		return false;
	}

	private static boolean timedif(int fileid, long day) {

		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String systemTime = sdf.format(new java.util.Date()).toString();

		java.util.Date begin = null;
		java.util.Date end = null;

		String sql = "select time from abcfile where fileid = " + fileid;
		java.sql.Date sqltime = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			con = DBConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				sqltime = rs.getDate("time");
			}
			String strtime = sdf.format(new java.util.Date(sqltime.getTime()));
			begin = sdf.parse(strtime);
			end = sdf.parse(systemTime);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					DBConnection.releaseConnection(con);
			} catch (Exception e) {
				System.out.println("timdif抛出的异常： " + e.toString());
			}
		}

		long between = (end.getTime() - begin.getTime()) / 1000;// 除以1000是为了转换成秒
		long timdif = between / (24 * 3600);// 转化成天数

		if (day >= timdif)
			return true;

		return false;
	}

	private static boolean authorOK(int fileid, String fileauthor) {

		if (fileauthor == null || fileauthor.equals(""))
			return true;

		String sql = "select fileauthor from abcfile where fileid = " + fileid;
		String sqlauthor = null;

		Connection con = null;
		Statement stmt = null;
		ResultSet rs = null;

		try {

			con = DBConnection.getConnection();
			stmt = con.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				sqlauthor = rs.getString("fileauthor");
			}
		} catch (Exception e) {
			System.out.println("authorOK抛出的异常： " + e.toString());
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (con != null)
					DBConnection.releaseConnection(con);
			} catch (Exception e) {
				System.out.println("authorOK抛出的异常： " + e.toString());
			}
		}

		if (sqlauthor.equals(fileauthor))
			return true;

		return false;
	}

	private static boolean typeOK(int fileid, String filetype) {

		if (filetype.equals("0"))
			return true;
		else {

			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;

			String sqltype = null;
			String sql = "select filetype from abcfile where fileid = "
					+ fileid;

			try {

				con = DBConnection.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql);

				while (rs.next()) {
					sqltype = rs.getString("filetype");
				}

			} catch (Exception e) {
				System.out.println("typeOK抛出的异常： " + e.toString());
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (con != null)
						DBConnection.releaseConnection(con);
				} catch (Exception e) {
					System.out.println("typeOK抛出的异常： " + e.toString());
				}
			}

			if (filetype.equals("1") && sqltype.equals("视频"))
				return true;
			else if (filetype.equals("2") && sqltype.equals("音频"))
				return true;
			else if (filetype.equals("3") && sqltype.equals("其他"))
				return true;

		}

		return false;
	}

	private static boolean scopeOK(int fileid, String scope) {

		if (scope.equals("0"))
			return true;
		else {
			Connection con = null;
			Statement stmt = null;
			ResultSet rs = null;

			//begin
			HttpServletRequest req = ServletActionContext.getRequest();
			HttpSession session = req.getSession();

			int userid = (Integer) session.getAttribute("userid");
			int userdept = -1;

			String sql2 = "select departmentid from userdept where userid = "
					+ userid;

			//得到user-dept 
			try {
				con = DBConnection.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql2);

				while (rs.next()) {
					userdept = rs.getInt("departmentid");
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
					if (con != null)
						DBConnection.releaseConnection(con);
				} catch (Exception e) {

				}
			}
			//end

			//得到file-dept
			int filescope = -1;
			String sql1 = "select departmentid from filedept where fileid = "
					+ fileid;

			try {

				con = DBConnection.getConnection();
				stmt = con.createStatement();
				rs = stmt.executeQuery(sql1);

				while (rs.next()) {
					
					filescope = rs.getInt("departmentid");
					if(fileid==3)
						System.out.println("其他文件的filescope= "+filescope);
				}

			} catch (Exception e) {
				System.out.println("scopeOK抛出的异常： " + e.toString());
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (stmt != null)
						stmt.close();
					if (con != null)
						DBConnection.releaseConnection(con);
				} catch (Exception e) {
					System.out.println("scopeOK抛出的异常： " + e.toString());
				}
			}

			if (scope.equals("1") && filescope == 1) {
				//filescope是1表示文件是属于公共的
				System.out.println("scope.equals(\"1\")");
				return true;
			} else if (scope.equals("2") && filescope == userdept)
				return true;

		}

		return false;

	}
	
	
	
	public static void setPageSize(String pagesize){
		
		int num = 10;
		HttpServletRequest req = ServletActionContext.getRequest();
		
		if(pagesize.equals("10"))
			return ;
		else if(pagesize.equals("20")){
			num = 20;
			req.setAttribute("pagesize", num);
		}
		else if(pagesize.equals("50")){
			num = 50;
			req.setAttribute("pagesize", num);
		}
		else if(pagesize.equals("100")){
			num = 100;
			req.setAttribute("pagesize", num);
		}
	}
	
	//添加近义词
	public static List addWords(String word)
	{
		
		List result = new ArrayList<String>();
		
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		Connection conn2 = null;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		
		String sql = "select wordgroup from words where word = ?";
		String sql2 = "select word from words where wordgroup = ?";
		int wordgroup= -1;
		
		try {
			
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setString(1, word);
			
			rs = stmt.executeQuery();
			
			while(rs.next()){
				wordgroup = rs.getInt("wordgroup");				
			}
			if(wordgroup != -1){
				conn2 = DBConnection.getConnection();
				stmt2 = conn2.prepareStatement(sql2);
				stmt2.setInt(1, wordgroup);
				
				rs2 = stmt2.executeQuery();
				
				while(rs2.next()){
					result.add(rs2.getString("word"));
				}
			}
			
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			try{
				if(rs != null)
					rs.close();
				if(stmt != null)
					stmt.close();
				if(conn != null)
					conn.close();
				
				if(rs2 != null)
					rs2.close();
				if(stmt2 != null)
					stmt2.close();
				if(conn2 != null)
					conn2.close();
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		
		return result;
	}
}
