package com.abc.scan.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.constants.Constants;
import com.abc.scan.dao.ScanDAO;
import com.abc.scan.dao.ScanDAOImpl;
import com.abc.scan.form.TreeForm;
import com.abc.scan.vo.TreeVO;

public class TreeAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		TreeForm tree = (TreeForm) form;

		ScanDAO dao = new ScanDAOImpl();
		
		ArrayList<TreeVO> list = dao.getTree();
		
		if(list != null){
			tree.setTreeList(list);
			return (mapping.findForward("tree"));
		}

		return (mapping.findForward(Constants.ERROR));
	}	
}