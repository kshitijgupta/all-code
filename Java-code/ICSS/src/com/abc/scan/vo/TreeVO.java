 package com.abc.scan.vo;

public class TreeVO {
	/**FOLDERID FOLDNAME FATHERFOLDER FOLDERLAYER ISEND**/ 
	private Integer folderId;
	private String foldName;
	private Integer fatherFolder;
	private Integer folderLayer;
	private boolean isEnd;
	
	
	public Integer getFolderId() {
		return folderId;
	}
	public void setFolderId(Integer folderId) {
		this.folderId = folderId;
	}
	public String getFoldName() {
		return foldName;
	}
	public void setFoldName(String foldName) {
		this.foldName = foldName;
	}
	public Integer getFatherFolder() {
		return fatherFolder;
	}
	public void setFatherFolder(Integer fatherFolder) {
		this.fatherFolder = fatherFolder;
	}
	public Integer getFolderLayer() {
		return folderLayer;
	}
	public void setFolderLayer(Integer folderLayer) {
		this.folderLayer = folderLayer;
	}
	public boolean isEnd() {
		return isEnd;
	}
	public void setEnd(boolean isEnd) {
		this.isEnd = isEnd;
	}
}
