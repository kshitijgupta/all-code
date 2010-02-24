package ef.luolei.moduleshow.ctrl;

import java.io.IOException;
import java.io.Serializable;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ef.luolei.db.base.DBConnection;
import ef.luolei.subject.vo.ShortSubject;

public class ModuleShowServlet extends HttpServlet implements Serializable {

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

		String redirect = "/moduleshow.jsp";
		List objectList = new ArrayList();

		int moduleid = Integer.parseInt(request.getParameter("module"));

		Connection conn = null;
		CallableStatement proc = null;
		ResultSet rs = null;
		String sql = "{? = call shortsubject ( " + moduleid + " )}";

		try {

			conn = DBConnection.getConnection();
			proc = conn.prepareCall(sql);

			proc.registerOutParameter(1, Types.OTHER);

			proc.execute();
			rs =  proc.getResultSet();

			while (rs.next()) {
				ShortSubject vo = new ShortSubject();
				//System.out.println(rs.getString("title"));
				vo.setId(rs.getInt("id"));
				vo.setTitle(rs.getString("title"));
				//System.out.println(vo.getTitle());
				vo.setAuthor(rs.getString("author"));
				//System.out.println(vo.getAuthor());
				vo.setClickamount(rs.getInt("clickamount"));
				//System.out.println(vo.getClickamount());
				vo.setReplyamount(rs.getInt("replyamount"));
				//System.out.println(vo.getReplyamount());
				vo.setTime(rs.getString("lasttime"));
				//System.out.println(vo.getTime());
				vo.setLastauthor(rs.getString("lastauthor"));

				objectList.add(vo);
			}

			request.setAttribute("moduleid", moduleid);
			request.setAttribute("objectList", objectList);
			
			request.getRequestDispatcher(redirect).forward(request, response);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (proc != null)
					proc.close();
				DBConnection.releaseConnection(conn);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
	}
}