package com.chinasofti.base.ctrl;

import java.io.*;

import javax.servlet.*;
import javax.servlet.http.*;

import org.apache.log4j.*;
/**
 * <p>Title: </p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright:  Copyright (c) 2008</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 */

public abstract class ServletBase extends HttpServlet implements Serializable

{
	/**
	 * 
	 */
	private static final long serialVersionUID = -950824516449626887L;
	protected final static Logger logger =  Logger.getLogger(ServletBase.class); 
 
  public void checkToken(HttpServletRequest request) throws ServletException, IOException {

//		TODO 产生TOKEN	
  }
  public void doGet(HttpServletRequest request, HttpServletResponse response) 
         throws ServletException, IOException 
  {
	performTask(request, response);
  }
  
  public void doPost(HttpServletRequest request, HttpServletResponse response)
         throws ServletException, IOException 
  {  
    performTask(request, response);
  }
  
  public void forward( HttpServletRequest request, HttpServletResponse response,String redirect)
         throws ServletException, IOException 
  {
	  	  request.getRequestDispatcher(redirect).forward(request,response);
  }
   	
  public void handleError(HttpServletRequest request, HttpServletResponse response, Throwable theException)
  {
      try
      {	
        PrintWriter out = response.getWriter();
        
        out.println("系统出错，请联系系统管理员，");
        out.println("错误信息:"+theException.toString());
      }
      catch(Exception e)
      {
      	 logger.info(e.toString());
      }	 
  }	

  public void handleError(HttpServletRequest request, HttpServletResponse response, Exception theException)
  {
      try
      {	
        PrintWriter out = response.getWriter();
        
        out.println("系统出错，请联系系统管理员，");
        out.println("错误信息:"+theException.toString());
      }
      catch(Exception e)
      {
      	 logger.error(e.toString());
      }	 
  }	

  public void handleError( Exception theException)
  {

      	 logger.error(theException.toString());
  }	

  public void init(ServletConfig config) throws ServletException {
	  super.init(config);
  }
  
  //继承类需要继承此方法
  protected abstract void performTask(HttpServletRequest request, HttpServletResponse response) throws javax.servlet.ServletException,ServletException, IOException;
  protected abstract boolean add(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException, IOException;
  protected abstract boolean delete(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException, IOException;
  protected abstract boolean batchDel(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException, IOException;
  protected abstract boolean modify(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException, IOException;
  protected abstract boolean update(HttpServletRequest request, HttpServletResponse response) throws Exception,ServletException, IOException;
  protected abstract boolean list(HttpServletRequest request, HttpServletResponse response,String way) throws Exception,ServletException, IOException;
}