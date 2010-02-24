package icss.abc.log.base.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import icss.abc.base.db.DBConnection;
import icss.abc.log.vo.LogVO;

public class LogBaseDAO {

	public  void setLog(int logid,LogVO vo) {

		Connection conn = null;
		PreparedStatement stmt = null;
		if (doRecord(logid)) {
			String sql = "insert into logcontent (contentid, userid, logid, userip, time, describe) values(SEQ_LOGCONTENT.NextVal,?,?,?,?,?)";
			try {
				conn = DBConnection.getConnection();
				stmt = conn.prepareStatement(sql);
				stmt.setInt(1, vo.getUserid());
				stmt.setInt(2, logid);
				stmt.setString(3, vo.getUserip());
				stmt.setTimestamp(4, new java.sql.Timestamp(new java.util.Date().getTime()));
				stmt.setString(5, vo.getDescribe());
				
				stmt.execute();
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

	}

	public  boolean doRecord(int logid) {
		boolean result = false;
		int record = 0;

		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;

		String sql = "select record from abclog where logid = ?";

		try {
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			stmt.setInt(1, logid);
			rs = stmt.executeQuery();
			while (rs.next()) {
				record = rs.getInt("record");
			}
			if (record == 1) {
				result = true;
			}
		} catch (Exception e) {

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {

			}
		}
		return result;
	}

}
