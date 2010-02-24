package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.*;
import developerworks.ajax.store.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("<?xml version=\"1.0\" encoding=\"utf-8\"?>\r\n");
      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Strict//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\r\n");
      out.write("<script type=\"text/javascript\" language=\"javascript\" src=\"ajax1.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\" language=\"javascript\" src=\"cart.js\"></script>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("<div style=\"float: left; width: 500px\">\r\n");
      out.write("<h2>Catalog</h2>\r\n");
      out.write("<table border=\"1\">\r\n");
      out.write("  <thead><th>Name</th><th>Description</th><th>Price</th><th></th><th></th></thead>\r\n");
      out.write("  <tbody>\r\n");
      out.write("  ");

    for (Iterator<Item> I = new Catalog().getAllItems().iterator() ; I.hasNext() ; ) {
      Item item = I.next();
  
      out.write("\r\n");
      out.write("    <tr><td>");
      out.print( item.getName() );
      out.write("</td><td>");
      out.print( item.getDescription() );
      out.write("</td><td>");
      out.print( item.getFormattedPrice() );
      out.write("</td><td><button onclick=\"addToCart('");
      out.print( item.getCode() );
      out.write("')\">Add To Cart</button><td><button onclick=\"removeFromCart('");
      out.print( item.getCode() );
      out.write("')\">Remove From Cart</button></td></tr>\r\n");
      out.write("    ");
 } 
      out.write("\r\n");
      out.write("  </tbody>\r\n");
      out.write("</table>\r\n");
      out.write("<div style=\"position: absolute; top: 0px; right: 0px; width: 250px\">\r\n");
      out.write("<h2>Cart Contents</h2>\r\n");
      out.write("<ul id=\"contents\">\r\n");
      out.write("</ul>\r\n");
      out.write("Total cost: <span id=\"total\">$0.00</span>\r\n");
      out.write("</div>\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
