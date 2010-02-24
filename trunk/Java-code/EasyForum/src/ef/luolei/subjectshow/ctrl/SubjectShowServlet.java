package ef.luolei.subjectshow.ctrl;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ef.luolei.db.base.DBConnection;
import ef.luolei.reply.vo.ReplyVO;
import ef.luolei.subject.vo.NewSubject;
import ef.luolei.user.vo.UserVO;

public class SubjectShowServlet extends HttpServlet implements Serializable {

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

		String redirect = "/subject.jsp";

		int subjectid = Integer.parseInt(request.getParameter("subject"));
		List replyList = new ArrayList();
		NewSubject nsVO = new NewSubject();
		ReplyVO replyVO = new ReplyVO();
		UserVO userVO = new UserVO();

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		PreparedStatement stmt2 = null;
		ResultSet rs2 = null;
		PreparedStatement stmt3 = null;
		ResultSet rs3 = null;
		PreparedStatement stmt4 = null;
		ResultSet rs4 = null;

		String sql = " select * from newsubject where id = ?";
		String sql2 = "select reply.id, reply.author, reply.redate, reply.content "
				+ "from reply join subjectandreply on reply.id = subjectandreply.replyid "
				+ "where subjectandreply.subjectid = ? "
				+ "order by reply.redate asc";
		String sql3 = " select * from usertable where username = ?";

		try {

			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, subjectid);
			rs = stmt.executeQuery();

			while (rs.next()) {
				nsVO.setId(rs.getInt("id"));
				nsVO.setTitle(rs.getString("title"));
				nsVO.setContent(rs.getString("content"));
				nsVO.setAuthor(rs.getString("author"));
				nsVO.setClickamount(rs.getInt("clickamount"));
				nsVO.setReplyamount(rs.getInt("replyamount"));
				nsVO.setTime(rs.getString("submitdate"));

				stmt3 = conn.prepareStatement(sql3);
				stmt3.setString(1, rs.getString("author").trim());
				rs3 = stmt3.executeQuery();
				while (rs3.next()) {
					userVO.setUserid(rs3.getInt("userid"));
					userVO.setUsername(rs3.getString("username"));
					userVO.setSubjectnum(rs3.getInt("subjectnum"));
					userVO.setRenum(rs3.getInt("renum"));
					userVO.setScore(rs3.getInt("score"));
				}

				nsVO.setUserVO(userVO);
			}
			// 在request中加入主题帖子VO
			request.setAttribute("subject", nsVO);

			stmt2 = conn.prepareStatement(sql2);
			stmt2.setInt(1, subjectid);
			rs2 = stmt2.executeQuery();

			while (rs2.next()) {
				replyVO.setAuthor(rs2.getString("author"));
				replyVO.setContent(rs2.getString("content"));
				replyVO.setId(rs2.getInt("id"));
				replyVO.setTime(rs2.getString("redate"));

				stmt4 = conn.prepareStatement(sql3);
				stmt4.setString(1, rs2.getString("author"));
				rs4 = stmt4.executeQuery();
				while (rs4.next()) {
					userVO.setUserid(rs4.getInt("userid"));
					userVO.setUsername(rs4.getString("username"));
					userVO.setSubjectnum(rs4.getInt("subjectnum"));
					userVO.setRenum(rs4.getInt("renum"));
					userVO.setScore(rs4.getInt("score"));
				}

				replyVO.setUserVO(userVO);

				replyList.add(replyVO);
			}
			// 在request中加入回帖List
			request.setAttribute("replyList", replyList);

			request.getRequestDispatcher(redirect).forward(request, response);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {

			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (rs2 != null)
					rs2.close();
				if (stmt2 != null)
					stmt2.close();
				if (rs3 != null)
					rs3.close();
				if (stmt3 != null)
					stmt3.close();
				if (rs4 != null)
					rs4.close();
				if (stmt4 != null)
					stmt4.close();
				DBConnection.getConnection();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
}
