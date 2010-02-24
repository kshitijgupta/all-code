package ef.luolei.user.vo;

public class UserVO {
	
	private int userid;
	private String password = "";
	private String username;
	private int subjectnum = 0;
	private int renum = 0;
	private int score = 100;
	
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getSubjectnum() {
		return subjectnum;
	}
	public void setSubjectnum(int subjectnum) {
		this.subjectnum = subjectnum;
	}
	public int getRenum() {
		return renum;
	}
	public void setRenum(int renum) {
		this.renum = renum;
	}
	public int getScore() {
		return score;
	}
	public void setScore(int score) {
		this.score = score;
	}
}
