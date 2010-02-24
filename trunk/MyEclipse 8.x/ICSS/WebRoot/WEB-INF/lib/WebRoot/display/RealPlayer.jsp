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
  				>&nbsp;&nbsp;&nbsp;&nbsp;你正在播放:《<bean:write name="fileForm" property="fileVO.fileName"/>》</strong>
  				<%=config.getServletContext().getRealPath("/")%>/resources/<bean:write name="fileForm" property="fileVO.fileUrl"/>
  				&nbsp;&nbsp;<a style="font-size:11px;color:green;">（双击全屏）</a>
  			</td>
  		</tr>
  		<tr>
  			<td align="center" valign="middle">&nbsp; 
					<object id=video1 classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA height=488 width=505> 
						<param name=_ExtentX value=5503> 
						<param name=_ExtentY value=1588> 
						<param name=AUTOSTART value=-1> 
						<param name=SHUFFLE value=0> 
						<param name=PREFETCH value=0> 
						<param name=NOLABELS value=0> 


						<!-- add here down-->
						<param name="SRC"
							value='<%=config.getServletContext().getRealPath("\\")%><bean:write name="fileForm" property="fileVO.fileUrl"/>'>
						<!-- add here up-->

						<param name=CONTROLS value=Imagewindow,StatusBar,ControlPanel> 
						<param name=CONSOLE value=RAPLAYER> 
						<param name=LOOP value=0> 
						<param name=NUMLOOP value=0> 
						<param name=CENTER value=0> 
						<param name=MAINTAINASPECT value=0> 
						<param name=BACKGROUNDCOLOR value=#000000> 
					</object>
				</td>
			</tr>
		</table>
	</body>
</html>
