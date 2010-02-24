package com.abc.scan.form;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.vo.ScanVO;

public class FileForm extends ActionForm {
	private static final long serialVersionUID = -6454894975136566574L;
	
	private int fileId;
	private ScanVO fileVO = null;
	
	public int getFileId() {
		return fileId;
	}
	public void setFileId(int fileId) {
		this.fileId = fileId;
	}
	public ScanVO getFileVO() {
		return fileVO;
	}
	public void setFileVO(ScanVO fileVO) {
		this.fileVO = fileVO;
	}
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		return null;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		
	}
}