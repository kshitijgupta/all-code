package ef.luolei.subject.vo;

import java.sql.Timestamp;

import ef.luolei.user.vo.UserVO;

public class NewSubject {
	
	private int id;
	private String title;
	private String content;
	private String author;
	private int    clickamount;
	private int    replyamount;
	private String time;
	private UserVO userVO = new UserVO();
	
	
	public UserVO getUserVO() {
		return userVO;
	}
	public void setUserVO(UserVO userVO) {
		this.userVO.setUserid(userVO.getUserid());
		this.userVO.setPassword(userVO.getPassword());
		this.userVO.setSubjectnum(userVO.getSubjectnum());
		this.userVO.setRenum(userVO.getRenum());
		this.userVO.setUsername(userVO.getUsername());
		this.userVO.setScore(userVO.getScore());
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getAuthor() {
		return author;
	}
	public void setAuthor(String author) {
		this.author = author;
	}
	public int getClickamount() {
		return clickamount;
	}
	public void setClickamount(int clickamount) {
		this.clickamount = clickamount;
	}
	public int getReplyamount() {
		return replyamount;
	}
	public void setReplyamount(int replyamount) {
		this.replyamount = replyamount;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	
}