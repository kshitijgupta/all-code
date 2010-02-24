package ef.luolei.reply.vo;

import java.sql.Timestamp;

import ef.luolei.user.vo.UserVO;

public class ReplyVO {
	
	private int id;
	private String content;
	private String author;
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
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
}
