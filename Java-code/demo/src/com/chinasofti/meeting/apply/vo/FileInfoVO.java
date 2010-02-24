package com.chinasofti.meeting.apply.vo;

import java.sql.Timestamp;

public class FileInfoVO {
	private Integer fileId;
	private Integer fileMeetid;
	private String fileName;
	private String fileSize;
	private String fileFormat;
	private String filePath;
	private Timestamp fileUploadtime;
	
	public String getFileFormat() {
		return fileFormat;
	}
	public void setFileFormat(String fileFormat) {
		this.fileFormat = fileFormat;
	}
	public Integer getFileId() {
		return fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public Integer getFileMeetid() {
		return fileMeetid;
	}
	public void setFileMeetid(Integer fileMeetid) {
		this.fileMeetid = fileMeetid;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getFileSize() {
		return fileSize;
	}
	public void setFileSize(String fileSize) {
		this.fileSize = fileSize;
	}
	public Timestamp getFileUploadtime() {
		return fileUploadtime;
	}
	public void setFileUploadtime(Timestamp fileUploadtime) {
		this.fileUploadtime = fileUploadtime;
	}

}
