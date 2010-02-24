package com.abc.scan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.constants.Constants;
import com.abc.scan.dao.ScanDAO;
import com.abc.scan.dao.ScanDAOImpl;
import com.abc.scan.form.FileForm;
import com.abc.scan.vo.ScanVO;

public class FileAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		FileForm file = (FileForm) form;

		ScanDAO dao = new ScanDAOImpl();
		
		int id = file.getFileId();
		
		ScanVO vo = dao.getFileById(id);

		if(vo != null){
			file.setFileVO(vo);
			
			String media = file.getFileVO().getMedia();
			
			if(media != null){
				return (mapping.findForward(media));
			}else{
				return (mapping.findForward(Constants.ERROR));
			}	
		}

		return (mapping.findForward(Constants.ERROR));
	}	
}