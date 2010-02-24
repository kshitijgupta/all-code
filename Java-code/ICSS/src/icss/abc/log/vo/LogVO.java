package icss.abc.log.vo;

import java.sql.Timestamp;

public class LogVO {
	
	private int logid;
	//private int contentid;
	private int userid;
	private String userip;
	//private Timestamp time;
	private String describe;
	
	
	
	public String getDescribe() {
		return describe;
	}
	public void setDescribe(String describe) {
		this.describe = describe;
	}
	public int getLogid() {
		return logid;
	}
	public void setLogid(int logid) {
		this.logid = logid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getUserip() {
		return userip;
	}
	public void setUserip(String userip) {
		this.userip = userip;
	}
	
	
	
}
