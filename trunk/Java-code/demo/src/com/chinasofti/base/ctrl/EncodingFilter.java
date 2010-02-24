package com.chinasofti.base.ctrl;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletResponse;

/**
 * <p>Title: </p>
 * <p>Description: Meeting  Management Project</p>
 * <p>Created on 2008-7-28</p>
 * <p>Copyright:  Copyright (c) 2008</p>
 * <p>Company: ChinaSoft International Corp.</p>
 * @author
 * @version 1.0
 * ƒøµƒ£∫…Ë÷√Õ≥“ª±‡¬Î£¨Ω˚÷πª∫¥Ê£®∑¿÷π÷ÿ∏¥Ã·Ωª£©
 */

public class EncodingFilter implements Filter {

	protected FilterConfig 	filterConfig; 
    protected String 		encoding;
    
	public void init(FilterConfig arg0) throws ServletException {
		filterConfig = arg0;
        encoding     = arg0.getInitParameter("encoding");
      
        if(encoding == null)  encoding = "GBK";
	}

	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain filterChain) throws IOException, ServletException {

		request.setCharacterEncoding(encoding);//…Ë÷√±‡¬Î 
		HttpServletResponse hres = (HttpServletResponse) response;
		hres.setHeader("Pragma","No-cache"); 
		hres.setHeader("Cache-Control","no-cache"); 
		hres.setHeader("Expires","0");//Ω˚÷πª∫¥Ê 

		filterChain.doFilter(request, response); 
	}


	
	public void destroy() {
    }
}
