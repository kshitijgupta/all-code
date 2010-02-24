package icss.abc.base.config;

import java.util.ResourceBundle;
/**
 * <p>Title: </p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright:  Copyright (c) 2008</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 * Ŀ����ͨ��һ�������ļ��õ����ݿ����ӵı�Ҫ��Ϣ��
 * 		�Ƿ���debug�������Ƿ�ʹ��jndi�������ݿ�����url�����ݿ�����driver���û������û�����
 * 
 */
public class DBConfig {
	private static String	DB_FILE		= "db";
	private static boolean 	debug 		= true;
	private static String	jndi	 	= "";
	private static String	url 		= "";
	private static String	driver 		= "";
	private static String	userid 		= "";
	private static String	password	= "";
	
	
	
	
	
	static {
		    getConfigeration();
	}

	public DBConfig() {

	}
	static void getConfigeration() {
		ResourceBundle resources = ResourceBundle.getBundle(DBConfig.DB_FILE);
		if(resources.getString("debug").equalsIgnoreCase("true")) 	debug = true;
		else debug = false;
		url    	 =  resources.getString("url");
		driver 	 =  resources.getString("driver");
		userid	 =  resources.getString("userid");
		password =  resources.getString("password");
		jndi	 =	resources.getString("jndi");
		if(debug){
			if(url==null||url.equals("")||driver==null||driver.equals("")||userid==null||userid.equals("")){
				System.err.println("�������ò�ȫ��������db.properties");
			}
		}
	}
	
	public static boolean isDebug() {
		return debug;
	}
	public static void setDebug(boolean debug) {
		DBConfig.debug = debug;
	}
	public static String getDriver() {
		return driver;
	}
	public static void setDriver(String driver) {
		DBConfig.driver = driver;
	}
	public static String getJndi() {
		return jndi;
	}
	public static void setJndi(String jndi) {
		DBConfig.jndi = jndi;
	}
	public static String getPassword() {
		return password;
	}
	public static void setPassword(String password) {
		DBConfig.password = password;
	}
	public static String getUrl() {
		return url;
	}
	public static void setUrl(String url) {
		DBConfig.url = url;
	}
	public static String getUserid() {
		return userid;
	}
	public static void setUserid(String userid) {
		DBConfig.userid = userid;
	}
	
}
