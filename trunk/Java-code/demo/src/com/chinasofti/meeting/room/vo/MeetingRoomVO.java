package com.chinasofti.meeting.room.vo;


public class MeetingRoomVO  {
	private Integer mrId;
	private String mrAddress;
	private String mrName;
	private Integer mrCount;
	private String mrDesc = "";

	public Integer getMrId() {
		return mrId;
	}

	public void setMrId(Integer _mrId) {
		mrId = _mrId;
	}

	public String getMrAddress() {
		return mrAddress;
	}

	public void setMrAddress(String _mrAddress) {
		mrAddress = _mrAddress;
	}

	public String getMrName() {
		return mrName;
	}

	public void setMrName(String _mrName) {
		mrName = _mrName;
	}

	public Integer getMrCount() {
		return mrCount;
	}

	public void setMrCount(Integer _mrCount) {
		mrCount = _mrCount;
	}

	public String getMrDesc() {
		return mrDesc;
	}

	public void setMrDesc(String _mrDesc) {
		if(_mrDesc!=null)	mrDesc = _mrDesc;
	}	
}
