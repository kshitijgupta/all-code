<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib uri="/tags/struts-bean" prefix="bean"%>
<%@ taglib uri="/tags/struts-html" prefix="html"%>
<%@ taglib uri="/tags/struts-logic" prefix="logic"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
	<head>
		<html:base/>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />

		<title>目录视图</title>

		<link rel="stylesheet" type="text/css" href="./css/tree.css"/>

	</head>

	<body>
		<script language="javascript">
<!--
	var drag_state = parent.document.getElementById('drag_state');
	var drag_info2 = parent.document.getElementById('drag_info2');
	var drag_div = parent.document.getElementById('drag_div');
	
	var inBar = null;
	var page = parent.window.frames['page'];
 -->
</script>
		<script language="javascript">
window.document.body.onselectstart=new Function("return false");

var treeRight = new Array();
for(var i = 1; i<100; i++){
	treeRight.push(new Array);	
}

var openLast = null;
	
function Node(id, name, fatherId, right, subNum, isEnd, subArray, divHtml, isOpen){
	this.id = id;
	this.name = name;
	this.fatherId = fatherId;
	this.right = right;
	
	this.subNum = subNum;
	this.isEnd = isEnd;
	this.subArray = subArray;
	
	this.divHtml = divHtml;
	this.end = "</div>"
	
	this.isOpen = isOpen;
}
//通过addNode 将所有节点存入treeRight
function addNode(id, name, fatherId, right){
	var a_node = new Node(id, name, fatherId, right, 0, true, new Array(), "", false);
	var a_tree = treeRight[right];
	a_tree.push(a_node);//alert(a_tree.length);
}

function getNode(id, right){
	var a_tree =  treeRight[right];

	for(var i=0; i<a_tree.length; i++){
		if(a_tree[i].id == id){
			return a_tree[i];
		}
	}
	return null;
}

function getLastTree(){
	var lastTree = null;
	for(var i=0; i<treeRight.length; i++){
		a_tree = treeRight[i];
		if(a_tree.length == 0){
			return lastTree;
		}
		lastTree = treeRight[i];
	}
	return null;
}

function refrashTree(){
	
}

function over(id, right){
	var bar = getNode(id, right);
	var obj = document.getElementById("div"+id);
	
	obj.className = "over";
	
	if(parent.isDrag == true){
		if(bar.right >= 0){
			drag_state.innerHTML = "<a style='color:green;'>&nbsp;&nbsp;ok</a>";
			inBar = bar;
		}else{
			drag_state.innerHTML = "<a style='color:red;'>&nbsp;&nbsp;no</a>";
			inBar = null;
		}
		
		drag_info2.innerHTML = "到"+bar.name;
	}
}

function out(id, right){
	var bar = getNode(id, right);
	var obj = document.getElementById("div"+id);
	
	obj.className = "out";
	
	if(parent.isDrag == true){
		drag_state.innerHTML = "<a style='color:red;'>&nbsp;&nbsp;no</a>";
		drag_info2.innerHTML = "&nbsp;";
		inBar = null;
	}
}

function clickDiv(id, right){
	var bar = getNode(id, right);//alert(bar.isEnd);if(openLast!=null){alert(bar.isEnd+"--------"+openLast.name);}
	var subTree = bar.subArray;
	if(bar.isOpen == false){
		document.getElementById("td_"+id).className = "open";
		for(var i=0; i<subTree.length; i++){
			document.getElementById(subTree[i].id).className = "see";
		}
		bar.isOpen = true;
		if(bar.isEnd == true){
			if(openLast != null){
				document.getElementById("td_"+openLast.id).className = "close";
				openLast.isOpen = false;
			}
			openLast = bar;//alert(openLast);
		}
	}
	else
		if(bar.isOpen == true){
			document.getElementById("td_"+id).className = "close";
			for(var i=0; i<subTree.length; i++){
				document.getElementById(subTree[i].id).className = "nosee";
			}
			bar.isOpen = false;
			if(bar.isEnd == true){
				openLast = null;
			}
		}
	//跳转
	if(parent.thisBar != null){
		document.getElementById("here_"+parent.thisBar.id).innerHTML = "";
		parent.thisBar = bar;
	}
	
	parent.thisBar = bar;
	document.getElementById("here_"+parent.thisBar.id).innerHTML = "&nbsp;&lt;&lt;";
	page.window.location = "./changePage.do?mode=1&folderId="+id+""; 
}

