package icss.abc.file.dao;

import icss.abc.base.db.PageHelper;
import icss.abc.file.vo.FileVO;
import icss.abc.user.vo.UserVO;

public interface FileDAO {
	
	//�����ļ�����
	public boolean insert(FileVO vo)throws Exception;
	
	//�����ļ�����
	public boolean update(FileVO vo)throws Exception;
	
	//ͨ���û�idɾ���ļ�����
	public boolean delete(int id)throws Exception;
	
	//�����û�id��(��,�ָ�)����ɾ���ļ�
	public boolean batchdel(String ids) throws Exception;
	
	
	//ͨ������id�����ļ�
	public FileVO findByPrimary(int id)throws Exception;
	
	//���������ļ�
	public PageHelper findAll()throws Exception;

	
	//������������ǰҳ���������һ����Ҷ����б��������������ļ��б�
	public PageHelper getList(String condition, int pageSize, int currentPage) throws Exception;

	
	
}