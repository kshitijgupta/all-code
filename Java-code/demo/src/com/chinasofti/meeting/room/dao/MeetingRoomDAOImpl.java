package com.chinasofti.meeting.room.dao;


import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;


import org.apache.log4j.Logger;

import com.chinasofti.base.db.BaseDAOImpl;
import com.chinasofti.base.db.KeyValue;
import com.chinasofti.base.db.PageHelper;
import com.chinasofti.base.util.StringUtil;

import com.chinasofti.meeting.room.vo.MeetingRoomVO;


public class MeetingRoomDAOImpl extends BaseDAOImpl implements MeetingRoomDAO {
	
	protected static Logger  logger = Logger.getLogger(MeetingRoomDAOImpl.class);

	public boolean insert(MeetingRoomVO vo) throws Exception {
		
		String sql = "insert into MEETING_ROOM(MR_ID,MR_NAME,MR_COUNT,MR_ADDRESS,MR_DESC) values(SEQ_MEETING_ROOM.NextVal,?,?,?,?)";
		
		return executeUpdate(sql,new KeyValue("insert",vo));

	}

	public boolean update(MeetingRoomVO vo) throws Exception {
		String sql = "update MEETING_ROOM set MR_NAME=?,MR_COUNT=?,MR_ADDRESS=?,MR_DESC=? where MR_ID =? ";
		
		return executeUpdate(sql,new KeyValue("update",vo));

	}
	
	public boolean delete(int id) throws Exception {
		String sql = "delete from  MEETING_ROOM where MR_ID = ?";
		return executeUpdate(sql,new KeyValue("delete",new Integer(id)));
	}

	public boolean batchdel(String ids) throws Exception {
		StringBuffer buffer = new StringBuffer();
		buffer.append("delete from  MEETING_ROOM where MR_ID in(").append(ids).append(")");
		return executeUpdate(buffer.toString());
	}
	
	public PageHelper findByAll() throws Exception {
		int pageSize = 1000; //对于查询所有的记录，考虑一般情况查询1000条以内
		return getList("",pageSize,1);
		
	}

	public MeetingRoomVO findByPrimary(int id) throws Exception {
		return (MeetingRoomVO)findByPrimary("MEETING_ROOM","MR_ID",new Integer(id));
	}

	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception {
		
		String fields 		= "MR_ID,MR_NAME,MR_COUNT,MR_ADDRESS,MR_DESC";
		String tables 		= "MEETING_ROOM";
		String barUrl		= "MeetingRoomServlet";
		String condSql 		= "";
		
		logger.debug("condition:" + condition);
		if(!(condition.equals(""))){
			Map condMap   = StringUtil.readCondition(condition);
			String mrName = (String)condMap.get("mrName");
			String mrCount = (String)condMap.get("mrCount");
			
			if(mrName!=null) condSql = condSql + " and MR_NAME like '%" + mrName + "%'";
			if(mrCount!=null) condSql = condSql + " and MR_COUNT >= " + mrCount ;
			
			logger.debug("condSql:" + condSql);
		}
		return getList(fields,tables,condSql,barUrl, pageSize,currentPage);
	}	

	
//	public boolean update(MeetingRoomVO vo) throws Exception {
//		boolean result  = false;
//		Connection conn = null;
//		PreparedStatement stmt = null;
//		String sql = "update MEETING_ROOM set MR_NAME=?,MR_COUNT=?,MR_ADDRESS=?,MR_DESC=? where MR_ID =? ";
//		try{
//			conn = DBConnection.getConnection();
//			stmt = conn.prepareStatement(sql);
//			stmt.setString(1,vo.getMrName());
//			stmt.setInt(2, vo.getMrCount());
//			stmt.setString(3,vo.getMrAddress());
//			stmt.setString(4, vo.getMrDesc());
//			stmt.setInt(5,vo.getMrId());
//			stmt.execute();
//			result = true;
//			return result;
//		}catch(java.sql.SQLException ext){
//			result = false;
//			throw new Exception("更新会议室信息失败，错误信息：" +ext.toString());	
//		}finally{
//			if(stmt!=null) stmt.close();
//			if(conn!=null) DBConnection.releaseConnection(conn);
//		}	
//	}

	//继承类需要重载此方法
	@SuppressWarnings("unchecked")
	@Override
	protected  void readRecord(ResultSet rs,List recordList,int pageSize) throws SQLException{
        int i = 0;
		while (rs.next() && i<pageSize){
            i++;       
            MeetingRoomVO vo = new MeetingRoomVO();
            vo.setMrId(rs.getInt("MR_ID"));
            vo.setMrName(rs.getString("MR_NAME"));
            vo.setMrCount(rs.getInt("MR_COUNT"));
            vo.setMrAddress(rs.getString("MR_ADDRESS"));
            vo.setMrDesc(rs.getString("MR_DESC"));
            recordList.add(vo);
        }    
	}
	

	@Override
	protected void initPreparedParamer(PreparedStatement stmt, KeyValue paramter) throws SQLException {
		String key = paramter.getKey();
		
		if(key.equals("insert")){
			MeetingRoomVO  vo =(MeetingRoomVO)paramter.getValue();
			stmt.setString(1,vo.getMrName());
			stmt.setInt(2, vo.getMrCount());
			stmt.setString(3,vo.getMrAddress());
			stmt.setString(4, vo.getMrDesc());
			
		}else if(key.equals("update")){
			MeetingRoomVO  vo =(MeetingRoomVO)paramter.getValue();
			stmt.setString(1,vo.getMrName());
			stmt.setInt(2, vo.getMrCount());
			stmt.setString(3,vo.getMrAddress());
			stmt.setString(4, vo.getMrDesc());
			stmt.setInt(5,vo.getMrId());
			
		}else if(key.equals("delete")){
			Integer id = (Integer)paramter.getValue();
			stmt.setInt(1,id.intValue() );
			
		}else if(key.equals("primary")){
			Integer id = (Integer)paramter.getValue();
			stmt.setInt(1,id.intValue() );
		}else if(key.equals("count")){
			String mrName = (String)paramter.getValue();
			stmt.setString(1,mrName );
		}				
		
	}

	@Override
	protected Object readPrimary(ResultSet rs) throws SQLException {
        MeetingRoomVO vo = new MeetingRoomVO();
        vo.setMrId(rs.getInt("MR_ID"));
        vo.setMrName(rs.getString("MR_NAME"));
        vo.setMrCount(rs.getInt("MR_COUNT"));
        vo.setMrAddress(rs.getString("MR_ADDRESS"));
        vo.setMrDesc(rs.getString("MR_DESC"));
		return vo;
	}

	public boolean checkExist(String mrName) throws Exception {
		String querySQL = "select count(*)  from MEETING_ROOM where MR_NAME =? " ;
		int count = findCount(querySQL, mrName);
		if(count>0) return true;
		else		return false;
	}

}
