package icss.abc.user.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;




import icss.abc.base.db.BaseDAOImpl;
import icss.abc.base.db.DBConnection;
import icss.abc.base.db.KeyValue;
import icss.abc.base.db.PageHelper;
import icss.abc.user.vo.UserVO;

public class UserDAOImpl extends BaseDAOImpl implements UserDAO{

	@Override
	protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter)
			throws SQLException {
		
		String key = paramter.getKey();
			
		if(key.equals("insert")){
			UserVO  vo =(UserVO)paramter.getValue();
			stmt.setString(1,vo.getUsername());
			stmt.setString(2, vo.getPassword());
			stmt.setString(3,vo.getEmail());
			stmt.setString(4, vo.getUsergroup());
			stmt.setDate(5,(new java.sql.Date(vo.getRegtime().getTime())));
			
		}else if(key.equals("update")){
			
			
		}else if(key.equals("delete")){
			
			
		}else if(key.equals("primary")){
			
		}else if(key.equals("count")){
			stmt.setString(1, (String)paramter.getValue());
		}				
		
	}

	@Override
	protected Object readPrimary(ResultSet rs) throws SQLException {
		// TODO Auto-generated method stub
		return null;
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
	public UserVO findByPrimary(int id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageHelper getList(String condition, int pageSize, int currentPage)
			throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public boolean insert(UserVO vo) throws Exception {
		
		String sql = "insert into usertable(userid,username,password,Email,usergroup,regtime) values(SEQ_USER.NextVal,?,?,?,?,?)";
		
		return executeUpdate(sql,new KeyValue("insert",vo));
		
	}
	public boolean insert(UserVO vo,int deptid) throws Exception {
		
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		String idsql = "Select TESTUSER.SEQ_USER.Nextval From DUAL";
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
		
		
		String sql = "insert into usertable(userid,username,password,Email,usergroup,regtime) values("+id+",?,?,?,?,?)";
		
		
		
		boolean result =  executeUpdate(sql,new KeyValue("insert",vo));
		if(result){
			Connection conn2 = null;
			Statement stmt2 = null;
			try{
			conn2 = DBConnection.getConnection();
			String sql2 ="insert into userdept(userid,departmentid) values("+id+","+deptid+")";
			
			stmt2 = conn2.createStatement();
			stmt2.execute(sql2);
			return true;
			}catch(Exception e){
				System.out.println(e.toString());
				
			}
			finally{
				if(stmt2!=null)	stmt.close();
				if(conn2!=null)	conn.close();
			}
		}return false;
		
	}

	@Override
	public boolean update(UserVO vo) throws Exception {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean checkExist(String name) throws Exception {
		String querySQL = "select count(*)  from usertable where username =? " ;
		int count = findCount(querySQL, name);
		if(count>0) return true;
		else		return false;
		
	}

	
	
	protected   void initPreparedParamer(PreparedStatement stmt,KeyValue paramter, int id) throws SQLException{}
}
