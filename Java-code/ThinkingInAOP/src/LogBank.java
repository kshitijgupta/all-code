//银行的日志管理类

public class LogBank {
	private String log;

	public String getLog() {
		return log;
	}

	public void setLog(String log) {
		this.log = log;
	}
	
	public void writelog(String s){
		setLog(s);
		System.out.println(s);
	}

}
