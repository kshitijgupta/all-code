package com.chinasofti.meeting.room.dao;


import com.chinasofti.meeting.room.vo.MeetingRoomVO;
import com.chinasofti.base.db.PageHelper;

public interface MeetingRoomDAO  {
	/*
	 * 插入会议室对象
	 */

	public boolean insert(MeetingRoomVO vo) throws Exception;
	/*
	 * 更新会议室对象
	 */
	public boolean update(MeetingRoomVO vo) throws Exception;	
	/*
	 * 根据ID删除会议室对象
	 */
	public boolean delete(int id) throws Exception;	
	/*
	 * 根据会议ID串（以,分隔）删除会议室对象
	 */
	public boolean batchdel(String ids) throws Exception;	
	/*
	 * 根据会议ID串查找会议室对象
	 */
	
	public MeetingRoomVO findByPrimary(int id) throws Exception;	
	/*
	 * 查找所有会议室对象
	 */
	public PageHelper findByAll() throws Exception;	
	/*
	 * 查找条件、当前页、行数查找会议室对象列表
	 */	
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	/*
	 * 查找名称是否同名
	 */	
	public boolean checkExist(String mrName) throws Exception;
		
}
