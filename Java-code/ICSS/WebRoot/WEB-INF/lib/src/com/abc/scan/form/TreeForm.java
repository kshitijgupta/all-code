package com.abc.scan.form;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import org.apache.struts.action.ActionErrors;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.vo.TreeVO;

public class TreeForm extends ActionForm {
	private static final long serialVersionUID = 200847218983568261L;
	private ArrayList<TreeVO> treeList = null;

	public ArrayList<TreeVO> getTreeList() {
		return treeList;
	}

	public void setTreeList(ArrayList<TreeVO> treeList) {
		this.treeList = treeList;
	}
	
	public ActionErrors validate(ActionMapping mapping,
			HttpServletRequest request) {
		return null;
	}

	public void reset(ActionMapping mapping, HttpServletRequest request) {
		
	}
}