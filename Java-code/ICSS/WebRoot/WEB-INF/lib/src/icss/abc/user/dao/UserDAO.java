package icss.abc.user.dao;

import icss.abc.user.vo.UserVO;
import icss.abc.base.db.PageHelper;

public interface UserDAO {
	
	//�����û�����
	public boolean insert(UserVO vo)throws Exception;
	
	//�����û�����
	public boolean update(UserVO vo)throws Exception;
	
	//ͨ���û�idɾ���û�����
	public boolean delete(int id)throws Exception;
	
	//�����û�id��(��,�ָ�)����ɾ���û�
	public boolean batchdel(String ids) throws Exception;
	
	
	//ͨ������id�����û�
	public UserVO findByPrimary(int id)throws Exception;
	
	//���������û�
	public PageHelper findAll()throws Exception;
	
	
	//������������ǰҳ���������һ����Ҷ����б�
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	
	
	  //���������Ƿ�ͬ��
	 	
	public boolean checkExist(String mrName) throws Exception;
}
