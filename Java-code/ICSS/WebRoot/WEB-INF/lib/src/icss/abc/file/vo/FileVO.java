package icss.abc.file.vo;

import java.sql.Date;

public class FileVO {
	
	private String filename;//1
	private String fileauthor;//1
	private Date sqldate;//1
	private int deptid;//1
	private int downloadtimes;
	private String filetype;//1
	private String filedescribe;//1
	private String filelabel;//1
	private int filepower;//1
	private int flag;//1表示已审核0表示未审核1
	private String fileURL;
	
	
	
	public String getFileURL() {
		return fileURL;
	}
	public void setFileURL(String fileURL) {
		this.fileURL = fileURL;
	}
	public int getFilepower() {
		return filepower;
	}
	public void setFilepower(int filepower) {
		this.filepower = filepower;
	}
	public int getFlag() {
		return flag;
	}
	public void setFlag(int flag) {
		this.flag = flag;
	}
	public String getFilelabel() {
		return filelabel;
	}
	public void setFilelabel(String filelabel) {
		this.filelabel = filelabel;
	}
	public String getFiletype() {
		return filetype;
	}
	public void setFiletype(String filetype) {
		this.filetype = filetype;
	}
	public String getFiledescribe() {
		return filedescribe;
	}
	public void setFiledescribe(String filedescribe) {
		this.filedescribe = filedescribe;
	}
	public int getDownloadtimes() {
		return downloadtimes;
	}
	public void setDownloadtimes(int downloadtimes) {
		this.downloadtimes = downloadtimes;
	}
	
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFileauthor() {
		return fileauthor;
	}
	public void setFileauthor(String fileauthor) {
		this.fileauthor = fileauthor;
	}
	public Date getSqldate() {
		return sqldate;
	}
	public void setSqldate(Date sqldate) {
		this.sqldate = sqldate;
	}
	public int getDeptid() {
		return deptid;
	}
	public void setDeptid(int deptid) {
		this.deptid = deptid;
	}
	
	
	
}
