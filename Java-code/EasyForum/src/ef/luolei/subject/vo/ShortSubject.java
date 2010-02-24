package ef.luolei.subject.vo;
//点击版块名称后的主题列表的主题模型
public class ShortSubject {
	
	private int    id;
	private String title;
	private String author;
	private int    clickamount;
	private int    replyamount;
	private String time;
	private String lastauthor;
	
	
	
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
	public String getLastauthor() {
		return lastauthor;
	}
	public void setLastauthor(String lastauthor) {
		this.lastauthor = lastauthor;
	}
	
	
}
