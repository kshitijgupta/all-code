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
  				
  				&nbsp;&nbsp;<a style="font-size:11px;color:green;">（双击全屏）</a>
  			</td>
  		</tr>
  		<tr>
  			<td align="center" valign="middle">
  				<object   classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95"   id="player"  width="600px" height="500px">
  				  <param   name="AudioStream"   value="-1">   
			      <param   name="AutoSize"   value="-1">   
			      <param   name="AutoStart"   value="-1">   
			      <param   name="AnimationAtStart"   value="-1">   
			      <param   name="AllowScan"   value="-1">   
			      <param   name="AllowChangeDisplaySize"   value="-1">   
			      <param   name="AutoRewind"   value="0">   
			      <param   name="Balance"   value="0">   
			      <param   name="BaseURL"   value>   
			      <param   name="BufferingTime"   value="5">   
			      <param   name="CaptioningID"   value>   
			      <param   name="ClickToPlay"   value="-1">   
			      <param   name="CursorType"   value="0">   
			      <param   name="CurrentPosition"   value="-1">   
			      <param   name="CurrentMarker"   value="0">   
			      <param   name="DefaultFrame"   value>   
			      <param   name="DisplayBackColor"   value="0">   
			      <param   name="DisplayForeColor"   value="16777215">   
			      <param   name="DisplayMode"   value="0">   
			      <param   name="DisplaySize"   value="0">   
			      <param   name="Enabled"   value="-1">   
			      <param   name="EnableContextMenu"   value="-1">   
			      <param   name="EnablePositionControls"   value="-1">   
			      <param   name="EnableFullScreenControls"   value="0">   
			      <param   name="EnableTracker"   value="-1">  
			  
			      <!-- add here down-->
			      <param   name="Filename" value='<%=request.getContextPath()%>/<bean:write name="fileForm" property="fileVO.fileUrl"/>'>
			      <!-- add here up-->
			
			      <param   name="InvokeURLs"   value="-1">   
			      <param   name="Language"   value="-1">   
			      <param   name="Mute"   value="0">   
			      <param   name="PlayCount"   value="1">   
			      <param   name="PreviewMode"   value="0">   
			      <param   name="Rate"   value="1">   
			      <param   name="SAMILang"   value>   
			      <param   name="SAMIStyle"   value>   
			      <param   name="SAMIFileName"   value>   
			      <param   name="SelectionStart"   value="-1">   
			      <param   name="SelectionEnd"   value="-1">   
			      <param   name="SendOpenStateChangeEvents"   value="-1">   
			      <param   name="SendWarningEvents"   value="-1">   
			      <param   name="SendErrorEvents"   value="-1">   
			      <param   name="SendKeyboardEvents"   value="0">   
			      <param   name="SendMouseClickEvents"   value="-1">   
			      <param   name="SendMouseMoveEvents"   value="0">   
			      <param   name="SendPlayStateChangeEvents"   value="-1">   
			      <param   name="ShowCaptioning"   value="0">   
			      <param   name="ShowControls"   value="-1">   
			      <param   name="ShowAudioControls"   value="-1">   
			      <param   name="ShowDisplay"   value="0">   
			      <param   name="ShowGotoBar"   value="0">   
			      <param   name="ShowPositionControls"   value="-1">   
			      <param   name="ShowStatusBar"   value="0">   
			      <param   name="ShowTracker"   value="-1">   
			      <param   name="StretchToFit"   value="-1"><!-- 按比例伸展 -->
			      <param   name="TransparentAtStart"   value="0">   
			      <param   name="VideoBorderWidth"   value="0">   
			      <param   name="VideoBorderColor"   value="0">   
			      <param   name="VideoBorder3D"   value="0">   
			      <param   name="Volume"   value="-320">   
			      <param   name="WindowlessVideo"   value="0">   
			  </object> 
  			</td>
  		</tr>
  	</table>
  	
    <script language="javascript"> 
        var player = document.getElementById('player');
        
        var h = player.offsetHeight;
        var w = player.offsetWidth;
        
        var max = 600;
        
        function changeSize(){
        	player.style.height = max;
        	player.style.width  = parseInt(max*w/h);
        }
        
        if(h>max){
        	window.setTimeout(changeSize,1000);
        }  
    </script>
  </body>
</html>
