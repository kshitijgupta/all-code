package icss.abc.base.db;




public interface BaseDAO {

	/*
	 * 执行带有参数的SQL,根据SQL语句和字段参数来执行插入、更新和删除等操作
	 */	
	public boolean executeUpdate(String sql,KeyValue paramter) throws Exception; 
	/*
	 * 执行不带有参数的SQL，根据SQL语句插入、更新和删除等操作
	 */	
	public boolean executeUpdate(String sql) throws Exception; 	
	/*
	 * 根据主键返回对象
	 */	
	public Object findByPrimary(String tablename,String primarykey,Object id) throws Exception;

	/*
	 * 根据查询结果为整数的语句返回整型结果
	 */	
	public int findCount(String querySQL,Object value) throws Exception ;	
	/*
	 * 根据字段列表、表列表、条件、前台的链接、翻页行数、当前页得到当前的记录集提供给前台翻页
	 */
	public PageHelper getList(String fields,String tables,String condSql, String barUrl, int pageSize, int currentPage) throws Exception ;
	
}
