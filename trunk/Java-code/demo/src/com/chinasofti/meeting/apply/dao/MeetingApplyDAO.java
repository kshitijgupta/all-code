package com.chinasofti.meeting.apply.dao;

import java.util.List;

import com.chinasofti.base.db.PageHelper;
import com.chinasofti.meeting.apply.vo.MeetingApplyVO;

public interface MeetingApplyDAO {
	/*
	 * 
	 */

	public boolean insert(MeetingApplyVO vo) throws Exception;
	/*
	 * 
	 */
	public boolean update(MeetingApplyVO vo) throws Exception;
	/*
	 * 
	 */
	public boolean updateState(int id ,String state) throws Exception;		
	/*
	 * 
	 */
	public boolean delete(int id) throws Exception;	
	/*
	 * 
	 */
	public boolean batchdel(String ids) throws Exception;	
	/*
	 * 
	 */
	
	public MeetingApplyVO findByPrimary(int id) throws Exception;	
	/*
	 * 
	 */
	public PageHelper findByAll() throws Exception;	
	/*
	 * 
	 */
	public PageHelper findByState() throws Exception;		
	/*
	 * 
	 */	
	public PageHelper getList(List condList, int pageSize, int currentPage) throws Exception;
	

}
