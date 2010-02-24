<%@ page language="java" import="com.abc.scan.constants.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>资源视图</title>
		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">    
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">  
		<meta http-equiv="description" content="This is my page">
		
		<script src="./include/js/correctPNG.js" language="javascript"></script>
	</head>
	<body style="BACKGROUND-COLOR: transparent;">
		<script language="javascript">
			var xmlHttp = false;
			try {
			  xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
			} catch (e) {
			  try {
			    xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
			  } catch (e2) {
			    xmlHttp = false;
			  }
			}
			if (!xmlHttp && typeof XMLHttpRequest != 'undefined') {
			  xmlHttp = new XMLHttpRequest();
			}
			
		</script>
		
		<script language="javascript">
			var checkBar = null;
			
			function changeLength(mode,the_out) {
				if(mode==0){
					window.location = "./changePage.do?mode=0&out="+the_out+"&page="+"<bean:write name="scanForm" property="page"/>";
				}else
					if(mode==1){
						window.location = "./changePage.do?mode=1&out="+the_out+"&folderId="+"<bean:write name="scanForm" property="folderId"/>";
					}
			}
			function changeClick(mode,the_out){
				document.getElementById('change_button').onclick = function(){changeLength(mode,the_out);}; 
			}
		</script>

		<script language="javascript">
			function DynaWin(fileId) {
				var disp = parent.window.open("./fileDisplay.do?fileId="+fileId,"newwindow","resizable=no,width=606px,height=531px");
				disp.document.close();
			}
			// import="java.util.*"
			
			function openFile(){
				 document.getElementById('upload').style.visibility = "visible";
			}
			function closeFile(){
				 document.getElementById('upload').style.visibility = "hidden";
			}
		</script>
		
		
		<div id="update_div" style=" width:300px; height:100px; cursor:pointer; position:absolute; left:300px; top:150px; BACKGROUND:url(images/text_bg.jpg); z-index:10000;background-color:pink; visibility:hidden;">
			<table width="95%"  border="0" cellpadding="0" cellspacing="0" style="position:absolute; top:0px; left:0px; z-index:100;">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td height="30px" width="100%" ><a style='font-size:12px;'>你正在更新：</a><a id="update_info" style='font-size:12px;'>&nbsp;</a></td>
				</tr>
				<tr>
					<td></td>
					<td height="10px" width="100%" ><a style='font-size:12px;'>新名字:</a></td>
				</tr>
				<tr>
					<td>						
					</td>
					<td valign="top" height="60px" width="100%" >
					<input type="text" id="update_text"/>
					<input type="button" id="update_button" value="提交" onclick="updateName();"/>
					<input type="button" id="no_button" value="取消" onclick="document.getElementById('update_div').style.visibility = 'hidden';"/>
						<script language="javascript">
							function updateName(){
								if (parent.thisBar == null) return;
								if (document.getElementById('update_text').value == "") return;
								
								var newName = document.getElementById('update_text').value;
								var url = "./doOp.do";
								var sendData = "op=updatename&folderId="+parent.thisBar.id+"&newname="+newName;
								xmlHttp.open("POST", url, true);
								xmlHttp.onreadystatechange = function(){updateTree()};
								
								xmlHttp.setrequestheader("content-length",sendData.length); 
								xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
								
						 		xmlHttp.send(sendData);
							}
							
							function updateTree(){
								if (xmlHttp.readyState < 4) {
								}
								if (xmlHttp.readyState == 4) {
								    var response = xmlHttp.responseText;
								    if(response == "ok"){
								    	parent.thisBar.name = document.getElementById('update_text').value;
								    	document.getElementById('update_text').value = "";
								    	parent.window.frames['tree'].document.getElementById('name_'+parent.thisBar.id).innerHTML = parent.thisBar.name;
								    	document.getElementById('update_div').style.visibility = 'hidden';
								    }else{
								    	if(response == "no"){
								    	}
								    } 
								}							
							}
						</script>
					</td>
				</tr>
			</table>
		</div>
		
		<div id="add_div" style=" width:300px; height:100px; cursor:pointer; position:absolute; left:300px; top:150px;z-index:10000;background-color:pink;BACKGROUND:url(images/text_bg.jpg); visibility:hidden;">
			<table width="95%"  border="0" cellpadding="0" cellspacing="0" style="position:absolute; top:0px; left:0px; z-index:100;">
				<tr>
					<td>&nbsp;&nbsp;&nbsp;</td>
					<td height="30px" width="100%" ><a style='font-size:12px;'>你正在增加：</a><a id="add_info" style='font-size:12px;'>&nbsp;</a></td>
				</tr>
				<tr>
					<td></td>
					<td height="10px" width="100%" ><a style='font-size:12px;'>新目录:</a></td>
				</tr>
				<tr>
					<td>						
					</td>
					<td valign="top" height="60px" width="100%" >
					<input type="text" id="add_text"/>
					<input type="button" id="add_button" value="提交" onclick="addName();"/>
					<input type="button" id="no_add" value="取消" onclick="document.getElementById('add_div').style.visibility = 'hidden';"/>
						<script language="javascript">
							function addName(){
								if (parent.thisBar == null) return;
								if (document.getElementById('add_text').value == "") return;
								
								var newName = document.getElementById('add_text').value;
								var url = "./doOp.do";
								var sendData = "op=addname&folderId="+parent.thisBar.id+"&newname="+newName;

								xmlHttp.open("POST", url, true);
								xmlHttp.onreadystatechange = function(){addTree()};
								
								xmlHttp.setrequestheader("content-length",sendData.length); 
								xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
								
						 		xmlHttp.send(sendData);
							}
							
							function addTree(){
								if (xmlHttp.readyState < 4) {
								}
								if (xmlHttp.readyState == 4) {
								    var response = xmlHttp.responseText;
								    if(response == "ok"){
								    	alert("增加成功");
								    	
								    	document.getElementById('add_text').value = "";
								    	document.getElementById('add_div').style.visibility = 'hidden';
								    	
								    	parent.thisBar  = null;
								    	parent.window.frames['tree'].window.location = "./error/load.jsp";
								    	parent.window.frames['tree'].window.location = "./loadTree.do";	
								    }else{
								    	if(response == "no"){
								    	    alert("增加失败");
								    	}
								    } 
								}							
							}
						</script>
					</td>
				</tr>
			</table>
		</div>
		<div id="down_div" style=" width:10px; height:10px; cursor:pointer; position:absolute; left:0px; top:0px;z-index:10000; visibility:hidden;">
			<iframe id="down_frame" scrolling="yes" width="10px" height="10px" frameborder=0 scrolling=auto src="./load.jsp">
			</iframe>
		</div>
		<div
			style="position: absolute; left: 0px; top: 0px; width: 100%; z-index: 500;">
			<table width="100%">
				<tr>
					<td> 
						<table style="font-size: 12px; position: absolute; left: 0px; top: 0px; z-index: 500;">
							<tr>
							<bean:define id="userPower" name="scanForm" property="userPower"/>
							<%	
								int power = (Integer)userPower; 
								if(power < Constants.DOWNLOAD){
						    %>
								<!-- 权限 downLoad -->
								<td align="center">
									<input id="all_select" name="all_select" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;全选&nbsp;&nbsp;&nbsp;&nbsp;" />
								</td>
								<td align="center">
									<input id="file_download" name="file_download" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;下载&nbsp;&nbsp;&nbsp;&nbsp;" />
								</td>
								<td align="center">
									&nbsp;&nbsp;
									<script language="javascript"> 
										var is_all_select = false;
										
										var all_select    = document.getElementById('all_select');
										var file_download = document.getElementById('file_download');
										
										function allSelect(){
											checkCount = 0;
											
											if(is_all_select == false){
												for(var i=0; i < checkBar.length; i++){
													if(checkBar[i].the_id != -1){
														checkBar[i].isCheck = true;
														document.getElementById(checkBar[i].the_id+"_input").checked = true; 
														checkCount++;
													}
												}
												is_all_select = true;
												setParentVar();
											}else
												if(is_all_select == true){
														for(var i=0; i < checkBar.length; i++){
															if(checkBar[i].the_id != -1){
																checkBar[i].isCheck = false; 
																document.getElementById(checkBar[i].the_id+"_input").checked = false;  
															}
														}
													checkCount = 0;
													is_all_select = false;
													setParentVar();
												}
										}
										
										function fileDownLoad(){
											if(parent.checkBar.count == 0){alert("你没有选择文件");}
											if(parent.checkBar.count >= 1){
											
												var url = "./doOp.do";
												var sendData = "?op=filedown&count="+parent.checkBar.count+"&str="+parent.checkBar.str;
												
												window.frames['down_frame'].window.location = url + sendData;
										 	}	
										}
										
										function aLoad(the_load_id){
											var url = "./doOp.do";
											var sendData = "?op=filedown&count="+1+"&str="+the_load_id;
											
											window.frames['down_frame'].window.location = url + sendData;
										}
										
										window.onload = function(){
										    if(checkBar != null){
										    	all_select.onclick    = function(){allSelect()};
										    	file_download.onclick = function(){fileDownLoad()};
										    }	 
										}
									</script>
								</td>
								
							<% 
								} 
								if(power < Constants.UPLOAD){
							%>
								<!-- 权限 upLoad -->
								<td align="center">
									<input id="file_upload" name="file_upload" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;上传&nbsp;&nbsp;&nbsp;&nbsp;" />
								</td>
								<td align="center">
									&nbsp;&nbsp;
									<script language="javascript">  
										var file_upload = document.getElementById('file_upload');
										
										function fileUpload(){
											window.location = "./upload.jsp";
										}
										
										file_upload.onclick = function(){fileUpload();};
									</script>
								</td>
							<% 
								}
								if(power < Constants.UPDATE){
							%>
								<!-- 权限 upDate -->
								<td align="center">
									<input id="file_delete" name="file_delete" type="button" value="&nbsp;&nbsp;&nbsp;&nbsp;删除&nbsp;&nbsp;&nbsp;&nbsp;" />
								</td>
								<td align="center">
									&nbsp;&nbsp;
									<script language="javascript">  
										var file_delete = document.getElementById('file_delete');
										
										function fileDelete(){
											if(parent.checkBar.count == 0){alert("你没有选择文件");}
											if(parent.checkBar.count >= 1){
												var sure = window.confirm("确定删除么?");
												
												if(sure){
													var url = "./doOp.do";
													var sendData = "op=filedelete&count="+parent.checkBar.count+"&str="+parent.checkBar.str;
													
													xmlHttp.open("POST", url, true);
													xmlHttp.onreadystatechange = function(){to_delete();};
													
													xmlHttp.setrequestheader("content-length",sendData.length); 
													xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
													
											 		xmlHttp.send(sendData);
										 		}
											}
										}
										
										function to_delete(){
											if (xmlHttp.readyState < 4) {
											}
											if (xmlHttp.readyState == 4) {
											    var response = xmlHttp.responseText;
											    if(response == "ok"){
											    	alert("删除成功");
											    	var mode    = <bean:write name="scanForm" property="mode"/>;
													if(mode==0){
														window.location = "./changePage.do?mode=0&page="+"<bean:write name="scanForm" property="page"/>";
													}else
														if(mode==1){
															window.location = "./changePage.do?mode=1&folderId="+"<bean:write name="scanForm" property="folderId"/>";
														} 
											    }else{
											    	if(response == "no"){
											    	    alert("删除失败");
											    	    var mode    = <bean:write name="scanForm" property="mode"/>;
														if(mode==0){
															window.location = "./changePage.do?mode=0&page="+"<bean:write name="scanForm" property="page"/>";
														}else
															if(mode==1){
																window.location = "./changePage.do?mode=1&folderId="+"<bean:write name="scanForm" property="folderId"/>";
															} 
											    	}
											    } 
											}	
										}
																			
										file_delete.onclick = function(){if(checkBar != null){fileDelete();}};
									</script>
								</td>
							<logic:present name="scanForm" property="mode">
								<logic:equal name="scanForm" property="mode" value="1">
									<td align="center">
									<logic:equal name="scanForm" property="empty" value="0">
										<input id="folder_delete" name="folder_delete" type="button" value="目录删除" />
										<script language="javascript">  
										var folder_delete = document.getElementById('folder_delete');
										
										function deleteF(){
											var newName = document.getElementById('update_text').value;
											var url = "./doOp.do";
											var sendData = "op=deletefolder&folderId="+parent.thisBar.id;
											xmlHttp.open("POST", url, true);
											xmlHttp.onreadystatechange = function(){deleteTree()};
											
											xmlHttp.setrequestheader("content-length",sendData.length); 
											xmlHttp.setRequestHeader("Content-Type","application/x-www-form-urlencoded"); 
											
									 		xmlHttp.send(sendData);
										}
										
										function deleteTree(){
											if (xmlHttp.readyState < 4) {
											}
											if (xmlHttp.readyState == 4) {
											    var response = xmlHttp.responseText;
											   
											    if(response == "ok"){
											    	alert("删除成功");
											    	window.location = "./main.html";
											    	parent.thisBar  = null;
											    	parent.window.frames['tree'].window.location = "./error/load.jsp";
											    	parent.window.frames['tree'].window.location = "./loadTree.do";	
											    }else{
											    	if(response == "no"){
											    		alert("失败...");
											    	}
											    } 
											}							
										}
							
										function folderDelete(){
											if(parent.thisBar != null){
												var sure = window.confirm("确定删除么?");
												
												if(sure){
													deleteF();
												}
											}
										}
										
										
										folder_delete.onclick = function(){folderDelete()};
									</script>
									</logic:equal>
									</td>
									<td align="center">
										<input id="folder_update" name="folder_update" type="button" value="目录更名" />
										<script language="javascript">  
										var folder_update = document.getElementById('folder_update');
										
										function folderUpdate(){
											if(parent.thisBar != null){
												var update_div = document.getElementById('update_div')
												update_div.style.visibility = "visible";
												document.getElementById('update_info').innerHTML = parent.thisBar.name;
											}
										}
										
										folder_update.onclick = function(){folderUpdate()};
									</script>
									</td>
									<td align="center">
										<input id="folder_add" name="folder_add" type="button" value="目录增添" />
										<script language="javascript">  
										var folder_add = document.getElementById('folder_add');
										
										function folderAdd(){
											if(parent.thisBar != null){
												var add_div = document.getElementById('add_div')
												add_div.style.visibility = "visible";
												document.getElementById('add_info').innerHTML = parent.thisBar.name;
											}
										}
										
										folder_add.onclick = function(){folderAdd()};
									</script>
									</td>
								</logic:equal>
							</logic:present>
							<%
								} 
							%>
							
							</tr>
						</table>
					</td>
					<td align="right">
						<input id="change_button" name="change_button" type="button"
							onclick=""
							value="&nbsp;&nbsp;切换视图" />
					</td>
				</tr>
			</table>
		</div>
		<div style="position: absolute; left: 0px; top: 35px; width: 100%; z-index: 500; font-size: 12px; color: green;">
			<strong>&nbsp;&nbsp;&nbsp;&nbsp;<bean:write name="scanForm" property="outPage"/>列表&nbsp;&nbsp;
			<%
				if(power < Constants.UPDATE){ 
			%>
					(请在标题上拖动)
			<% 
				}
			%>
			</strong>
		</div>
		<div style="position: absolute; left: 0px; top: 50px; z-index: 1000; width: 100%">
			<table width="100%" border="0"
				style="color: #000000; font-size: 13px; position: absolute; left: 0px; top: 0px; width: 100%; z-index: 500;">
				<logic:notPresent name="scanForm" property="bigList">
					<logic:notPresent name="scanForm" property="smallList">
						<tr>
							<td colspan="9" style="font-size:12px;color:red;"><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;对不起，此文件夹中不包含文件</td>
						</tr>
					</logic:notPresent>	
				</logic:notPresent>	
				<logic:present name="scanForm" property="bigList">
				
				<logic:present name="scanForm" property="pageBar">
				<div style="font-size:12px;">
					<script language="javascript">
						function change(pageNum){
							var mode    = <bean:write name="scanForm" property="mode"/>;
							if(mode==0){
								window.location = "./changePage.do?mode=0&num="+pageNum+"&page="+"<bean:write name="scanForm" property="page"/>";
							}else
								if(mode==1){
									window.location = "./changePage.do?mode=1&num="+pageNum+"&folderId="+"<bean:write name="scanForm" property="folderId"/>";
								} 
						}
						
						var num    = <bean:write name="scanForm" property="num"/>;
						var size   = <bean:write name="scanForm" property="bigMode"/>;
						var count  = <bean:write name="scanForm" property="count"/>;
						var screen = <bean:write name="scanForm" property="screenMode"/>;
						
						var strResult = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		
						var pageCount = 0;
						var thisPage  = parseInt(num/size) + 1;
						
						if(count%size == 0){
							pageCount = count/size;
						}else{
							pageCount = parseInt(count/size) + 1;
						}
						
						if(pageCount <= 1){
							strResult = "";
						}else{
							if(pageCount <= screen){
								if(thisPage <= 1){
									strResult += "<font color='black'>首页&nbsp;上一页&nbsp;</font>"; 
								}else{
									strResult += "<a href='javascript:change(0)'><font color='red'>首页</font></a>&nbsp;";
							        strResult += "<a href='javascript:change("+(thisPage-2)*size+")'><font color='red'>上一页</font><a>&nbsp;";
								}
								
								for(var i=0; i<pageCount; i++){
									if(i+1 != thisPage){
										strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
									}else{
										strResult += "<a><font color='black'>"+(i+1)+"</font><a>&nbsp;";
									}
								}
								
								if (thisPage >= pageCount) {
									strResult += "<font color='black'>下一页&nbsp;尾页&nbsp;</font>";
							    }else{
							    	strResult += "<a href='javascript:change(" +thisPage*size+ ")'><font color='red'>下一页</font><a>&nbsp;";
						            strResult += "<a href='javascript:change(" +(pageCount-1)*size+ ")'><font color='red'>尾页</font><a>&nbsp;";
							    }
							}else{
								var l = parseInt((screen-1)/2);
								
								if(thisPage <= 1){
									strResult += "<font color='black'>首页&nbsp;上一页&nbsp;</font>";
								}else{
									strResult += "<a href='javascript:change(0)'><font color='red'>首页</font></a>&nbsp;";
							        strResult += "<a href='javascript:change("+(thisPage-2)*size+")'><font color='red'>上一页</font><a>&nbsp;";
								}
								
								if(thisPage > l+1){
									strResult += "<font color='black'>&nbsp;...&nbsp;</font>";
								}
								
								if(thisPage-l >= 1 && thisPage+l <= pageCount){
									for(var i=thisPage-l-1; i<=thisPage+l-1; i++){
										if(i != thisPage){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}else{
											strResult += "<a><font color='black'>"+(i+1)+"</font><a>&nbsp;";
										}
									}
								}else{
									if(thisPage <= l){
										for(var i=0; i<thisPage-1; i++){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}
										strResult += "<a><font color='black'>"+thisPage+"</font><a>&nbsp;";
										for(var i=thisPage; i<screen; i++){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}
									}else
										if(thisPage > pageCount-l){
											var last = screen - (pageCount - thisPage) - 1; 
											for(var i=thisPage-last-1; i<thisPage-1; i++){
												strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
											}
											strResult += "<a><font color='black'>"+thisPage+"</font><a>&nbsp;";
											for(var i=thisPage; i<pageCount; i++){
												strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
											}
										}
								}
								
								if(thisPage + l < pageCount){
									strResult += "<font color='black'>&nbsp;...&nbsp;</font>";
								}
								
								if (thisPage >= pageCount) {
									strResult += "<font color='black'>下一页&nbsp;尾页&nbsp;</font>";
							    }else{
							    	strResult += "<a href='javascript:change(" +thisPage*size+ ")'><font color='red'>下一页</font><a>&nbsp;";
						            strResult += "<a href='javascript:change(" +(pageCount-1)*size+ ")'><font color='red'>尾页</font><a>&nbsp;";
							    }
							}
						}
						if(strResult != ""){
							strResult += "&nbsp;&nbsp;&nbsp;共&nbsp;"+pageCount+"&nbsp;页,&nbsp;"+count+"&nbsp;条记录,当前为第&nbsp;"+thisPage+"&nbsp;页";
							strResult += "<br><br>";
						}
						
     					document.write(strResult);
					</script>
				</div>
				</logic:present>
				
				<script language="javascript">
					changeClick('<bean:write name="scanForm" property="mode"/>',1); 
				</script>
				
				<tr>
					<td align="left" width="2%" height="25px">
						&nbsp;
					</td>
					<td align="left" width="5%" height="25px">
						<strong>类目</strong>
					</td>
					<td align="left" width="20%" height="25px">
						<strong>标题</strong>
					</td>
					<td align="left" width="15%" height="25px"> 
						<strong>级别</strong>
					</td>
					<td align="left" width="25%" height="25px">
						<strong>描述</strong>
					</td>
					<td align="left" width="15%" height="25px">
						<strong>编著</strong>
					</td>
					<td align="left" width="10%" height="25px">
						<strong>时间</strong>
					</td>
					<td align="left" width="4%" height="25px">
						<strong>预览</strong>
					</td>
					<td align="left" width="4%" height="25px">
						<strong>操作</strong>
					</td>
				</tr>
			
				<script language="javascript">
					var allNum     = <bean:write name="scanForm" property="bigMode"/>;	
					var checkBar   = new Array(allNum);				
					var checkCount = 0;
					
					parent.checkBar.str   = "";
					parent.checkBar.count = 0;
					
					for(var i=0; i<allNum; i++){
						checkBar[i] = new ACheck( -1, i, false); 
					}
					
					var iCount = 0;
					
					function ACheck(the_id, the_no, isCheck){
						this.the_id = the_id;
						this.the_no = the_no;
						this.isCheck= isCheck;
					}
					
					function setCheck(the_id, the_no){
						checkBar[the_no].the_id = the_id;
						document.getElementById(the_id+"_input").onclick    = function(){checkClick(the_no);};
						document.getElementById(the_id+"_name").onmousedown = function(){judgeDown(the_no);};
					}
					
					function checkClick(the_no){
						if(checkBar[the_no].isCheck == false){
							checkCount++;
							checkBar[the_no].isCheck = true;
							setParentVar();
						}else
							if(checkBar[the_no].isCheck == true){
								checkCount--;
								checkBar[the_no].isCheck = false;
								setParentVar();
							}
					}
					
					function setParentVar(){
						parent.checkBar.count = checkCount;
						
						var a_str = "";
						var last  = allNum-1;
						
						for( last=allNum-1; last>=0; last--){
							if(checkBar[last].isCheck == true){
								break;
							}
						}
						
						for(var i=0; i<allNum; i++){
							if(checkBar[i].isCheck == true){
								if(i != last){
									a_str += checkBar[i].the_id+",";
								}
								if(i == last){
									a_str += checkBar[i].the_id;
								}
							}
							if(checkBar[i].isCheck == false){
							}
						}
						
						parent.checkBar.str = a_str;        //alert("a_str:"+a_str+"count:"+parent.checkBar.count);
					}
				</script>
						
				<logic:iterate id="item" name="scanForm" property="bigList">
					<logic:present name="item">
						<tr>
							<td align="left"> 
								<input id="<bean:write name="item" property="fileId"/>_input" name="<bean:write name="item" property="fileId"/>" type="checkbox" value="0"/>
							</td>
							<td align="left">
								<bean:write name="item" property="classType"/>
							</td>
							<td align="left">
								<a id="<bean:write name="item" property="fileId"/>_name" ><bean:write name="item" property="fileName"/></a>
								
								<script language="javascript">
									setCheck(<bean:write name="item" property="fileId"/>, iCount);
									iCount++; 
								</script>
								
							</td>
							<td align="left">
								<bean:write name="item" property="filePower"/><!-- 级别 -->
							</td>
							<td align="left">
								<bean:write name="item" property="fileDescribe"/>:<bean:write name="item" property="media"/><!-- 描述 -->
							</td>
							<td align="left">
								<bean:write name="item" property="fileAuthor"/><!-- 作者 -->
							</td>
							<td align="left">
								<bean:write name="item" property="time"/><!-- 时间 -->
							</td>
							<td align="left">
								<input name="" type="button"
									onclick="DynaWin('<bean:write name="item" property="fileId"/>')"
									value="打开" 
									<logic:equal name="item" property="canOpen" value="0">
										disabled="disabled"
									</logic:equal>	
									/><!-- 预览 -->
							</td>
							<td align="left">
								  
							<%
								if(power < Constants.DOWNLOAD){
							%>
								<input name="" type="button" value="下载" onclick="aLoad(<bean:write name="item" property="fileId"/>);"/><!-- 操作 -->
							<%
								}else{
							%>
								<input name="" type="button" value="下载" disabled="disabled" />
							<% 
								}
							%>
							</td>
						</tr>
						<tr>
							<td colspan="9" width="90%" height="1px"
								style="background-color: #999999"></td>
						</tr>
					</logic:present>
				</logic:iterate>	
			</logic:present>
			
			<logic:present name="scanForm" property="smallList">
				<logic:present name="scanForm" property="pageBar">
				<div style="font-size:12px;">
					<script language="javascript">
						function change(pageNum){
							var mode    = <bean:write name="scanForm" property="mode"/>;
							if(mode==0){
								window.location = "./changePage.do?mode=0&num="+pageNum+"&page="+"<bean:write name="scanForm" property="page"/>";
							}else
								if(mode==1){
									window.location = "./changePage.do?mode=1&num="+pageNum+"&folderId="+"<bean:write name="scanForm" property="folderId"/>";
								} 
						}
						
						var num    = <bean:write name="scanForm" property="num"/>;
						var size   = <bean:write name="scanForm" property="smallMode"/>;
						var count  = <bean:write name="scanForm" property="count"/>;
						var screen = <bean:write name="scanForm" property="screenMode"/>;
						
						var strResult = "<br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;";
		
						var pageCount = 0;
						var thisPage  = parseInt(num/size) + 1;
						
						if(count%size == 0){
							pageCount = count/size;
						}else{
							pageCount = parseInt(count/size) + 1;
						}
						
						if(pageCount <= 1){
							strResult = "";
						}else{
							if(pageCount <= screen){
								if(thisPage <= 1){
									strResult += "<font color='black'>首页&nbsp;上一页&nbsp;</font>"; 
								}else{
									strResult += "<a href='javascript:change(0)'><font color='red'>首页</font></a>&nbsp;";
							        strResult += "<a href='javascript:change("+(thisPage-2)*size+")'><font color='red'>上一页</font><a>&nbsp;";
								}
								
								for(var i=0; i<pageCount; i++){
									if(i+1 != thisPage){
										strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
									}else{
										strResult += "<a><font color='black'>"+(i+1)+"</font><a>&nbsp;";
									}
								}
								
								if (thisPage >= pageCount) {
									strResult += "<font color='black'>下一页&nbsp;尾页&nbsp;</font>";
							    }else{
							    	strResult += "<a href='javascript:change(" +thisPage*size+ ")'><font color='red'>下一页</font><a>&nbsp;";
						            strResult += "<a href='javascript:change(" +(pageCount-1)*size+ ")'><font color='red'>尾页</font><a>&nbsp;";
							    }
							}else{
								var l = parseInt((screen-1)/2);
								
								if(thisPage <= 1){
									strResult += "<font color='black'>首页&nbsp;上一页&nbsp;</font>";
								}else{
									strResult += "<a href='javascript:change(0)'><font color='red'>首页</font></a>&nbsp;";
							        strResult += "<a href='javascript:change("+(thisPage-2)*size+")'><font color='red'>上一页</font><a>&nbsp;";
								}
								
								if(thisPage > l+1){
									strResult += "<font color='black'>&nbsp;...&nbsp;</font>";
								}
								
								if(thisPage-l >= 1 && thisPage+l <= pageCount){
									for(var i=thisPage-l-1; i<=thisPage+l-1; i++){
										if(i != thisPage){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}else{
											strResult += "<a><font color='black'>"+(i+1)+"</font><a>&nbsp;";
										}
									}
								}else{
									if(thisPage <= l){
										for(var i=0; i<thisPage-1; i++){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}
										strResult += "<a><font color='black'>"+thisPage+"</font><a>&nbsp;";
										for(var i=thisPage; i<screen; i++){
											strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
										}
									}else
										if(thisPage > pageCount-l){
											var last = screen - (pageCount - thisPage) - 1; 
											for(var i=thisPage-last-1; i<thisPage-1; i++){
												strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
											}
											strResult += "<a><font color='black'>"+thisPage+"</font><a>&nbsp;";
											for(var i=thisPage; i<pageCount; i++){
												strResult += "<a href='javascript:change("+i*size+")'><font color='red'>"+(i+1)+"</font><a>&nbsp;";
											}
										}
								}
								
								if(thisPage + l < pageCount){
									strResult += "<font color='black'>&nbsp;...&nbsp;</font>";
								}
								
								if (thisPage >= pageCount) {
									strResult += "<font color='black'>下一页&nbsp;尾页&nbsp;</font>";
							    }else{
							    	strResult += "<a href='javascript:change(" +thisPage*size+ ")'><font color='red'>下一页</font><a>&nbsp;";
						            strResult += "<a href='javascript:change(" +(pageCount-1)*size+ ")'><font color='red'>尾页</font><a>&nbsp;";
							    }
							}
						}
						if(strResult != ""){
							strResult += "&nbsp;&nbsp;&nbsp;共&nbsp;"+pageCount+"&nbsp;页,&nbsp;"+count+"&nbsp;条记录,当前为第&nbsp;"+thisPage+"&nbsp;页";
							strResult += "<br><br>";
						}
						
     					document.write(strResult);
					</script>
				</div>
				</logic:present>
				
				<script language="javascript">
					changeClick('<bean:write name="scanForm" property="mode"/>',0); 
				</script>
				
			
				<script language="javascript">
					var allNum     = <bean:write name="scanForm" property="smallMode"/>;	
					var checkBar   = new Array(allNum);				
					var checkCount = 0;
					
					parent.checkBar.str   = "";
					parent.checkBar.count = 0;
					
					for(var i=0; i<allNum; i++){
						checkBar[i] = new ACheck( -1, i, false); 
					}
					
					var iCount = 0;
					
					function ACheck(the_id, the_no, isCheck){
						this.the_id = the_id;
						this.the_no = the_no;
						this.isCheck= isCheck;
					}
					
					function setCheck(the_id, the_no){
						checkBar[the_no].the_id = the_id;
						document.getElementById(the_id+"_input").onclick    = function(){checkClick(the_no);};
						document.getElementById(the_id+"_name").onmousedown = function(){judgeDown(the_no);};
					}
					
					function checkClick(the_no){
						if(checkBar[the_no].isCheck == false){
							checkCount++;
							checkBar[the_no].isCheck = true;
							setParentVar();
						}else
							if(checkBar[the_no].isCheck == true){
								checkCount--;
								checkBar[the_no].isCheck = false;
								setParentVar();
							}
					}
					
					function setParentVar(){
						parent.checkBar.count = checkCount;
						
						var a_str = "";
						var last  = allNum-1;
						
						for( last=allNum-1; last>=0; last--){
							if(checkBar[last].isCheck == true){
								break;
							}
						}
						
						for(var i=0; i<allNum; i++){
							if(checkBar[i].isCheck == true){
								if(i != last){
									a_str += checkBar[i].the_id+",";
								}
								if(i == last){
									a_str += checkBar[i].the_id;
								}
							}
							if(checkBar[i].isCheck == false){
							}
						}
						
						parent.checkBar.str = a_str;        //alert("a_str:"+a_str+"count:"+parent.checkBar.count);
					}
				</script>
				
				
					<tr style=" font-size:13px">
									<td align="left" width="5%" height="25px">&nbsp;</td>
									<td align="left" width="10%" height="25px"><strong>标题/图片</strong></td>
									<td align="left" width="3%" height="25px"><strong>&nbsp;</strong></td>
									<td align="left" width="40%" height="25px"><strong>信息</strong></td>
									<td align="left" width="2%" height="25px"><strong>&nbsp;</strong></td>
									<td align="left" width="30%" height="25px"><strong>发布</strong></td>
									<td align="left" width="5%" height="25px"><strong>预览</strong></td>
									<td align="left" width="5%" height="25px"><strong>操作</strong></td>
					</tr> 	
				<logic:iterate id="item" name="scanForm" property="smallList">
					<logic:present name="item">
							<tr style=" font-size:12px">
								<td align="right"><strong>标&nbsp;题:</strong></td>
								<td align="left" colspan="7">
									<a id="<bean:write name="item" property="fileId"/>_name" ><bean:write name="item" property="fileName"/></a>
								</td>
							</tr>
							<tr style=" font-size:12px">
								<td align="left">
									<input id="<bean:write name="item" property="fileId"/>_input" name="<bean:write name="item" property="fileId"/>" type="checkbox" value="0"/>
									<script language="javascript">
										setCheck(<bean:write name="item" property="fileId"/>, iCount);
										iCount++; 
									</script>
								</td>
								<td align="center" valign="middle" height="90px" width="100px">
									<img src="<bean:write name="item" property="filePic"/>" height="90px"/>
								</td>
								<td align="left">&nbsp;</td>
								<td align="left" valign="top">
									<table  style=" font-size:12px">
										<tr>
											<td>类目:
											</td>
											<td><bean:write name="item" property="classType"/>
											</td>
										</tr>
										<tr>
											<td>级别:
											</td>
											<td><bean:write name="item" property="filePower"/>
											</td>
										</tr>
										<tr>
											<td>描述:
											</td>
											<td><bean:write name="item" property="fileDescribe"/>
											</td>
										</tr>
									</table>
								</td>
								<td align="left">&nbsp;</td>
								<td align="left" valign="top"> 
									<table  style=" font-size:12px">
										<tr>
											<td>编著:
											</td>
											<td><bean:write name="item" property="fileAuthor"/>
											</td>
										</tr>
										<tr>
											<td>时间:
											</td>
											<td><bean:write name="item" property="time"/>
											</td>
										</tr>
									</table>
								</td>
								<td align="left" valign="top">
									<input name="" type="button"
									onclick="DynaWin('<bean:write name="item" property="fileId"/>')"
									value="打开" 
									<logic:equal name="item" property="canOpen" value="0">
										disabled="disabled"
									</logic:equal>	
									/><!-- 预览 -->
								</td>
								<td align="left" valign="top">
									<%
										if(power < Constants.DOWNLOAD){
									%>
										<input name="" type="button" value="下载" onclick="aLoad(<bean:write name="item" property="fileId"/>);"/><!-- 操作 -->
									<%
										}else{
									%>
										<input name="" type="button" value="下载" disabled="disabled" />
									<% 
										}
									%>
								</td>
							</tr>
							<tr>
								<td colspan="8" width="90%" height="1px" style=" background-color:#999999"></td>
							</tr>
						
					</logic:present>
				</logic:iterate>	
			</logic:present>
			 
			</table> 

			<%
				if(power < Constants.UPLOAD){ 
			%>
			<!--处理批量上传框的添加和删除-->
			<div id="upload" style="color: #FFFFFF; font-size: 12px; background-color: #6699FF; border-bottom: 5px #6699CC solid; border-top: 5px #6699CC solid; border-left: 5px #6699CC solid; border-right: 5px #6699CC solid; visibility: hidden; position: absolute; top: 100px; left: 270px; z-index: 100000000;">
				<div style="border-bottom: 5px #FFFFFF solid; border-top: 5px #FFFFFF solid; border-left: 5px #FFFFFF solid; border-right: 5px #FFFFFF solid;">
					<script language="javascript">
						function tb_addnew()
						{
							var nId = document.all("VarNum").value;
							var num = parseInt(nId);
							
							if(num>=3)
							{
								alert("只能操作3个！");
								return;
							}
							var ls_t=document.all("tb")
							//maxcell=ls_t.rows(0).cells.length;
							mynewrow = ls_t.insertRow();
							mynewcell=mynewrow.insertCell();
							//mynewcell.innerText="a"+i;
							
							mynewcell.innerHTML = "&nbsp;地址："
							mynewcell=mynewrow.insertCell();
							//mynewcell.innerText="a"+i;
							mynewcell.innerHTML = "<input type='file' name='serch' value='浏览' />"
							document.all("VarNum").value = num+1;
						}
							
						function tb_delete()
						{
							var nId = document.all("VarNum").value;
							var num = parseInt(nId);
							if(num==1)
							{
								alert("最后一个不能删除！");
								return;
							}
							var ls_t=document.all("tb");
							
							ls_t.deleteRow() ;
							document.all("VarNum").value = num-1;
						}
					</script>
					<form name="form2" method="post" action="">
						<input type="hidden" name="VarNum" value="1"/>
						<table width="300" border="0" id="tb">
							<tr id="tr1">
								<td width="60">
									<label>
										&nbsp;地址：
									</label>
								</td>
								<td width="256">
									<label>
										<input type="file" name="serch" value="浏览" />
									</label>
								</td>
							</tr>
						</table>
						&nbsp;&nbsp;&nbsp;&nbsp;
						<input name="" type="button" value="增加" onclick="tb_addnew();"/>
						<input name="" type="button" value="减少" onclick="tb_delete();"/>
						<input type="submit" name="Submit3" value="上传" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<a style="font-size: 12px" onclick="closeFile();">关闭</a>
					</form>
				</div>
			</div>
			<% 
				}
			%>
				
			<%
				if(power < Constants.UPDATE){ 
			%>
			<script language="javascript">
				<!--
					window.document.body.onselectstart=new Function("return false");
					
					var px = 250;
					var py = 115;
					
					var text = document.getElementById('text');
					var drag_div   = parent.document.getElementById('drag_div');
					var drag_info1 = parent.document.getElementById('drag_info1');
					var drag_info2 = parent.document.getElementById('drag_info2');
					var drag_state = parent.document.getElementById('drag_state');
					
					function resetDiv(){
						parent.isDrag = false;
						
						drag_info1.innerHTML  = "&nbsp;";
						drag_info2.innerHTML  = "&nbsp;";
						drag_state.innerHTML = "<a style='color:red;'>&nbsp;&nbsp;no</a>";
						
						drag_div.style.visibility = "hidden";
						drag_div.style.left = 0;
						drag_div.style.top = 0;
					}
					
					function dragDiv(){
						if(parent.isDrag == true){
							drag_div.style.visibility = "visible";
							
							drag_div.style.left = event.x + px;
							drag_div.style.top = event.y + py;
						}	
					}
					
					function stopDiv(){
						parent.isDrag = false;
						
						resetDiv();
						document.onmousemove= null;
						document.onmouseup= null;
					}
					
					function doDiv(the_no){
						parent.isDrag = true;
						
						document.getElementById(checkBar[the_no].the_id+"_input").checked = true;
							
						if(checkBar[the_no].isCheck == false){
							checkCount++;
							checkBar[the_no].isCheck = true;
							setParentVar();
						}//alert(parent.checkBar.count);
						
						drag_state.innerHTML = "<a style='color:red;'>&nbsp;&nbsp;no</a>";
						drag_info1.innerHTML  = "&nbsp;&nbsp;正在拖拽&nbsp;"+parent.checkBar.count+"&nbsp;个文件&nbsp;";
						
						document.onmouseup= function(){stopDiv()};
						document.onmousemove= function(){dragDiv()};
					}
					
					function judgeDragDiv(){
						if(parent.isDrag == false){
							resetDiv();
							document.onmouseup= null;
							document.onmousemove= null;
						}
					}
					
					function judgeDown(the_no){
						if(parent.isDrag == false){
							doDiv(the_no);
						}
					}	
					document.onmouseover= function(){judgeDragDiv()};
				-->
			</script>
			<%
				}else{
			%>
			<script language="javascript">
				window.document.body.onselectstart=new Function("return false");
			
				function judgeDown(the_no){
				}	
			</script>
			<% 
				}
			%>
		</div>
	</body>
</html>
