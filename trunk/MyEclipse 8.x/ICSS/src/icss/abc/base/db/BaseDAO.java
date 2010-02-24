package icss.abc.base.db;




public interface BaseDAO {

	/*
	 * ִ�д��в�����SQL,����SQL�����ֶβ�����ִ�в��롢���º�ɾ���Ȳ���
	 */	
	public boolean executeUpdate(String sql,KeyValue paramter) throws Exception; 
	/*
	 * ִ�в����в�����SQL������SQL�����롢���º�ɾ���Ȳ���
	 */	
	public boolean executeUpdate(String sql) throws Exception; 	
	/*
	 * �����������ض���
	 */	
	public Object findByPrimary(String tablename,String primarykey,Object id) throws Exception;

	/*
	 * ���ݲ�ѯ���Ϊ��������䷵�����ͽ��
	 */	
	public int findCount(String querySQL,Object value) throws Exception ;	
	/*
	 * �����ֶ��б����б�������ǰ̨�����ӡ���ҳ��������ǰҳ�õ���ǰ�ļ�¼���ṩ��ǰ̨��ҳ
	 */
	public PageHelper getList(String fields,String tables,String condSql, String barUrl, int pageSize, int currentPage) throws Exception ;
	
}
