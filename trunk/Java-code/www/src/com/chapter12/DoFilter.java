package com.chapter12;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;


public class DoFilter implements Filter{
    private FilterConfig config;
    
    public void init(FilterConfig config){
        this.config = config;
    }
    public void destroy(){
        this.config = null;
    }
    public void doFilter(ServletRequest request,ServletResponse response,FilterChain chain)throws IOException,ServletException
    {
        // Session����HTTP���룬����ServletRequest������Ҫ��ת����HttpServletRequest����
        HttpServletRequest req = (HttpServletRequest)request ;
        HttpSession session = req.getSession() ;
        // ���session��Ϊ�գ�������������ҳ��
        if(session.getAttribute("UserName")!=null) {
            chain.doFilter(request,response) ;
        } else {
            // ͨ��requestDispatcher��ת����½ҳ
            request.getRequestDispatcher("../bbs_index.html").forward(request,response) ;
        }
    }
}
