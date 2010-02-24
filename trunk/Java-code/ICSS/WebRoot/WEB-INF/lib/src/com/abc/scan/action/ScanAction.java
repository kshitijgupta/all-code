package com.abc.scan.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.Action;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

import com.abc.scan.constants.Constants;
import com.abc.scan.dao.ScanDAO;
import com.abc.scan.dao.ScanDAOImpl;
import com.abc.scan.form.ScanForm;

public class ScanAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ScanForm scan = (ScanForm) form;
		int num  = scan.getNum();
		int mode = scan.getMode();
		int out  = scan.getOut();
		
		HttpSession session = request.getSession();
		
		int the_out;
		
		if(session.getAttribute("the_out") == null){
			the_out = 0;
		}else{
			the_out = (Integer)session.getAttribute("the_out");
		}
		
		if(out != -1){
			the_out = out;
		}
		
		scan.setOut(the_out);
		session.setAttribute("the_out", the_out);
		
        if(session.getAttribute(Constants.USER_KEY) != null){
        	ScanDAO dao = new ScanDAOImpl();
        	
        	int userKey = (Integer)session.getAttribute(Constants.USER_KEY);
        	int userDepartment = dao.getDepartmentById(userKey);
        	int userPower      = dao.getPowerById(userKey);
        	
        	scan.setUserDepartment(userDepartment);
        	scan.setUserPower(userPower);
        	
			if(mode==0){
				String page = scan.getPage();
				
				String type = getTypeByName(page);
				
				if(type != null){
					scan.setOutPage(getNameByType(type));
					scan.setListByType(getLengthByOut(the_out), num, type, userPower);
					return (mapping.findForward("main"));
				}else{
					return (mapping.findForward(Constants.ERROR));
				}
			}else
			    if(mode==1){
					int folderId = scan.getFolderId();
					scan.setListById(getLengthByOut(the_out), num, folderId, userPower, userDepartment);
					scan.setEmpty(scan.isEmpty(folderId));
					scan.setOutPage("资源");
					
					return (mapping.findForward("main"));
			}
        }else{
        	return (mapping.findForward(Constants.UNLOAD));
        }
		
		return (mapping.findForward(Constants.ERROR));
	}
	
	public String getTypeByName(String name){
		if(name.equals("mov"))		return Constants.MOV;
		else if(name.equals("mus")) return Constants.MUS;
		else if(name.equals("pic")) return Constants.PIC;
		else if(name.equals("oth")) return Constants.OTH;
		else return null;
	}
	
	public String getNameByType(String type){
		if(type.equals(Constants.MOV))	    return "视频";
		else if(type.equals(Constants.MUS)) return "音频";
		else if(type.equals(Constants.PIC)) return "图片";
		else if(type.equals(Constants.OTH)) return "其他";
		else return null;
	}
	
	public int getLengthByOut(int out){
		if(out==0) return Constants.BIGLIST;
		if(out==1) return Constants.SMALLLIST;
		
		return Constants.BIGLIST;
	}
}