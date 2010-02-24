package com.abc.scan.dao;

import java.sql.ResultSet;
import java.util.ArrayList;

import com.abc.scan.vo.ScanVO;
import com.abc.scan.vo.TreeVO;

public interface ScanDAO  {
	/*
	 * 插入对象
	 */
	public boolean insert(ScanVO vo) throws Exception;
	/*
	 * 对象
	 */
	public boolean update(ScanVO vo) throws Exception;	
	/*
	 * 根据ID串（以#分隔）删除对象
	 */
	public boolean delete(int id) throws Exception;	
	/*
	 * 根据ID串（以#分隔）移动对象
	 */
	public boolean move(int folderId, String ids, int count) throws Exception;	
	/*
	 * 根据ID串查找对象
	 */
	public ScanVO findByPrimary(int id) throws Exception;	
	/*
	 * 查找所有会议室对象id
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