function creatTree(){
	var lastTree = getLastTree();
	var right = lastTree[0].right;

	for(var i=0; i<lastTree.length; i++){
		var bar = lastTree[i];
		var barFather = getNode(bar.fatherId, right-1);	
		barFather.isEnd = false;
		barFather.subArray.push(bar);
		var white = "";
		for(var k=0; k<right; k++){
			white += "&nbsp;&nbsp;";
		}
		bar.divHtml = "<div id='" +bar.id+"'"+" class='nosee'><div id='div"+bar.id+"' onclick='clickDiv("+bar.id+","+bar.right+");' onmouseout='out("+bar.id+","+bar.right+");' onmouseover='over("+bar.id+","+bar.right+");' class='out'><table><tr><td>"+white+"</td><td id='td_"+bar.id+"' class='close'>&nbsp;&nbsp;</td><td><a id='name_"+bar.id+"'>"+bar.name+"</a>&nbsp;<a id='here_"+bar.id+"' style='color:red;'></a></td></tr></table></div>";
	}
	
	right--;

	while(right > 0){
		lastTree = treeRight[right];
		
		for(var i=0; i<lastTree.length; i++){
			var bar = lastTree[i];
			var barFather = getNode(bar.fatherId, right-1);
			barFather.isEnd = false;
			barFather.subArray.push(bar);
			
			var white = "";
			for(var k=0; k<right; k++){
				white += "&nbsp;&nbsp;";
			}
			bar.divHtml = "<div id='" +bar.id+"'"+" class='nosee'><div id='div"+bar.id+"' onclick='clickDiv("+bar.id+","+bar.right+");' onmouseout='out("+bar.id+","+bar.right+");' onmouseover='over("+bar.id+","+bar.right+");' class='out'><table><tr><td>"+white+"</td><td id='td_"+bar.id+"' class='close'>&nbsp;&nbsp;</td><td><a id='name_"+bar.id+"'>"+bar.name+"</a>&nbsp;<a id='here_"+bar.id+"' style='color:red;'></a></td></tr></table></div>";
			
			var a_bar = bar.subArray;
			if(a_bar.length != 0){
				for(var j=0; j<a_bar.length; j++){
					bar.divHtml += "" + a_bar[j].divHtml + a_bar[j].end;
				}
			}
		}
		
		right --;
	}
	
	lastTree = treeRight[0];//alert(lastTree.length+"+++++"+lastTree[1].subArray.length)
	
	document.write("<div style='width:100%; position:absolute; left:0px; top: 0px;'>");
	for(var i=0; i<2; i++){//alert();
		var bar = lastTree[i];
		
		bar.divHtml = "<div id='" +bar.id+"'"+" class='frame'><div id='div"+bar.id+"' onclick='clickDiv("+bar.id+","+bar.right+");' onmouseout='' onmouseover='' class='main'><table style='height:25px'><tr valign='middle'><td></td><td id='td_"+bar.id+"' class='close'>&nbsp;&nbsp;</td><td>"+bar.name+"&nbsp;<a id='here_"+bar.id+"' style='color:red;'></a></td></tr></table></div>";
		
		var a_bar = bar.subArray;
		for(var k=0; k< bar.subArray.length; k++){
			bar.divHtml += "" + a_bar[k].divHtml + a_bar[k].end;
		}
		
		bar.divHtml += bar.end + "";//alert(bar.divHtml);
		document.write(bar.divHtml);
	}
	document.write("</div>");
}
//insert here
<logic:present name="treeForm" property="treeList">
	<logic:iterate id="item" name="treeForm" property="treeList">
		<logic:present name="item">
			addNode(<bean:write name="item" property="folderId"/>,
					'<bean:write name="item" property="foldName"/>',
					<bean:write name="item" property="fatherFolder"/>,
					<bean:write name="item" property="folderLayer"/>);
		</logic:present>
	</logic:iterate>	
</logic:present>
//insert here

creatTree();
</script>

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
	
	function callDrag(bar){
		if (bar == null) return;
		
		var url = "./doOp.do";
		var sendData = "?count="+parent.checkBar.count+"&op=move&folderId="+bar.id+"&str="+parent.checkBar.str;
		xmlHttp.open("GET", url+sendData, true);
		
		xmlHttp.onreadystatechange = function(){updatePage(bar)};
 		xmlHttp.send(null);
	}
	
	function updatePage(bar) {
		if (xmlHttp.readyState < 4) {
		}
		if (xmlHttp.readyState == 4) {
		    var response = xmlHttp.responseText;
		    if(response == "ok"){
		    	page.window.location = "./changePage.do?mode=1&folderId="+bar.id+"";
		    	alert("已移动到:"+inBar.name+"~");
		    	inBar = null;
		    }else{
		    	if(response == "no"){
		    		alert("移动失败");
		    		inBar = null;
		    	}
		    } 
		}	
	}
</script>

<script language="javascript">
<!--
	var px = 8;
	var py = 115;
	
	function resetDiv(){
		parent.isDrag = false;
	
		drag_div.style.visibility = "hidden";
		drag_div.style.left = 0;
		drag_div.style.top = 0;
	}
	
	function dragDiv(){
		drag_div.style.left = event.x + px;
		drag_div.style.top = event.y + py;
	}
	
	function stopDiv(){
		document.onmousemove= null;
		document.onmouseup = null;
		parent.isDrag = false;
		
		resetDiv();
		
		if(inBar != null){
			//传给servlet
			callDrag(inBar);
		}
	}
	
	function judgeOver(){
		if(parent.isDrag == true){
			document.onmousemove= function(){dragDiv()};
			document.onmouseup = function(){stopDiv();};
			drag_div.style.visibility = "visible";
		}
	}
	document.onmouseover = function(){judgeOver();};
-->
</script>
	</body>
</html>
