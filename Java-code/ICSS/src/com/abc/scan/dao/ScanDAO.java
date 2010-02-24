package com.abc.scan.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.abc.scan.vo.ScanVO;
import com.abc.scan.vo.TreeVO;

public interface ScanDAO  {
	/*
	 * �������
	 */
	public boolean insert(ScanVO vo) throws Exception;
	/*
	 * ����
	 */
	public boolean update(ScanVO vo) throws Exception;	
	/*
	 * ����ID������#�ָ���ɾ������
	 */
	public boolean delete(int id) throws Exception;	
	/*
	 * ����ID������#�ָ����ƶ�����
	 */
	public boolean move(int folderId, String ids, int count) throws Exception;	
	/*
	 * ����ID�����Ҷ���
	 */
	public ScanVO findByPrimary(int id) throws Exception;	
	/*
	 * �������л����Ҷ���id
	 */
	public ResultSet findAllByType(String type) throws Exception;	
	
	
	public ScanVO getFileById(int id) throws Exception;
	
	
	public ArrayList<TreeVO> getTree() throws Exception;
	
	public int getDepartmentById(long id) throws Exception;
	
	public int getPowerById(long id) throws Exception;
	
	public String getUsernameById(long id) throws Exception;
	
	public boolean updateName(int folderId, String newName) throws Exception;
	
	public boolean deleteFolder (int folderId) throws Exception;
	
	public boolean addName(int folderId, String newname) throws Exception;
	
	public boolean fileDelete(String str, int count, String realPath) throws Exception;
	
	public String fileDown(String str, int count, String realPath, int userKey) throws Exception;
}