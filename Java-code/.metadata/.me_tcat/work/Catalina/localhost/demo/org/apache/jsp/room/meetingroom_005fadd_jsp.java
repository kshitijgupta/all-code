package org.apache.jsp.room;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class meetingroom_005fadd_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      response.setContentType("text/html;charset=GB2312");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\">\r\n");
      out.write("<title>新增会议室</title>\r\n");
      out.write("<link href=\"../css/table.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("</head>\r\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/include/js/prototype-1.6.0.2.js\"></script>    \r\n");
      out.write("<SCRIPT language=JavaScript>\r\n");
      out.write("\r\n");
      out.write("function _CheckForm(){\r\n");
      out.write("\tvar frm = document.RoomForm;\r\n");
      out.write("\tif(frm.mrName.value == \"\"){\r\n");
      out.write("\t\talert(\"请填写会议室名称！\");\r\n");
      out.write("\t\tfrm.mrName.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(frm.mrAddress.value == \"\"){\r\n");
      out.write("\t\talert(\"请填写会议室地址！\");\r\n");
      out.write("\t\tfrm.mrAddress.focus();\r\n");
      out.write("\t\treturn false;\r\n");
      out.write("\t}   \r\n");
      out.write("\tif(frm.mrCount.value == \"\"){\r\n");
      out.write("\t   alert(\"请填写容纳人数！\");\r\n");
      out.write("\t   frm.mrCount.focus();\r\n");
      out.write("\t   return false;\r\n");
      out.write("\t}\r\n");
      out.write("\tif(!is_numeric(frm.mrCount)){\r\n");
      out.write("\t   alert(\"容纳人数是数字！\");\r\n");
      out.write("\t   frm.mrCount.focus();\r\n");
      out.write("\t   return false;\r\n");
      out.write("\t}\r\n");
      out.write("\treturn true;\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function _ok(){\r\n");
      out.write("\tif(_CheckForm()){\r\n");
      out.write("\t\tdocument.RoomForm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function _reset(){\r\n");
      out.write("\tdocument.RoomForm.reset();\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function is_numeric(field)\r\n");
      out.write("{\r\n");
      out.write("\tvar Ret = true;\r\n");
      out.write("\tvar NumStr=\"0123456789\";\r\n");
      out.write("\tvar decUsed=false;\r\n");
      out.write("\tvar chr;\r\n");
      out.write("\tfor (i=0;i<field.value.length;++i)\r\n");
      out.write("\t{\r\n");
      out.write("\t\tchr=field.value.charAt(i);\r\n");
      out.write("\t\tif (NumStr.indexOf(chr,0)==-1)\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tif ( (!decUsed) && chr==\".\")\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tdecUsed=true;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t\telse\r\n");
      out.write("\t\t\t{\r\n");
      out.write("\t\t\t\tRet=false;\r\n");
      out.write("\t\t\t}\r\n");
      out.write("\t\t}\r\n");
      out.write("\t}\r\n");
      out.write("\treturn(Ret);\r\n");
      out.write("} \r\n");
      out.write("\r\n");
      out.write("function checkName(){\r\n");
      out.write("\tvar url = '");
      out.print(request.getContextPath());
      out.write("/servlet/MeetingRoomServlet';\r\n");
      out.write("\tvar param=\"way=check&mrName=\" + document.RoomForm.mrName.value;\r\n");
      out.write("\tvar myAjax = new Ajax.Request(url,{method: 'post',parameters: param ,onSuccess: getcheckstr});\r\n");
      out.write("}\r\n");
      out.write("\r\n");
      out.write("function getcheckstr(request)\r\n");
      out.write("{ \r\n");
      out.write("\tvar returnstr= request.responseText;\r\n");
      out.write("\tvar chk_name = $('chk_name');\r\n");
      out.write("\r\n");
      out.write("\tif(returnstr.match(\"true\")){\r\n");
      out.write("\t\tchk_name.update('名称重名，请修改').setStyle({ background: '#dfd' });\r\n");
      out.write("\t}else{\r\n");
      out.write("\t\tchk_name.update('可以使用，请继续').setStyle({ background: '#dfd' });\r\n");
      out.write("\t}\r\n");
      out.write("}\r\n");
      out.write("</SCRIPT>\r\n");
      out.write("<body leftmargin=\"0\" topmargin=\"15\">\r\n");
      out.write("<form name=RoomForm action=\"");
      out.print(request.getContextPath() );
      out.write("/servlet/MeetingRoomServlet\" method=\"post\">\r\n");
      out.write("    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("      <tr> <th>新增会议室</th>\r\n");
      out.write("      </tr>\r\n");
      out.write("\t <tr>\r\n");
      out.write("\t <td><div align=\"left\">\r\n");
      out.write("          新增会议室:</div></td>\r\n");
      out.write("\t  </tr>\r\n");
      out.write("    </table>\r\n");
      out.write("    <table width=\"100%\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">\r\n");
      out.write("      <tr> \r\n");
      out.write("        <td>\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t<table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"B1BCEC\">\r\n");
      out.write("            <tr> \r\n");
      out.write("              <td bgcolor=\"#000000\"><table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#000000\">\r\n");
      out.write("                  <tr> \r\n");
      out.write("                    <td height=\"2\" bgcolor=\"#993300\"></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                </table>\r\n");
      out.write("                <table width=\"100%\" border=\"0\" cellpadding=\"0\" cellspacing=\"1\" bgcolor=\"#993300\">\r\n");
      out.write("                  <tr bgcolor=\"#FFFFFF\"> \r\n");
      out.write("\t\t\t\t    <td width=\"14%\" height=\"25\">会议室名称</td>\r\n");
      out.write("                    <td width=\"16%\"><input name=\"mrName\" type=\"text\" size=\"15\">\r\n");
      out.write("                    <input type=\"button\" name=\"check\" value=\"检查重名\" onClick=\"checkName();\">\r\n");
      out.write("      \t\t\t\t<label id=chk_name></label><font color=\"#ff0000\">*</font></td>\r\n");
      out.write("\t\t          </tr>\r\n");
      out.write("\t          <tr bgcolor=\"#FFFFFF\"> \r\n");
      out.write("                    <td width=\"14%\" height=\"25\">会议室地址</td>\r\n");
      out.write("                    <td width=\"16%\"><input name=\"mrAddress\" type=\"text\" size=\"15\"><font color=\"#ff0000\">*</font></td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t   <tr bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t\t\t     <td height=\"25\">容纳人数</td>\r\n");
      out.write("\t\t\t\t     <td><input name=\"mrCount\" type=\"text\" size=\"15\"><font color=\"#ff0000\">*</font></td>\r\n");
      out.write("\t\t\t      </tr>\r\n");
      out.write("\t\t\t\t   <tr bgcolor=\"#FFFFFF\">\r\n");
      out.write("\t\t\t\t     <td height=\"25\">会议室描述</td>\r\n");
      out.write("\t\t\t\t     <td><textarea name=\"mrDesc\" rows=\"10\" cols=\"60\"></textarea></td>\r\n");
      out.write("\t\t\t      </tr>\r\n");
      out.write("\t\t\t      \r\n");
      out.write("\t\t\t\t   <tr bgcolor=\"#FFFFFF\"> \r\n");
      out.write("\t\t\t\t    \r\n");
      out.write("                    <td  colspan=2 align=\"center\"><img src=\"../images/tj.jpg\" width=\"53\" height=\"20\"   border=\"0\" onClick=\"javascript:_ok();\" style=\"cursor:hand\">&nbsp;&nbsp;\r\n");
      out.write("                    <img width=\"53\" height=\"20\" border=\"0\" src=\"../images/cz.jpg\" onclick=\"javascript:_reset();\" style=\"\">&nbsp;\r\n");
      out.write("                      </td>\r\n");
      out.write("                  </tr>\r\n");
      out.write("                </table> </td>\r\n");
      out.write("            </tr>\r\n");
      out.write("          </table>\t\t</td>\r\n");
      out.write("      </tr> \r\n");
      out.write("    </table>\r\n");
      out.write("    <input type=hidden name=\"way\" value=\"add\">\r\n");
      out.write("    </form>\r\n");
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
