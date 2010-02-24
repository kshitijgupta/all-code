<%@ page language="java" import="com.abc.scan.constants.*,com.abc.scan.dao.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-html" prefix="html" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">

<html>
	<head> 
		<html:base/>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
		
		<TITLE>ABC-多媒体</TITLE>  
		
		<script src="./include/js/judgeBrowser.js" language="javascript"></script>
		
		<link rel="stylesheet" type="text/css" href="./css/scan.css">
	</head>
  
	<body  style="BACKGROUND-COLOR: transparent;"> 
	 
		<script language="javascript">
		<!--
		    var thisBar= null;
			var isDrag = false;
			window.document.body.onselectstart=new Function("return false");
			
			function topClick(id, url){
				var sum = 5;
				for(var i=1; i<=sum; i++){
					document.getElementById('top'+i).className = "topOut";
				}
				document.getElementById('top'+id).className = "topClick";
				if(id=="1"){window.frames['page'].window.location = "./main.html";};
				if(id=="2"){window.frames['page'].window.location = "./changePage.do?mode=0&page=mov";};
				if(id=="3"){window.frames['page'].window.location = "./changePage.do?mode=0&page=mus";};
				if(id=="4"){window.frames['page'].window.location = "./changePage.do?mode=0&page=pic";};
				if(id=="5"){window.frames['page'].window.location = "./changePage.do?mode=0&page=oth";};	
			}
			
			function inA(obj){
				obj.style.color = "#6666CC";
			}
			
			function outA(obj){
				obj.style.color = "#003366";
			}
			
		-->	
		</script>
		
		<div style="position:absolute; left:0px; top: 75px; z-index:100;">
			<table align="center">
				<tr>
					<td valign="top" id="top1" width="120px" height="30px" align="center" class="topClick">
						<a onClick=" topClick(1, '');" onMouseOver="inA(this);" onMouseOut="outA(this)"><strong>首页</strong></a></td>
					<td valign="top" id="top2" width="125px" height="30px" align="center" class="topOut">
						<a onClick=" topClick(2, '');" onMouseOver="inA(this);" onMouseOut="outA(this)"><strong>视频</strong></a></td>
					<td valign="top" id="top3" width="125px" height="30px" align="center" class="topOut">
						<a onClick=" topClick(3, '');" onMouseOver="inA(this);" onMouseOut="outA(this)"><strong>音乐</strong></a></td>
					<td valign="top" id="top4" width="125px" height="30px" align="center" class="topOut">
						<a onClick=" topClick(4, '');" onMouseOver="inA(this);" onMouseOut="outA(this)"><strong>图片</strong></a></td>
					<td valign="top" id="top5" width="125px" height="30px" align="center" class="topOut">
						<a onClick=" topClick(5, '');" onMouseOver="inA(this);" onMouseOut="outA(this)"><strong>其他</strong></a></td>
				</tr>
			</table>
		</div>
		
		<div style="position:absolute; left:0px; top:0px; z-index:-1;">
		
		<div id="drag_div" style=" width:270px; height:25px; cursor:pointer; position:absolute; left:0px; top:0px;z-index:10000; visibility:hidden;">
			<table width="95%"  border="0" cellpadding="0" cellspacing="0" style="position:absolute; top:0px; left:0px; z-index:100;">
				<tr>
					<td height="23px" width="15%" style="background-color:#FFCCCC; border-right:1px solid #FFFFFF"><div id="drag_state" style='font-size:12px;'><a style='color:red;'>&nbsp;&nbsp;no</a></div></td>
					<td height="23px" width="85%" style="background-color:#BED9EB;"><a id="drag_info1" style='font-size:12px;'>&nbsp;</a><a id="drag_info2" style='font-size:12px;'>&nbsp;</a></td>
				</tr>
			</table>
			<table width="95%" height="23px" border="0" cellpadding="0" cellspacing="0" style="position:absolute; top:2px; left:2px; z-index:50;">
				<tr>
					<td height="100%" width="100%" style="background-color:#666666"></td>
				</tr>
			</table>
		</div>
		<script language="javascript">
			function CheckBar(the_str, the_count, the_first){
				this.str   = the_str;
				this.count = the_count;
			}
			
			var checkBar = new CheckBar("", 0, 0);
		</script>
		
		<table width="100%" border="1" cellpadding="0" cellspacing="0" style="border-bottom:1px solid #BED9EB;border-right:1px solid #BED9EB;border-top:1px solid #BED9EB;border-left:1px solid #BED9EB;">
		  <tr>
		    <td colspan="2" width="100%"  style="border-bottom:1px solid #BED9EB;">
				<table width="100%" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0);">
				<tr>
					<td height="50px">
						<table>
							<tr>
								<td>
									<div>
										<span class="logoABC" style="font-size:36px; color:#990000">ABC</span>
									</div>
								</td>
								<td valign="top">
									<span style="font-size:12px;">多媒体浏览工具</span>
								</td>
							</tr>
						</table>
					</td>
					<td align="right" valign="bottom" height="50">
						<div style="font-size:13px;">
						<table>
							<tr>
								<td>
									<iframe  allowtransparency="true" id="bar" scrolling="no" width="230px" height="40px" frameborder=0 scrolling=auto src="./myfolder/testsearch.jsp">
									</iframe>
								<td>
									<table border="0" cellpadding="0" cellspacing="0">
										<tr>
											<td>
												<span style="font-size:12px" onclick="window.frames['page'].window.location = './myfolder/gaojisousuo.jsp';" style="cursor:pointer">高级</span>
											</td>
										</tr>
										<tr>
											<td>
												<span style="font-size:12px;cursor:pointer"></span>
											</td>
										</tr>
								  </table>
								</td>
								<td>
									&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								</td>
							</tr>
						</table>
						</div>			
					</td>
				</tr>
				</table>
			</td>
		  </tr>
		  <tr>
		    <td colspan="2" height="50px" style="border-bottom:1px solid #0099FF;">
				<table width="100%" border="0" cellpadding="0" cellspacing="0" >
					<tr>
						<td height="45px" align="right" valign="bottom" style="font-size:12px;">
							<table style="font-size:12px;">
								<tr>
								<% 
									String userName = "";
									
									if(session.getAttribute(Constants.USER_KEY)!=null){
										long userKey = (Integer)session.getAttribute(Constants.USER_KEY);
										
										ScanDAO dao = new ScanDAOImpl();
										
										userName = dao.getUsernameById(userKey);
									}
								%>
									<td>
										<a>欢迎你：&nbsp;<%=userName%></a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								<% %>
									<td>
										<a onClick="window.frames['page'].window.location = './b/superManager.jsp';" style="cursor:pointer">管理</a>
										<a onClick="window.frames['page'].window.location = './tongji_a/index.jsp';" style="cursor:pointer">|统计</a>
										&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
									</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td width="100%" height="5px" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)">
					    </td>
					</tr>
				</table>
			</td>
		  </tr>
		  <tr id="frame_tr">
		  	<td height="800px" width="20%" style="border-right: thin solid #BED9EB">
				<iframe id="tree" scrolling="yes" width="100%" height="800px" frameborder=0 scrolling=auto src="./loadTree.do">
				</iframe>
		  	</td>
		    <td height="600px" width="80%">
				<iframe id="page" width="100%" height="800px" frameborder=0 scrolling=auto src="./main.html">
				</iframe>
		    </td>
		  </tr>
		  <tr>
		    <td colspan="2" width="100%" style=" background-color:#0000FF; filter:progid:DXImageTransform.Microsoft.Gradient(startColorStr=#FFFFFF, endColorStr=#BED9EB, gradientType=0)">&nbsp;</td>
		  </tr>
		</table>
		</div>
	</body>
</html>
