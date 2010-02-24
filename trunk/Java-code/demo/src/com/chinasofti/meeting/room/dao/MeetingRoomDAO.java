package com.chinasofti.meeting.room.dao;


import com.chinasofti.meeting.room.vo.MeetingRoomVO;
import com.chinasofti.base.db.PageHelper;

public interface MeetingRoomDAO  {
	/*
	 * ��������Ҷ���
	 */

	public boolean insert(MeetingRoomVO vo) throws Exception;
	/*
	 * ���»����Ҷ���
	 */
	public boolean update(MeetingRoomVO vo) throws Exception;	
	/*
	 * ����IDɾ�������Ҷ���
	 */
	public boolean delete(int id) throws Exception;	
	/*
	 * ���ݻ���ID������,�ָ���ɾ�������Ҷ���
	 */
	public boolean batchdel(String ids) throws Exception;	
	/*
	 * ���ݻ���ID�����һ����Ҷ���
	 */
	
	public MeetingRoomVO findByPrimary(int id) throws Exception;	
	/*
	 * �������л����Ҷ���
	 */
	public PageHelper findByAll() throws Exception;	
	/*
	 * ������������ǰҳ���������һ����Ҷ����б�
	 */	
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	/*
	 * ���������Ƿ�ͬ��
	 */	
	public boolean checkExist(String mrName) throws Exception;
		
}
