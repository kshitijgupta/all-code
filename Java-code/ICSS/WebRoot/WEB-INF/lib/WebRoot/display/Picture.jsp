<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <html:base/>
    
    <title>资源浏览</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
  	<table style="position:absolute; left:0px; top: 0px;background-color:gray;">
  		<tr>
  			<td height="25px" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0);">
  				<strong style="font-size:14px;color:green;"
  				>&nbsp;&nbsp;&nbsp;&nbsp;你正在观看:《<bean:write name="fileForm" property="fileVO.fileName"/>》</strong>
  				
  				&nbsp;&nbsp;<a style="font-size:11px;color:green;">（双击观看全图）</a>
  			</td>
  		</tr>
  		<tr>
  			<td align="center" valign="middle">
		      <img name="pic" 
		      	   src="<%=request.getContextPath()%>/<bean:write name="fileForm" property="fileVO.fileUrl"/>"  
		      	   height="500px"  width="600px"
		      	   alt="<bean:write name="fileForm" property="fileVO.fileName"/>" />
		   </td>
		</tr>
	</table>
  </body>
</html>
