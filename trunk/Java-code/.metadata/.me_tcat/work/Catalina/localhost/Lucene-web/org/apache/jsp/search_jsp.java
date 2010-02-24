package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.List;
import sample.dw.paper.lucene.search.*;

public final class search_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.AnnotationProcessor _jsp_annotationprocessor;

  public Object getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_annotationprocessor = (org.apache.AnnotationProcessor) getServletConfig().getServletContext().getAttribute(org.apache.AnnotationProcessor.class.getName());
  }

  public void _jspDestroy() {
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=utf-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\t\r\n");
      out.write("\t<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<HTML><HEAD><TITLE>Lucene Search Engine Demo Client</TITLE>\r\n");
      out.write("\t<META http-equiv=Content-Type content=\"text/html; charset=utf-8\">\r\n");
      out.write("\t<META content=\"MSHTML 6.00.2800.1543\" name=GENERATOR>\r\n");
      out.write("\t<style type=\"text/css\">\r\n");
      out.write("\t<!--\r\n");
      out.write("\tbody{margin:0;\r\n");
      out.write("\tfont-family: Arial, Helvetica, sans-serif;\r\n");
      out.write("\t\tfont-size: 0.8em;\r\n");
      out.write("\t}\r\n");
      out.write("\ttd,th,div{\r\n");
      out.write("\t\t\tfont-size: 0.8em;\r\n");
      out.write("\t}\r\n");
      out.write("\ta{\r\n");
      out.write("\t\tcolor: #0066FF;\r\n");
      out.write("\t}\r\n");
      out.write("\ta:hover{\r\n");
      out.write("\t\tcolor: #666;\r\n");
      out.write("\t\ttext-decoration: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\th1{\r\n");
      out.write("\tmargin:0px;\r\n");
      out.write("\theight:70px;\r\n");
      out.write("\tline-height:70px;\r\n");
      out.write("\tbackground: #6699CC;\r\n");
      out.write("\tcolor: #fff;\r\n");
      out.write("\tborder-bottom:solid 1px #006699;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.search{\r\n");
      out.write("\tbackground:#ddeeff;\r\n");
      out.write("\tpadding-top:5px;\r\n");
      out.write("\tpadding-bottom:5px;\r\n");
      out.write("\tborder-bottom:solid 1px #9ABBCB;\r\n");
      out.write("\t}\r\n");
      out.write("\tform{margin:0;\r\n");
      out.write("\t}\r\n");
      out.write("\t.result{\r\n");
      out.write("\twidth:70%;\r\n");
      out.write("\t\tclear:both;\r\n");
      out.write("\tmargin-bottom:20px;\r\n");
      out.write("\tmargin-top:20px;}\r\n");
      out.write("\t.result h3{\r\n");
      out.write("\t\t\tmargin:0px;\r\n");
      out.write("\t\t\tline-height: 25px;\r\n");
      out.write("\t\t\tfont-size: 1.3em;\r\n");
      out.write("\t}\r\n");
      out.write("\t.linked {\r\n");
      out.write("\t\tpadding-top: 5px;\r\n");
      out.write("\t\tpadding-bottom: 5px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.linked a{\r\n");
      out.write("\t\r\n");
      out.write("\tmargin-right: 10px;\r\n");
      out.write("\tborder:solid 1px #CCCCCC;\r\n");
      out.write("\tpadding:3px 10px 3px 10px;\r\n");
      out.write("\ttext-decoration: none;\r\n");
      out.write("\t}\r\n");
      out.write("\t.linked a:hover{\r\n");
      out.write("\t\r\n");
      out.write("\tmargin-right: 10px;\r\n");
      out.write("\tborder:solid 1px #0066FF;\r\n");
      out.write("\t\tbackground: #0066FF;\r\n");
      out.write("\t\tcolor: #fff;\r\n");
      out.write("\t\r\n");
      out.write("\t}\r\n");
      out.write("\thr{\r\n");
      out.write("\t\r\n");
      out.write("\t\tborder: dashed 1px #ddd;\r\n");
      out.write("\t\t\tdisplay: block;\r\n");
      out.write("\t\t\tbackground:#fff;\r\n");
      out.write("\t\t\theight: 1px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.footer{\r\n");
      out.write("\t\tfont-size:0.8em;\r\n");
      out.write("\t\tborder-top:solid 1px #ddd;\r\n");
      out.write("\t\tpadding-top:10px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.footer a{color:#666;\r\n");
      out.write("\ttext-decoration: none;}\r\n");
      out.write("\t.footer a:hover{\r\n");
      out.write("\t\ttext-decoration: underline;\r\n");
      out.write("\t}\r\n");
      out.write("\t-->\r\n");
      out.write("\t</style>\r\n");
      out.write("\t</HEAD>\r\n");
      out.write("\t<BODY>\r\n");
      out.write("\t\r\n");
      out.write("\t<CENTER><h1>Lucene Search Engine Demo Client</h1>\r\n");
      out.write("\t<div class=\"search\">\r\n");
      out.write("\t  <FORM id=searchForm action=SearchController>\r\n");
      out.write("\t  <TABLE>\r\n");
      out.write("\t    <TBODY>\r\n");
      out.write("\t      <TR>\r\n");
      out.write("\t        <TD colspan=\"3\">\r\n");
      out.write("\t          <INPUT name=searchWord id=searchWord type=text size=\"40\"> \r\n");
      out.write("\t          <INPUT id=doSearch type=submit value=search> \r\n");
      out.write("\t        </TD>\r\n");
      out.write("\t      </TR>\r\n");
      out.write("\t    </TBODY>\r\n");
      out.write("\t  </TABLE>\r\n");
      out.write("\t  </FORM>\r\n");
      out.write("\t</div>\r\n");
      out.write(" <TABLE class=\"result\">\r\n");
      out.write("\t  <TBODY>\r\n");
      out.write("\t  ");

	    List searchResult = (List)request.getAttribute("searchResult");
	    int resultCount = 0;
	    if(null != searchResult){
	    	resultCount = searchResult.size();
	    }
	    for(int i = 0; i < resultCount; i++){
	    	SearchResultBean resultBean = (SearchResultBean)searchResult.get(i);
	    	String title = resultBean.getHtmlTitle();
	    	String path  = resultBean.getHtmlPath();
	  
      out.write("\r\n");
      out.write("\t  <TR>\r\n");
      out.write("\t    <TD class=\"title\"><h3><A href=\"");
      out.print(path );
      out.write('"');
      out.write('>');
      out.print(title );
      out.write("</A></h3></TD>\r\n");
      out.write("\t  </TR>\r\n");
      out.write("\t  <tr><td><hr /></td></tr>\r\n");
      out.write("\t  ");

	    }
	  
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t</TBODY>\r\n");
      out.write(" </TABLE>\r\n");
      out.write("\t\r\n");
      out.write("\t</CENTER>\r\n");
      out.write("\t</BODY></HTML>");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try { out.clearBuffer(); } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
