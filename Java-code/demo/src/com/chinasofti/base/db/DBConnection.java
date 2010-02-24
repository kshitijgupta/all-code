package com.chinasofti.base.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;

import com.chinasofti.base.config.DBConfig;

/**
 * <p>Title: </p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright: Copyright (c) 2006</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 */

public class DBConnection {
	private static int conn_count = 0;
	public static Connection getConnection() throws Exception{
		Connection conn = null;
		try{

		    if(DBConfig.isDebug()){
		    	Class.forName(DBConfig.getDriver());
		    	conn = DriverManager.getConnection(DBConfig.getUrl(),DBConfig.getUserid(),DBConfig.getPassword());
		    }else{
		    	conn = DBConnection.getConnByJndi(DBConfig.getJndi());
		    }
			conn_count++;
			return conn;
		}catch(SQLException ext){
			throw new Exception("数据库连接不成功，错误信息是：" +ext.toString());
		}
		
	}
	public static void releaseConnection(Connection conn) throws Exception{
		try{
			if(conn!=null){
				conn.close();
				conn_count--;
			}
		}catch(SQLException ext){
			throw new Exception("数据库释放不成功，错误信息是：" +ext.toString());
		}
	}
	public static Connection getConnByJndi(String jndi){
		Connection conn = null;
		try {
			Context initConext = new InitialContext();
			Context envCtx = (Context) initConext.lookup("java:comp/env");
			javax.sql.DataSource ds = (javax.sql.DataSource)envCtx.lookup(jndi);
			try {
				conn = ds.getConnection();
				return conn;
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(conn!=null)System.out.println("到了jndiconn");
		return conn;
	}
	public int getConnCount(){
		return conn_count;
	}	
}
