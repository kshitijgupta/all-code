package icss.abc.file.dao;

import icss.abc.base.db.PageHelper;
import icss.abc.file.vo.FileVO;
import icss.abc.user.vo.UserVO;

public interface FileDAO {
	
	//插入文件对象；
	public boolean insert(FileVO vo)throws Exception;
	
	//更新文件对象；
	public boolean update(FileVO vo)throws Exception;
	
	//通过用户id删除文件对象
	public boolean delete(int id)throws Exception;
	
	//根据用户id串(以,分隔)批量删除文件
	public boolean batchdel(String ids) throws Exception;
	
	
	//通过主键id查找文件
	public FileVO findByPrimary(int id)throws Exception;
	
	//查找所有文件
	public PageHelper findAll()throws Exception;

	
	//查找条件、当前页、行数查找会议室对象列表，根据条件查找文件列表
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	
	
}