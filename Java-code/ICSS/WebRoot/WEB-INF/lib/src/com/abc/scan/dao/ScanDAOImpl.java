package com.abc.scan.dao;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

import com.abc.scan.vo.ScanVO;
import com.abc.scan.vo.TreeVO;


import icss.abc.base.db.BaseDAOImpl;
import icss.abc.base.db.DBConnection;
import icss.abc.base.db.KeyValue;

public class ScanDAOImpl extends BaseDAOImpl implements ScanDAO{
	
	public boolean move(int folderId, String ids, int count) throws Exception {
		if(count > 0){
			if(count == 1){
				String sql = "update filefolder set FOLDERID='"+folderId+"' where FILEID='"+ids+"'";
				return executeUpdate(sql);
			}else{
				String sql = "update filefolder set FOLDERID='"+folderId+"' where FILEID in("+ids+")";
				return executeUpdate(sql);
			}
		}
		return false;
	}

	public boolean delete(int id) throws Exception {
		return false;
	}

	public ScanVO findByPrimary(int id) throws Exception {
		return null;
	}

	public boolean insert(ScanVO vo) throws Exception {
		return false;
	}

	public boolean update(ScanVO vo) throws Exception {
		return false;
	}

	public ResultSet findAllByType(String type) throws Exception {
		return null;
	}

	public ScanVO getFileById(int id) throws Exception {
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from abcfile inner join filedept on abcfile.fileid = filedept.fileid where abcfile.FILEID="+id+"");
		
		ScanVO vo = new ScanVO();
		
		try{
			if(rs!=null && rs.next()){
				vo.setDownLoadTimes(rs.getInt("DOWNLOADTIMES"));
				vo.setFileAuthor(rs.getString("FILEAUTHOR"));
				vo.setFileDescribe(rs.getString("FILEDESCRIBE"));
				vo.setFileId(rs.getInt("FILEID"));
				vo.setFileLabel(rs.getString("FILELABEL"));
				vo.setFileName(rs.getString("FILENAME"));
				vo.setFileType(rs.getString("FILETYPE"));
				vo.setTime(rs.getDate("time"));
				vo.setFileUrl(rs.getString("FILEURL")); 
				vo.setFilePower(rs.getInt("FILEPOWER"));
				vo.setAll();
			}
		}catch(Exception ext){
			vo = null;
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(rs!=null)   rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
		
		return vo;
	}
	
	public ArrayList<TreeVO> getTree() throws Exception{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select * from ABCFOLDER");
	
		ArrayList<TreeVO> treeList = new ArrayList<TreeVO>();
		
		try{
			while(rs!=null && rs.next()){
				TreeVO vo = new TreeVO();
				vo.setEnd(rs.getBoolean("isEnd"));
				vo.setFatherFolder(rs.getInt("fatherFolder"));
				vo.setFolderId(rs.getInt("folderId"));
				vo.setFolderLayer(rs.getInt("folderLayer"));
				vo.setFoldName(rs.getString("foldName"));
				
				treeList.add(vo);
			}
		}catch(Exception ext){
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(rs!=null)   rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
		
		return treeList;
	}
	
	public int getDepartmentById(long id) throws Exception{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select DEPARTMENTID from userdept where USERID="+id+"");
		
		int department = -1;
		
		try{
			if(rs!=null && rs.next()){
				department = rs.getInt("DEPARTMENTID");
			}
		}catch(Exception ext){
			department = -1;
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(rs!=null)   rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
		
		return department;
	}
	
	public int getPowerById(long id) throws Exception{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select POWER from userpower where USERID="+id+"");
		
		int power = 100;
		
		try{
			if(rs!=null && rs.next()){
				power = rs.getInt("POWER");
			}
		}catch(Exception ext){
			power = 100;
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(rs!=null)   rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	
		
		return power;
	}
	
	public String getUsernameById(long id) throws Exception{
		Connection conn = DBConnection.getConnection();
		Statement stmt = conn.createStatement();
		ResultSet rs = stmt.executeQuery("select USERNAME from usertable where USERID="+id+"");
		
		String name = null;
		
		try{
			if(rs!=null && rs.next()){
				name = rs.getString("USERNAME");
			}
		}catch(Exception ext){
			name = null;
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(rs!=null)   rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) DBConnection.releaseConnection(conn);
		}	 
		
		return name;
	}
	
	public boolean updateName(int folderId, String newName) throws Exception{
		newName = new String(newName.getBytes("ISO-8859-1"), "UTF-8");
		String sql = "update abcfolder set FOLDNAME='"+newName+"' where FOLDERID='"+folderId+"'";
		return executeUpdate(sql);
	}
	
	public boolean deleteFolder (int folderId) throws Exception{
		String sql = "delete from  abcfolder where FOLDERID='"+folderId+"'";
		return executeUpdate(sql);
	}
	
	public boolean addName(int folderId, String newname) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		int right = -1;
		String sql = "select FOLDERLAYER from ABCFOLDER where FOLDERID='"+folderId+"'";

		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				right = countRs.getInt("FOLDERLAYER");
			}
		}catch(java.sql.SQLException ext){
			right = -1;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(right != -1){
			right++;
		}else{
			return false;
		}
		
		int id = -1;
		sql = "select FOLDERID from ABCFOLDER Order By FOLDERID desc";

		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				id = countRs.getInt("FOLDERID");
			}
		}catch(java.sql.SQLException ext){
			id = -1;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(id != -1){
			if(folderId%2==0){
				if(id%2==0){
					id += 2;
				}
				if(id%2==1){
					id += 1;
				}
			}
			if(folderId%2==1){
				if(id%2==0){
					id += 1;
				}
				if(id%2==1){
					id += 2;
				}
			}
		}else{
			return false;
		}
		
		newname = new String(newname.getBytes("ISO-8859-1"), "UTF-8");
		
		sql = "insert into abcfolder(FOLDERID,FOLDNAME,FATHERFOLDER,FOLDERLAYER,ISEND) " +"values("+id+",'"+newname+"',"+folderId+","+right+","+1+")";
		return executeUpdate(sql);
	}
	
