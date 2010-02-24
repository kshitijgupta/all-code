package com.chinasofti.meeting.apply.dao;

import java.util.List;

import com.chinasofti.meeting.apply.vo.FileInfoVO;

public interface FileInfoDAO {
	/*
	 * 
	 */

	public boolean insert(FileInfoVO vo) throws Exception;
	/*
	 * 
	 */
	public boolean update(FileInfoVO vo) throws Exception;	
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
	
	public FileInfoVO findByPrimary(int id) throws Exception;	
	/*
	 * 
	 */
	public List findByMeeting(int meetingId) throws Exception;	
}
