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
        // Session属于HTTP范畴，所以ServletRequest对象需要先转换成HttpServletRequest对象
        HttpServletRequest req = (HttpServletRequest)request ;
        HttpSession session = req.getSession() ;
        // 如果session不为空，则可以浏览其他页面
        if(session.getAttribute("UserName")!=null) {
            chain.doFilter(request,response) ;
        } else {
            // 通过requestDispatcher跳转到登陆页
            request.getRequestDispatcher("../bbs_index.html").forward(request,response) ;
        }
    }
}
