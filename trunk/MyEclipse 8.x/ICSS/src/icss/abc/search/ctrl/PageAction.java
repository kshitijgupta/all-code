package icss.abc.search.ctrl;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import icss.abc.search.MyMap;

public class PageAction {
	
	private MyMap[] mms;
	private long usetime;
	public String execute(){
		
		HttpServletRequest req = ServletActionContext.getRequest();
		HttpSession session = req.getSession();
		
		usetime = Long.parseLong(req.getParameter("usetime"));
			
		mms = (MyMap[]) session.getAttribute("hiddenmms");
		
		req.setAttribute("mms", mms);
		req.setAttribute("usetime",usetime);
		return "success";
	}
}
