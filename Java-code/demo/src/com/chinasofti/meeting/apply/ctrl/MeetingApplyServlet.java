package com.chinasofti.meeting.apply.ctrl;

import java.io.File;
import java.io.IOException;
import java.util.Enumeration;


import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;

import com.chinasofti.base.ctrl.ServletBase;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class MeetingApplyServlet extends ServletBase{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8550895283804723282L;
	protected static Logger  logger = Logger.getLogger(MeetingApplyServlet.class);
	@Override
	protected void performTask(HttpServletRequest request, HttpServletResponse response) throws ServletException, ServletException, IOException {	
		String redirect	= "/apply/success.jsp";
		String errurl	= "/error/error.jsp";
		//String way 		= request.getParameter("way");
		boolean result 	= true;
	
		try {
			result = add(request,response);
//			if(way.equals("list")){
//				result = list(request,response,true); 
//			}else{
//			  if(way.equals("add")){
//				  result = add(request,response);
//			  }else if(way.equals("delete")){
//				  result = delete(request,response);
//			  }else if(way.equals("batchdel")){
//				  result = batchDel(request,response);
//			  }else if(way.equals("modify")){
//				  result = modify(request,response);
//			  }
//			  
//			  if(result)  list(request,response,false);  
//			  else		  redirect = errurl;
	
		  forward(request, response, redirect);	  
		} catch (Exception e) {
			// TODO Auto-generated catch block
			logger.error(e.toString());
			e.printStackTrace();
		}	
	}

	@Override
	protected boolean add(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		String realPath  = this.getServletContext().getRealPath("") ;
		String tmpPath   = realPath + File.separator + "logs" ;
		String docPath   = realPath + File.separator + "document" ; 
		MultipartRequest multi = new MultipartRequest(request, tmpPath, 10*1024*1024,"GB2312", new DefaultFileRenamePolicy());
		
		Integer miUserId 		= new Integer(1);
		Integer miMeetroomId 	= new Integer(1);
		String miTitle 			= multi.getParameter("miTitle");
		String miDegree 		= multi.getParameter("miDegree");
		String miContent		= multi.getParameter("miContent");
		String miStartTime		= multi.getParameter("miStartTime");
		String miEndTime		= multi.getParameter("miEndTime");
		String miActor			= multi.getParameter("miActor");
		//Integer miCount			= Integer.parseInt(multi.getParameter("miCount"));

		logger.debug("miTitle:"+ miTitle);
		
		Enumeration docList = multi.getFileNames();
		while(docList.hasMoreElements()){
			String param = (String)docList.nextElement();
			logger.debug("param:" + param);
			String apDoc = multi.getFilesystemName(param);
			logger.debug("apDoc:" + apDoc);
			//this.moveUploadFile(tmpPath+ File.separator + apDoc, docPath +  File.separator + apDoc);				
		}


		return true;
	}


	@Override
	protected boolean delete(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected boolean modify(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected boolean batchDel(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected boolean list(HttpServletRequest request, HttpServletResponse response, String way) throws Exception, ServletException, IOException {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	protected boolean update(HttpServletRequest request, HttpServletResponse response) throws Exception, ServletException, IOException {
		// TODO Auto-generated method stub
		return false;
	}
}