	public boolean fileDelete(String str, int count, String realPath) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		String url = null;
		String sql = "select fileurl from abcfile where fileid in("+str+")";
		
		boolean ok = false;
		
		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			while(countRs!=null && countRs.next()){
				url = countRs.getString("fileurl");
				File file = new File(realPath+"\\"+url); 
				if (!file.isDirectory()) { 
					ok = ok || file.delete(); 
				} 
			}
		}catch(java.sql.SQLException ext){
			url = null;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(url == null){
			return false;
		}
		
		/*
		if(ok == false){
			return false;
		}*/
		
		if(count > 0){
			sql = "delete from abcfile where fileid in("+str+")";
			return executeUpdate(sql);
		}else{
			return false;
		}
		
	}
	
	public String fileDown(String str, int count, String realPath, int userKey) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		String result = null;
		
		String url = null;
		String sql = "select fileurl from abcfile where fileid in("+str+")";
		
		String name = count+"_"+userKey+"_"+str.replaceAll(",", "_")+".zip";
		result = realPath+File.separator+"to_down"+File.separator+count+"_"+userKey+"_"+str.replaceAll(",", "_")+".zip";
		
		File zippedfile = new File(result);
		
		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
				
			FileOutputStream       fos = new FileOutputStream(zippedfile);
			BufferedOutputStream   bos = new BufferedOutputStream(fos);   
	        ZipOutputStream     zipoutputstream   =   new   ZipOutputStream(bos);   
	        FileInputStream     fileinputstream;   
	        BufferedInputStream bufferedinputstream;   
	        File file; 
			
			while(countRs!=null && countRs.next()){
				url = countRs.getString("fileurl");
				
				file = new File(realPath+"\\"+url);
				fileinputstream = new FileInputStream(file);
				
                fileinputstream       =   new   FileInputStream(file);   
			    bufferedinputstream   =   new   BufferedInputStream(fileinputstream);   
			    ZipEntry   zipentry   =   new   ZipEntry(file.getName());   
			  
			    zipentry.setMethod(ZipEntry.DEFLATED);   
			    zipoutputstream.putNextEntry(zipentry);   
			    byte   b[]   =   new   byte[512];   
			    int   len;   
			    while((len=bufferedinputstream.read(b))   !=   -1){   
			        zipoutputstream.write(b,0,len);   
			    }   
			    zipoutputstream.flush();
			}
			
			zipoutputstream.closeEntry();   
	        zipoutputstream.close();
	        
		}catch(java.sql.SQLException ext){
			url = null;
			name = null;
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(url == null){
			return null;
		}

		return name;	
	}

	@Override
	protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter)
			throws SQLException {
		// TODO Auto-generated method stub
		
	}

	@Override
	protected void initPreparedParamer(PreparedStatement stmt,
			KeyValue paramter, int id) throws SQLException {
		// TODO Auto-generated method stub
		
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
	
	
	
}
