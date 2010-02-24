<%@ page contentType="text/html;charset=GBK"%> 
<!-- Header begin -->

<!-- Header end -->



  <form name="frmSub" method="post">
	  <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#ffffff">
	
        <tr height="450">
          <!-- Content List Start-->
		   <td align="center" valign="top" background="<%= request.getContextPath() %>/images/right-bj.gif">
		    <table width="95%" border="0" cellpadding="3" cellspacing="1">
              <tr> 
                <td align = "center">
		     

<%
    String msg = (String) request.getAttribute("CustomErr");
    if(msg == null)
    {
        msg = request.getParameter("CustomErr");
    }
    
    if(msg == null)
    {
        msg = "未知错误！";
    }
%>
发现错误： <%=msg%>
                </td>
              </tr>
           </table>
		   	<table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr height="20">
					  <td align="center" > </td>
					</tr>
		    </table>
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                    <tr height="7">
					  <td align="center" ><INPUT type=button name="button1" value="返 回" class="inputbutton" onclick="javascript:history.back();" ></td>
					</tr>
		    </table>
          </td>
          <!-- Content List End-->
                 </tr>
 
      </table>
  </form>     
<!-- 内容区域 end -->

<!-- Tail begin -->

<!-- Tail end -->