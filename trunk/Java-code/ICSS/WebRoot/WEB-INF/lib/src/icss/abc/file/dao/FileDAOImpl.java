package icss.abc.file.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import icss.abc.base.db.BaseDAOImpl;
import icss.abc.base.db.DBConnection;
import icss.abc.base.db.KeyValue;
import icss.abc.base.db.PageHelper;
import icss.abc.file.vo.FileVO;
import icss.abc.user.vo.UserVO;

public class FileDAOImpl extends BaseDAOImpl implements FileDAO {

	@Override
	protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter)
			throws SQLException {

		String key = paramter.getKey();

		if (key.equals("insert")) {

		} else if (key.equals("update")) {

		} else if (key.equals("delete")) {

		} else if (key.equals("primary")) {
			Integer id = (Integer) paramter.getValue();
			stmt.setInt(1, id.intValue());
		} else if (key.equals("count")) {

		}
	}

	protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter, int id)
			throws SQLException {

		String key = paramter.getKey();

		if (key.equals("insert")) {
			FileVO vo = (FileVO) paramter.getValue();
			String filename = vo.getFilename();

			int lastdot = filename.lastIndexOf(".");
			if (lastdot != -1)
				filename = filename.substring(0, lastdot) + "-"+id+filename.substring(lastdot);
			
			vo.setFilename(filename);
			String sURL = "source/"+vo.getFilename();
			vo.setFileURL(sURL);
			stmt.setString(1, vo.getFilename());
			stmt.setString(2, vo.getFilelabel());
			stmt.setString(3, vo.getFileauthor());
			stmt.setDate(4, vo.getSqldate());
			stmt.setString(5, vo.getFiletype());
			stmt.setString(6, vo.getFiledescribe());
			stmt.setString(7, vo.getFileURL());
			stmt.setInt(8, vo.getFlag());

		} 
	}

	@Override
	protected Object readPrimary(ResultSet rs) throws SQLException {
		FileVO vo = new FileVO();
		vo.setFilename(rs.getString("filename"));
		vo.setFileauthor(rs.getString("fileauthor"));
		vo.setDownloadtimes(rs.getInt("downloadtimes"));
		vo.setSqldate(rs.getDate("time"));
		vo.setFiletype(rs.getString("filetype"));
		vo.setFiledescribe(rs.getString("filedescribe"));
		return vo;
	}

	@Override
	protected void readRecord(ResultSet rs, List recordList, int pageSize)
			throws SQLException {
		// TODO Auto-generated method stub

	}

	@Override
	public boolean batchdel(String ids) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean delete(int id) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public PageHelper findAll() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public FileVO findByPrimary(int id) throws Exception {
		return (FileVO) findByPrimary("abcfile", "fileid", new Integer(id));
	}

	@Override
	public PageHelper getList(String condition, int pageSize, int currentPage)
			throws Exception {
		String fields = "fileid,filename,fileauthor,downloadtimes";
		String tables = "abcfile";
		String barUrl = "";
		String condSql = "";

		if (!(condition.equals(""))) {
			// do something
			;

		}
		return getList(fields, tables, condSql, barUrl, pageSize, currentPage);
	}

	@Override
	public boolean insert(FileVO vo) throws Exception {
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String idsql = "Select TESTUSER.SEQ_FILE.Nextval From DUAL";
		int id = -1;
		try {
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(idsql);
			while (rs.next()) {
				id = rs.getInt("NEXTVAL");
			}

		} catch (Exception e) {

		} finally {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (rs != null)
				rs.close();
		}
		
		
		
		String sql = "insert into abcfile(fileid, filename, filelabel, fileauthor,time,filetype,filedescribe,fileurl,flag) values("
				+ id + ",?,?,?,?,?,?,?,?) ";
		executeUpdate(sql, new KeyValue("insert", vo), id);

		return false;
	}

	@Override
	public boolean update(FileVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

}
