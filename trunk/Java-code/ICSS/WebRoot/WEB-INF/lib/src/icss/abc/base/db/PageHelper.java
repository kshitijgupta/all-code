package icss.abc.base.db;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.abc.scan.constants.Constants;
import com.abc.scan.vo.ScanVO;

public class PageHelper {
	private ResultSet rs = null;
	
	private Connection conn	= null;
	private PreparedStatement stmt 	= null;

	public int getCountByType(String type, int userPower) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		int count = 0;
		String sql = "select count(*) from filedept join abcfile on filedept.fileid=abcfile.fileid where FILETYPE='"+type+"' and FILEPOWER >" + userPower + " and flag = 1 and DEPARTMENTID = 1";

		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				count = countRs.getInt(1);
			}
		}catch(java.sql.SQLException ext){
			count = 0;

			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		return count;
	}
	
	public int getCountById(int id, int userPower, int userDepartment) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		//公共奇数 内部偶数
		String sql = "select count(*) from filefolder join filedept on filefolder.fileid=filedept.fileid join abcfile on abcfile.fileid = filefolder.fileid where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and flag = 1";
		
		if(userPower > Constants.UPDATE){
			if(id%2 == 1){
				sql = "select count(*) from filefolder join filedept on filefolder.fileid=filedept.fileid join abcfile on abcfile.fileid = filefolder.fileid where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and flag = 1 and DEPARTMENTID = 1";
			}else
				if(id%2 == 0){
					sql = "select count(*) from filefolder join filedept on filefolder.fileid=filedept.fileid join abcfile on abcfile.fileid = filefolder.fileid where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and DEPARTMENTID=" + userDepartment + " and flag = 1";
				}
		}
		int count = 0;
		
		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				count = countRs.getInt(1);
			}
		}catch(java.sql.SQLException ext){
			count = 0;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		return count;
	}
	
	public ScanVO[] getListByType(int size, int num, String type, int userPower) throws Exception{
		ScanVO[] vo = null;
		try{
			findAllByType(type, userPower);
			
			if(this.rs == null)
				throw new Exception("rs未得到。。。");	
			if(!rs.next())
				return reset();
			
			if(size==Constants.SMALLLIST || size==Constants.BIGLIST)
				vo = new ScanVO[size];
			else return reset();
				
			
			if(this.rs.absolute(num+1)){
				vo[0] = new ScanVO();
				setVO(this.rs, vo[0]);
			}
			else return reset();
				
			
			for(int i=1; i<size; i++){
				if(this.rs.next()){
					vo[i] = new ScanVO();
					setVO(this.rs, vo[i]);
				}else
					vo[i] = null;
			}
		}catch(Exception exception){
			throw new Exception("数据设置不成功，错误为：“" + exception.toString() + "”");
		}finally{
			reset();
		}
		
		return vo;
	}
	
	public ScanVO[] getListById(int size, int num, int id, int userPower, int userDepartment) throws Exception{
		ScanVO[] vo = null;
		try{
			findAllById(id , userPower, userDepartment);
			
			if(this.rs == null)
				throw new Exception("rs未得到。。。");	
			if(!rs.next())
				return reset();
			
			if(size==Constants.SMALLLIST || size==Constants.BIGLIST)
				vo = new ScanVO[size];
			else return reset();
				
			
			if(this.rs.absolute(num+1)){
				vo[0] = new ScanVO();
				setVO(this.rs, vo[0]);
			}
			else return reset();
				
			
			for(int i=1; i<size; i++){
				if(this.rs.next()){
					vo[i] = new ScanVO();
					setVO(this.rs, vo[i]);
				}else
					vo[i] = null;
			}
		}catch(Exception exception){
			throw new Exception("数据设置不成功，错误为：“" + exception.toString() + "”");
		}finally{
			reset();
		}
		
		return vo;
	}
	
	public ScanVO[] reset() throws Exception{
		if(rs!=null) this.rs.close();
		if(this.stmt!=null) this.stmt.close();
		if(this.conn!=null) DBConnection.releaseConnection(this.conn);
		
		this.rs   = null;
		this.stmt = null;
		this.conn = null;
		
		return null;
	}
	
	public void setVO(ResultSet rs, ScanVO vo) throws Exception{
		try{
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
		}catch(SQLException exception){
			throw new Exception("数据提交不成功，错误为：“" + exception.toString() + "”");
		}
	}
	
	public void findAllByType(String type, int userPower) throws Exception {
		String sql = "select * from abcfile join filedept on abcfile.fileid = filedept.fileid where FILETYPE='"+type+"' and FILEPOWER > "+ userPower + " and flag = 1 and DEPARTMENTID = 1";
		
		try{
			executeQuery(sql);
		}catch(SQLException exception){
			this.rs = null;
			throw new Exception("数据获取不成功，错误为：“" + exception.toString() + "”");
		}
	}
	
	public void findAllById(int id, int userPower, int userDepartment) throws Exception {
		String sql = "select * from abcfile join filefolder on abcfile.fileid = filefolder.fileid join filedept on filefolder.fileid = filedept.fileid  where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and flag = 1";
		
		if(userPower > Constants.UPDATE){
			if(id%2 == 1){
				sql = "select * from abcfile join filefolder on abcfile.fileid = filefolder.fileid join filedept on filefolder.fileid = filedept.fileid  where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and flag = 1 and DEPARTMENTID = 1"; 
			}else
				if(id%2 == 0){
					sql = "select * from abcfile join filefolder on abcfile.fileid = filefolder.fileid join filedept on filefolder.fileid = filedept.fileid  where FOLDERID='"+id+"' and FILEPOWER >" + userPower + " and DEPARTMENTID=" + userDepartment + " and flag = 1";
				}
		}
		try{
			executeQuery(sql);
		}catch(SQLException exception){
			this.rs = null;
			throw new Exception("数据获取不成功，错误为：“" + exception.toString() + "”");
		}
	}
	
	public void executeQuery(String sql) throws Exception {
		try{
			this.conn = DBConnection.getConnection();
			this.stmt = conn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			this.rs = stmt.executeQuery();
		}catch(java.sql.SQLException ext){
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}
	}
	
	public int isEmpty(int folderId) throws Exception{
		Connection countConn        = null;
		PreparedStatement countStmt = null;
		ResultSet countRs           = null;
		
		//公共奇数 内部偶数
		String sql = "select count(*) from filefolder where FOLDERID='"+folderId+"'";
		
		int count = 0;
		
		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				count = countRs.getInt(1);
			}
		}catch(java.sql.SQLException ext){
			count = 0;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(count != 0){
			return 1;
		}
		
		sql = "select count(*) from abcfolder where FATHERFOLDER='"+folderId+"'";
		
		try{
			countConn = DBConnection.getConnection();
			countStmt = countConn.prepareStatement(sql, ResultSet.TYPE_SCROLL_INSENSITIVE, ResultSet.CONCUR_READ_ONLY );
			countRs   = countStmt.executeQuery();
			
			if(countRs!=null && countRs.next()){
				count = countRs.getInt(1);
			}
		}catch(java.sql.SQLException ext){
			count = 0;
			
			throw new Exception("查询信息失败，错误信息：" +ext.toString());	
		}finally{
			if(countRs  != null) countRs.close();
			if(countStmt!= null) countStmt.close();
			if(countConn!= null) DBConnection.releaseConnection(countConn);
		}
		
		if(count != 0){
			return 1;
		}
			
		return 0;
	}

	public ResultSet getRs() {
		return rs;
	}

	public void setRs(ResultSet rs) {
		this.rs = rs;
	}
}
