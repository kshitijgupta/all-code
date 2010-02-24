package com.abc.scan.vo;

import java.sql.Date;

import com.abc.scan.constants.Constants;

public class ScanVO {
	private Integer fileId;
	private String fileName;
	private String fileLabel;
	private String fileAuthor;
	private Date time;
	private Integer downLoadTimes;
	private String fileType;
	private String fileDescribe;
	private String fileUrl;
	private Integer filePower;
	
	private String kind      = null;
	private String media     = null;
	private String filePic   = null;
	private String classType = null;

	private Integer canOpen  = 0;
	
	public void setAll(){
		if(this.fileUrl == null){
			this.classType = null;
			
			this.media   = null;
			this.kind    = null;
			this.filePic = null;
			
			this.canOpen = 0;
			return;
		}
		if(this.fileType == null){
			this.classType = null;
			
			this.media   = null;
			this.kind    = null;
			this.filePic = null;
			
			this.canOpen = 0;
			
			return;
		}
		
		this.kind = getSubKind(this.fileUrl);
		
		if(this.kind != null){
			this.media   = Constants.getMedia(kind);
		}else{
			this.classType = null;
			
			this.media   = null;
			this.kind    = null;
			this.filePic = Constants.getFilePic("file");
			
			this.canOpen = 0;
			
			return;
		}
		
		if(this.fileType.equals(Constants.PIC)){
			this.media     = Constants.getMedia("pic");
				
			this.canOpen   = 1;
			this.classType = Constants.getClassType(this.fileType);
			this.filePic   = "./"+fileUrl;
		}
		
		if(this.fileType.equals(Constants.MOV)){
			this.canOpen   = 1;
			this.classType = Constants.getClassType(this.fileType);
			this.filePic   = Constants.getFilePic(this.kind);
			
			if(this.media == null){
				this.media = Constants.getMedia("movie");
			}
			
			if(this.filePic == null){
				this.filePic   = Constants.getFilePic("movie");
			}
		}
		
		if(this.fileType.equals(Constants.MUS)){
			if(this.media == null){
				this.media = Constants.getMedia("music");
			}
			
			this.canOpen   = 1;
			this.classType = Constants.getClassType(this.fileType);
			this.filePic   = Constants.getFilePic(this.kind);
			
			if(this.filePic == null){
				this.filePic   = Constants.getFilePic("music");
			}
		}
			
		if(this.fileType.equals(Constants.OTH)){
			if(this.media == null){
				this.canOpen = 0;
			}else{
				this.canOpen = 1;
			}
			
			this.classType = Constants.getClassType(this.fileType);
			this.filePic   = Constants.getFilePic(this.kind);
			
			if(this.filePic == null){
				this.filePic   = Constants.getFilePic("file");
			}
		}
	}	
	
	public String getSubKind(String url){
		String subKind = null;
		
		int lastDot = url.lastIndexOf(".");
		
		if(lastDot != -1){
			subKind = url.substring(lastDot+1);
			if(subKind.equals("")){
				subKind = null;
			}
		}else{
			return null;
		}
		return subKind;
	}
	
	public Integer getFileId() {
		return this.fileId;
	}
	public void setFileId(Integer fileId) {
		this.fileId = fileId;
	}
	public String getFileName() {
		return this.fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getFileAuthor() {
		return this.fileAuthor;
	}
	public void setFileAuthor(String fileAuthor) {
		this.fileAuthor = fileAuthor;
	}
	public String getFileLabel() {
		return this.fileLabel;
	}
	public void setFileLabel(String fileLabel) {
		this.fileName = fileLabel;
	}
	public Date getTime() {
		return this.time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Integer getDownLoadTimes() {
		return downLoadTimes;
	}
	public void setDownLoadTimes(Integer downLoadTimes) {
		this.downLoadTimes = downLoadTimes;
	}
	public String getFileType() {
		return fileType;
	}
	public void setFileType(String fileType) {
		this.fileType = fileType;
	}
	public String getFileDescribe() {
		return fileDescribe;
	}
	public void setFileDescribe(String fileDescribe) {
		this.fileDescribe = fileDescribe;
	}
	public String getFileUrl() {
		return fileUrl;
	}
	public void setFileUrl(String fileUrl) {
		this.fileUrl = fileUrl;
	}
	public Integer getFilePower() {
		return filePower;
	}
	public void setFilePower(Integer filePower) {
		this.filePower = filePower;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public String getMedia() {
		return media;
	}
	public void setMedia(String media) {
		this.media = media;
	}
	public String getFilePic() {
		return filePic;
	}
	public void setFilePic(String filePic) {
		this.filePic = filePic;
	}

	public String getClassType() {
		return classType;
	}

	public void setClassType(String classType) {
		this.classType = classType;
	}

	public Integer getCanOpen() {
		return canOpen;
	}

	public void setCanOpen(Integer canOpen) {
		this.canOpen = canOpen;
	}
}
