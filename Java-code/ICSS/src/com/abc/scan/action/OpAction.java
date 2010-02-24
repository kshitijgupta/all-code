package com.abc.scan.action;

import java.io.File;
import java.io.PrintWriter;

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
import com.abc.scan.form.OpForm;

public class OpAction extends Action {
	public ActionForward execute(ActionMapping mapping, ActionForm form,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		OpForm op = (OpForm) form;
		
		String doOp = op.getOp();
		
		String str  = op.getStr();
		 
		String newname = op.getNewname();
		 
		int count   = op.getCount();
		int folderId= op.getFolderId();
		
		HttpSession session = request.getSession();

		ScanDAO dao = new ScanDAOImpl();
		
        if(session.getAttribute(Constants.USER_KEY) != null){
        	int userKey = (Integer)session.getAttribute(Constants.USER_KEY);
        	int userPower      = dao.getPowerById(userKey);

        	if(doOp.equals(Constants.MOVE) && userPower < Constants.UPDATE
        			&& folderId != -1
        	        && str  != null
        	        && count>= 1){
        		PrintWriter out = response.getWriter();
        		
        		boolean ok = dao.move(folderId, str, count);
        		
        		if(ok == true){
        			out.print("ok");
        			out.close();
        			return null;
        		}else{
        			out.print("no");
        			out.close();
        			return null; 
        		}
        	}
        	
        	if(doOp.equals("updatename") && userPower < Constants.UPDATE
        			&& folderId != -1
        			&& newname  != null){
        		PrintWriter out = response.getWriter();
        		
        		boolean ok = dao.updateName(folderId, newname);
        		
        		if(ok == true){
        			out.print("ok");
        			out.close();
        			return null;
        		}else{
        			out.print("no");
        			return null; 
        		}
        	}
        	
        	if(doOp.equals("deletefolder") && userPower < Constants.UPDATE
        			&& folderId != -1){
        		PrintWriter out = response.getWriter();
        		
        		boolean ok = dao.deleteFolder(folderId); 
        		
        		if(ok == true){
        			out.print("ok");
        			out.close();
        			return null;
        		}else{
        			out.print("no");
        			out.close();
        			return null; 
        		}
        	}
        	
        	if(doOp.equals("addname") && userPower < Constants.UPDATE
        			&& folderId != -1
        			&& newname  != null){
        		PrintWriter out = response.getWriter();
        		
        		boolean ok = dao.addName(folderId, newname);
        		
        		if(ok == true){
        			out.print("ok");
        			out.close();
        			return null;
        		}else{
        			out.print("no");
        			out.close();
        			return null; 
        		}
        	}
        	
        	if(doOp.equals("filedelete") && userPower < Constants.UPDATE
        	        && str  != null
        	        && count>= 1){
        		PrintWriter out = response.getWriter();
        		
        		String realPath = this.getServlet().getServletContext().getRealPath("");
        		boolean ok = dao.fileDelete(str, count, realPath);
        		
        		
        		if(ok == true){
        			out.print("ok");
        			out.close();
        			return null;
        		}else{
        			out.print("no");
        			out.close();
        			return null; 
        		}
        	}
        	
        	if(doOp.equals("filedown") && userPower < Constants.UPDATE
        	        && str  != null
        	        && count>= 1){
        		
        		
        		String realPath = this.getServlet().getServletContext().getRealPath("");
        		String path = dao.fileDown(str, count, realPath, userKey);
        		
        		if(path != null){
        			op.setRealPath(path);
        			
        			response.reset();
        			response.setContentType("application/x-msdownload");
        			response.setHeader("Content-disposition","filename="+path);
        			
        			java.io.BufferedInputStream bis=null;
        			java.io.BufferedOutputStream  bos=null;
        			
        			
        			path = this.getServlet().getServletContext().getRealPath("")
        					+File.separator + "to_down"+ File.separator+ path ;
        			
        			File f = new File(path);
        			
        			try{
	        			bis =new java.io.BufferedInputStream(new java.io.FileInputStream(f));
	        			bos=new java.io.BufferedOutputStream(response.getOutputStream()); 
	        			byte[] buff = new byte[2048];
	        			int bytesRead;
	        			while(-1 != (bytesRead = bis.read(buff, 0, buff.length))) {
	        				bos.write(buff,0,bytesRead);
	        			}
	        		}
	        		catch(Exception e){
	        			
	        		}
	        		finally {
	        		 if (bis != null)bis.close();
	        		 if (bos != null)bos.close();
	        		}
        			return null;
        		}else{
        			return null; 
        		}
        	}
        }
        PrintWriter out = response.getWriter();
        
        out.print("no");
		return null;
	}
}