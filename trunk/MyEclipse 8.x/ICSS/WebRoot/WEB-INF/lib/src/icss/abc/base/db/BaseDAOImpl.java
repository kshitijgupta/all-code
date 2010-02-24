package icss.abc.base.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;



import icss.abc.base.db.DBConnection;
import icss.abc.file.vo.FileVO;


public abstract class BaseDAOImpl implements BaseDAO {
	
	

	public boolean executeUpdate(String sql,KeyValue paramter) throws Exception {
		boolean result  		= false;
		Connection conn 		= null;
		PreparedStatement stmt 	= null;

		try{
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			initPreparedParamer(stmt,paramter);
			stmt.execute();
			result = true;
			return result;
		}catch(java.sql.SQLException ext){
			result = false;
			throw new Exception("更新信息失败，错误信息：" +ext.toString());	
		}finally{
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
	}
	//下面这个方法只为file操作制定
	public boolean executeUpdate(String sql,KeyValue paramter, int id) throws Exception {
		boolean result  		= false;
		Connection conn 		= null;
		PreparedStatement stmt 	= null;
		Statement stmt2 = null;

		try{
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(sql);
			initPreparedParamer(stmt,paramter,id);
			stmt.execute();
			
		}catch(java.sql.SQLException ext){
			result = false;
			throw new Exception("更新信息失败，错误信息：" +ext.toString());	
		}finally{
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}
		try{
			conn = DBConnection.getConnection();
			String sql2 = "insert into filedept(fileid, departmentid,filepower) values( "+id+", "+((FileVO)paramter.getValue()).getDeptid()+","+((FileVO)paramter.getValue()).getFilepower()+")";
			stmt2 = conn.createStatement();
			stmt2.execute(sql2);
			
			result = true;
			return result;
		}catch(java.sql.SQLException ext){
			result = false;
			throw new Exception("更新信息失败，错误信息：" +ext.toString());	
		}finally{
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}
	}
	public boolean executeUpdate(String sql) throws Exception {
		boolean result 	= false;
		Connection conn	= null;
		Statement stmt 	= null;

		try{
			conn = DBConnection.getConnection();
			stmt = conn.createStatement();
			stmt.executeUpdate(sql);
			result = true;
			return result;
		}catch(java.sql.SQLException ext){
			result = false;
			throw new Exception("更新信息失败，错误信息：" +ext.toString());	
		}finally{
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
	}
	
	public PageHelper getList(String fields,String tables,String condSql, String barUrl, int pageSize, int currentPage) throws Exception {
        ArrayList<Object> recordList = new ArrayList<Object>();
        
		Connection conn 		= null;
		PreparedStatement stmt 	= null;
		ResultSet rs 			= null;

		//String querySQL = "select " + fields + " from " + tables + " where 1=1 " + condition;
        //String countSQL = "select count(*)       from " + tables + " where 1=1 " + condition;

		StringBuffer queryBuffer = new StringBuffer();
		queryBuffer.append("select ");
		queryBuffer.append(fields);
		queryBuffer.append(" from ");
		queryBuffer.append(tables);
		queryBuffer.append(" where 1=1 ");
		queryBuffer.append(condSql);

		StringBuffer countBuffer = new StringBuffer();
		countBuffer.append("select count(*) from  ");
		countBuffer.append(tables);
		countBuffer.append(" where 1=1 ");
		countBuffer.append(condSql);		

		String querySQL = queryBuffer.toString();
        String countSQL = countBuffer.toString();        
        
        int rowsCount = 0;
        PageHelper pageHelper = new PageHelper();        
        
       // pageHelper.setCurrentPage(currentPage); //要显示的是第几页
      // pageHelper.setPageSize(pageSize);       //每页显示几条记录
 
        try {
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(countSQL);        	
			
            rs = stmt.executeQuery();
            if (rs.next()){
                rowsCount = rs.getInt(1);
                
            }   

           // pageHelper.setRecordCount(rowsCount);  	//按当前条件查询结果的全部记录数（总条数）
            
            stmt = conn.prepareStatement(querySQL,ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY);   
            rs = stmt.executeQuery(); 
            pageHelper.setRs(rs);
           // pageHelper.gotoPage(currentPage);
 
            readRecord(rs,recordList,pageSize);
        } catch (SQLException e) {       
        	throw new Exception("查询信息失败，错误信息：" +e.toString());	
        } finally{   
            try {
    			if(rs!=null)			rs.close();
    			if(stmt!=null) 			stmt.close();
    			if(conn!=null) 			DBConnection.releaseConnection(conn);
            } catch (SQLException e) {
            	throw new Exception("关闭数据库失败，错误信息：" +e.toString());	
            }              
        }
        
        //pageHelper.getPageCount();              //按照“页数=记录总数/每页显示条数”得到显示页数
        //pageHelper.setPagebar(barUrl);			//设置上一页，下一页，首页，末页的显示条
        //pageHelper.setObjList(recordList);		//将list对象存储起来
        
        return pageHelper;        
		
	}

	public Object findByPrimary(String tablename, String primarykey, Object id) throws Exception {
		Connection conn = null;
		PreparedStatement stmt = null;
		ResultSet rs = null;
		
		StringBuffer quereyBuffer = new StringBuffer();
		quereyBuffer.append("select * from   ");
		quereyBuffer.append(tablename);
		quereyBuffer.append(" where  ");
		quereyBuffer.append(primarykey);	
		quereyBuffer.append("=?");	
		String querySQL = quereyBuffer.toString();
		
        try{
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(querySQL);        	
			initPreparedParamer(stmt,new KeyValue("primary",id));
            rs = stmt.executeQuery();
            if (rs.next()){
            	return readPrimary(rs);
            }else{
            	return null;
            } 
            
        }catch (SQLException e) {       
        	throw new Exception("根据主键查询信息失败，错误信息：" +e.toString());	
        }finally{   
            try {
    			if(rs!=null)			rs.close();
    			if(stmt!=null) 			stmt.close();
    			if(conn!=null) 			DBConnection.releaseConnection(conn);
            } catch (SQLException e) {
            	throw new Exception("关闭数据库失败，错误信息：" +e.toString());	
            }
        }    
	}

	public int findCount(String querySQL,Object value) throws Exception {
		Connection conn 		= null;
		PreparedStatement stmt 	= null;
		ResultSet rs 			= null;
		
        try{
			conn = DBConnection.getConnection();
			stmt = conn.prepareStatement(querySQL);
			initPreparedParamer(stmt,new KeyValue("count",value));
            rs = stmt.executeQuery();
            if (rs.next()){
            	return rs.getInt(1);
            }else{
            	return 0;
            } 
            
        }catch (SQLException e) {       
        	throw new Exception("根据sql语句查询数量失败，错误信息：" +e.toString());	
        }finally{   
            try {
    			if(rs!=null)			rs.close();
    			if(stmt!=null) 			stmt.close();
    			if(conn!=null) 			DBConnection.releaseConnection(conn);
            } catch (SQLException e) {
            	throw new Exception("关闭数据库失败，错误信息：" +e.toString());	
            }
        }    
	}
	

	//继承类需要重载下面的方法
	protected abstract void		readRecord(ResultSet rs,List recordList,int pageSize) throws SQLException;
	protected abstract void   	initPreparedParamer(PreparedStatement stmt,KeyValue paramter) throws SQLException;
	protected  abstract void initPreparedParamer(PreparedStatement stmt,KeyValue paramter, int id) throws SQLException;
	protected abstract Object	readPrimary(ResultSet rs) throws SQLException;

	
}
