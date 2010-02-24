package com.chinasofti.meeting.apply.vo;

import java.sql.Timestamp;

public class MeetingApplyVO {
	private Integer miId;
	private Integer miUserId;
	private Integer miMeetroomId;
	private String miTitle;
	private String miDegree;	
	private String miContent;
	private Timestamp miStartTime;
	private Timestamp miEndTime;
	private String miActor;
	private Integer miCount;
	private String miState;
	private String miIdea;
	public String getMiActor() {
		return miActor;
	}
	public void setMiActor(String miActor) {
		this.miActor = miActor;
	}
	public String getMiContent() {
		return miContent;
	}
	public void setMiContent(String miContent) {
		this.miContent = miContent;
	}
	public Integer getMiCount() {
		return miCount;
	}
	public void setMiCount(Integer miCount) {
		this.miCount = miCount;
	}
	public String getMiDegree() {
		return miDegree;
	}
	public void setMiDegree(String miDegree) {
		this.miDegree = miDegree;
	}
	public Timestamp getMiEndTime() {
		return miEndTime;
	}
	public void setMiEndTime(Timestamp miEndTime) {
		this.miEndTime = miEndTime;
	}
	public Integer getMiId() {
		return miId;
	}
	public void setMiId(Integer miId) {
		this.miId = miId;
	}
	public String getMiIdea() {
		return miIdea;
	}
	public void setMiIdea(String miIdea) {
		this.miIdea = miIdea;
	}
	public Integer getMiMeetroomId() {
		return miMeetroomId;
	}
	public void setMiMeetroomId(Integer miMeetroomId) {
		this.miMeetroomId = miMeetroomId;
	}
	public Timestamp getMiStartTime() {
		return miStartTime;
	}
	public void setMiStartTime(Timestamp miStartTime) {
		this.miStartTime = miStartTime;
	}
	public String getMiState() {
		return miState;
	}
	public void setMiState(String miState) {
		this.miState = miState;
	}
	public String getMiTitle() {
		return miTitle;
	}
	public void setMiTitle(String miTitle) {
		this.miTitle = miTitle;
	}
	public Integer getMiUserId() {
		return miUserId;
	}
	public void setMiUserId(Integer miUserId) {
		this.miUserId = miUserId;
	}

}
