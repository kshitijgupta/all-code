package icss.abc.user.dao;

import icss.abc.user.vo.UserVO;
import icss.abc.base.db.PageHelper;

public interface UserDAO {
	
	//插入用户对象；
	public boolean insert(UserVO vo)throws Exception;
	
	//更新用户对象；
	public boolean update(UserVO vo)throws Exception;
	
	//通过用户id删除用户对象
	public boolean delete(int id)throws Exception;
	
	//根据用户id串(以,分隔)批量删除用户
	public boolean batchdel(String ids) throws Exception;
	
	
	//通过主键id查找用户
	public UserVO findByPrimary(int id)throws Exception;
	
	//查找所有用户
	public PageHelper findAll()throws Exception;
	
	
	//查找条件、当前页、行数查找会议室对象列表
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	
	
	  //查找名称是否同名
	 	
	public boolean checkExist(String mrName) throws Exception;
}
